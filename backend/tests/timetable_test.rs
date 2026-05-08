use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use chrono::{Duration as ChronoDuration, Utc};
use http_body_util::BodyExt;
use moka::future::Cache;
use serde_json::Value;
use std::time::Duration;
use tower::ServiceExt;
use uuid::Uuid;
use wiss_tocco_backend::services::auth::create_token;
use wiss_tocco_backend::{AppState, create_app};

#[tokio::test]
async fn test_get_timetable_scoping() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();
    let jwt_secret = "test-secret";

    // Setup: Create two users (Student and Teacher) and a shared session
    let student_id = Uuid::new_v4();
    let teacher_id = Uuid::new_v4();
    let class_id = Uuid::new_v4();
    let subject_id = Uuid::new_v4();
    let room_id = Uuid::new_v4();
    let event_id = Uuid::new_v4();

    sqlx::query!("INSERT INTO roles (name) VALUES ('Lernende'), ('Dozent') ON CONFLICT DO NOTHING")
        .execute(&pool)
        .await
        .unwrap();

    sqlx::query!(
        "INSERT INTO subjects (id, code, name) VALUES ($1, $2, $3)",
        subject_id,
        "SUB1",
        "Test Subject"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO rooms (id, name) VALUES ($1, $2)",
        room_id,
        "Room 101"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO classes (id, designation) VALUES ($1, $2)",
        class_id,
        "CLASS-A"
    )
    .execute(&pool)
    .await
    .unwrap();

    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        student_id,
        format!("s-{}@test.com", student_id),
        "Student",
        "One"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        teacher_id,
        format!("t-{}@test.com", teacher_id),
        "Teacher",
        "One"
    )
    .execute(&pool)
    .await
    .unwrap();

    sqlx::query!(
        "INSERT INTO class_enrollments (user_id, class_id) VALUES ($1, $2)",
        student_id,
        class_id
    )
    .execute(&pool)
    .await
    .unwrap();

    sqlx::query!(
        "INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES ($1, $2, $3, $4)",
        event_id,
        subject_id,
        class_id,
        format!("EV-{}", event_id)
    )
    .execute(&pool)
    .await
    .unwrap();

    let now = Utc::now();
    sqlx::query!(
        "INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time) VALUES ($1, $2, $3, $4, $5)",
        event_id, room_id, teacher_id, now, now + ChronoDuration::hours(2)
    ).execute(&pool).await.unwrap();

    let cache = Cache::builder().build();
    let state = AppState {
        db: pool,
        jwt_secret: jwt_secret.to_string(),
        cache,
    };
    let app = create_app(state).await;

    /// Scenario 1: Student requests timetable. Should see the session because of enrollment.
    let student_token = create_token(student_id, "Lernende", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/timetable")
                .header("Authorization", format!("Bearer {}", student_token))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::OK);
    let body = resp.into_body().collect().await.unwrap().to_bytes();
    let sessions: Value = serde_json::from_slice(&body).unwrap();
    assert_eq!(sessions.as_array().unwrap().len(), 1);

    /// Scenario 2: Teacher requests timetable. Should see the session because they are the lecturer.
    let teacher_token = create_token(teacher_id, "Dozent", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/timetable")
                .header("Authorization", format!("Bearer {}", teacher_token))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::OK);
}
