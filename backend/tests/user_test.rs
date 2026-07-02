use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use http_body_util::BodyExt;
use moka::future::Cache;
use serde_json::{Value, json};
use std::time::Duration;
use tower::ServiceExt;
use uuid::Uuid;
use wiss_estudio_backend::services::auth::create_token;
use wiss_estudio_backend::{AppState, create_app};

#[tokio::test]
async fn test_get_me() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();

    let jwt_secret = "test-secret";

    // Setup: Create a role and a user
    let role_id = Uuid::new_v4();
    sqlx::query!(
        "INSERT INTO roles (id, name) VALUES ($1, $2) ON CONFLICT DO NOTHING",
        role_id,
        "Lernende"
    )
    .execute(&pool)
    .await
    .unwrap();

    let user_id = Uuid::new_v4();
    sqlx::query!(
        "INSERT INTO users (id, role_id, email, first_name, last_name) VALUES ($1, $2, $3, $4, $5)",
        user_id,
        role_id,
        format!("test-{}@example.com", user_id),
        "Test",
        "User"
    )
    .execute(&pool)
    .await
    .unwrap();

    let token = create_token(user_id, "Lernende", jwt_secret).unwrap();

    let cache = Cache::builder()
        .max_capacity(1000)
        .time_to_live(Duration::from_secs(3600))
        .build();

    let state = AppState {
        db: pool.clone(),
        jwt_secret: jwt_secret.to_string(),
        cache,
    };

    let app = create_app(state).await;

    // Action: GET /api/v1/users/me
    let response = app
        .oneshot(
            Request::builder()
                .uri("/api/v1/users/me")
                .header("Authorization", format!("Bearer {}", token))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    // Assertion
    assert_eq!(response.status(), StatusCode::OK);

    let body = response.into_body().collect().await.unwrap().to_bytes();
    let user_resp: Value = serde_json::from_slice(&body).unwrap();

    assert_eq!(
        user_resp["email"]
            .as_str()
            .unwrap()
            .contains("@example.com"),
        true
    );
    assert_eq!(user_resp["firstName"], "Test");
    assert_eq!(user_resp["roleName"], "Lernende");
}

#[tokio::test]
async fn test_update_me() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();

    let jwt_secret = "test-secret";

    // Setup: Create a user
    let user_id = Uuid::new_v4();
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        user_id,
        format!("test-{}@example.com", user_id),
        "Test",
        "User"
    )
    .execute(&pool)
    .await
    .unwrap();

    let token = create_token(user_id, "Lernende", jwt_secret).unwrap();

    let cache = Cache::builder()
        .max_capacity(1000)
        .time_to_live(Duration::from_secs(3600))
        .build();

    let state = AppState {
        db: pool.clone(),
        jwt_secret: jwt_secret.to_string(),
        cache,
    };

    let app = create_app(state).await;

    // Action: PATCH /api/v1/users/me
    let response = app
        .oneshot(
            Request::builder()
                .method("PATCH")
                .uri("/api/v1/users/me")
                .header("Authorization", format!("Bearer {}", token))
                .header("Content-Type", "application/json")
                .body(Body::from(
                    json!({
                        "language": "en",
                        "publishDetails": true
                    })
                    .to_string(),
                ))
                .unwrap(),
        )
        .await
        .unwrap();

    // Assertion
    assert_eq!(response.status(), StatusCode::OK);

    let body = response.into_body().collect().await.unwrap().to_bytes();
    let user_resp: Value = serde_json::from_slice(&body).unwrap();

    assert_eq!(user_resp["language"], "en");
    assert_eq!(user_resp["publishDetails"], true);
}
