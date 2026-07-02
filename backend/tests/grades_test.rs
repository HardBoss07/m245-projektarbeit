use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use http_body_util::BodyExt;
use moka::future::Cache;
use serde_json::{Value, json};
use tower::ServiceExt;
use uuid::Uuid;
use wiss_estudio_backend::services::auth::create_token;
use wiss_estudio_backend::{AppState, create_app};

#[tokio::test]
async fn test_grades_and_averages() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();
    let jwt_secret = "test-secret";

    // Setup: Create a student, subject, class, and exams
    let student_id = Uuid::new_v4();
    let class_id = Uuid::new_v4();
    let subject_id = Uuid::new_v4();
    let event_id = Uuid::new_v4();
    let exam1_id = Uuid::new_v4();
    let exam2_id = Uuid::new_v4();

    sqlx::query!(
        "INSERT INTO subjects (id, code, name) VALUES ($1, $2, $3)",
        subject_id,
        "MATH",
        "Mathematics"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO classes (id, designation) VALUES ($1, $2)",
        class_id,
        "M101"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        student_id,
        format!("s-{}@test.com", student_id),
        "Student",
        "GradeTest"
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
        format!("EV-G-{}", event_id)
    )
    .execute(&pool)
    .await
    .unwrap();

    // Exam 1: 50%, Grade: 5.0
    sqlx::query!("INSERT INTO exams (id, event_id, description, weight_percentage) VALUES ($1, $2, 'Test 1', 50)", exam1_id, event_id).execute(&pool).await.unwrap();
    sqlx::query!(
        "INSERT INTO exam_results (exam_id, student_id, grade) VALUES ($1, $2, 5.0)",
        exam1_id,
        student_id
    )
    .execute(&pool)
    .await
    .unwrap();

    // Exam 2: 50%, Grade: 6.0
    sqlx::query!("INSERT INTO exams (id, event_id, description, weight_percentage) VALUES ($1, $2, 'Test 2', 50)", exam2_id, event_id).execute(&pool).await.unwrap();
    sqlx::query!(
        "INSERT INTO exam_results (exam_id, student_id, grade) VALUES ($1, $2, 6.0)",
        exam2_id,
        student_id
    )
    .execute(&pool)
    .await
    .unwrap();

    let cache = Cache::builder().build();
    let state = AppState {
        db: pool,
        jwt_secret: jwt_secret.to_string(),
        cache,
    };
    let app = create_app(state).await;
    let token = create_token(student_id, "Lernende", jwt_secret).unwrap();

    // Scenario: Student requests grades. Average should be 5.5.
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/grades")
                .header("Authorization", format!("Bearer {}", token))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    assert_eq!(resp.status(), StatusCode::OK);
    let body = resp.into_body().collect().await.unwrap().to_bytes();
    let grades: Value = serde_json::from_slice(&body).unwrap();

    let subject = &grades.as_array().unwrap()[0];
    assert_eq!(subject["averageGrade"], "5.5");
    assert_eq!(subject["grades"].as_array().unwrap().len(), 2);
}

#[tokio::test]
async fn test_publish_grade_rbac() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();
    let jwt_secret = "test-secret";

    let student_id = Uuid::new_v4();
    let teacher_id = Uuid::new_v4();
    let exam_id = Uuid::new_v4();

    // Setup: Create exam
    sqlx::query!(
        "INSERT INTO exams (id, description, weight_percentage) VALUES ($1, 'Final', 100)",
        exam_id
    )
    .execute(&pool)
    .await
    .unwrap();

    let cache = Cache::builder().build();
    let state = AppState {
        db: pool,
        jwt_secret: jwt_secret.to_string(),
        cache,
    };
    let app = create_app(state).await;

    // Scenario 1: Student tries to publish a grade. Should be Forbidden.
    let student_token = create_token(student_id, "Lernende", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .method("POST")
                .uri("/api/v1/grades")
                .header("Authorization", format!("Bearer {}", student_token))
                .header("Content-Type", "application/json")
                .body(Body::from(
                    json!({
                        "examId": exam_id,
                        "studentId": student_id,
                        "grade": 6.0
                    })
                    .to_string(),
                ))
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::FORBIDDEN);

    // Scenario 2: Teacher publishes a grade. Should be Created.
    let teacher_token = create_token(teacher_id, "Dozent", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .method("POST")
                .uri("/api/v1/grades")
                .header("Authorization", format!("Bearer {}", teacher_token))
                .header("Content-Type", "application/json")
                .body(Body::from(
                    json!({
                        "examId": exam_id,
                        "studentId": student_id,
                        "grade": 6.0
                    })
                    .to_string(),
                ))
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::CREATED);
}
