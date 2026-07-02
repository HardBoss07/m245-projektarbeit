use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use http_body_util::BodyExt;
use moka::future::Cache;
use serde_json::Value;
use std::time::Duration;
use tower::ServiceExt;
use uuid::Uuid;
use wiss_estudio_backend::{AppState, create_app};

#[tokio::test]
async fn test_list_rooms_cached() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();

    // Setup: Insert a test room
    let room_id = Uuid::new_v4();
    let room_name = format!("Test Room {}", room_id);
    sqlx::query!(
        "INSERT INTO rooms (id, name) VALUES ($1, $2)",
        room_id,
        room_name
    )
    .execute(&pool)
    .await
    .unwrap();

    let cache = Cache::builder()
        .max_capacity(1000)
        .time_to_live(Duration::from_secs(3600))
        .build();

    let state = AppState {
        db: pool.clone(),
        jwt_secret: "secret".to_string(),
        cache: cache.clone(),
    };

    let app = create_app(state).await;

    // Scenario: First request fetches from DB and populates cache.
    let response = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/lookups/rooms?limit=10&offset=0")
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    assert_eq!(response.status(), StatusCode::OK);
    let body = response.into_body().collect().await.unwrap().to_bytes();
    let rooms: Value = serde_json::from_slice(&body).unwrap();
    assert!(
        rooms
            .as_array()
            .unwrap()
            .iter()
            .any(|r| r["name"] == room_name)
    );

    // Verify cache population
    let cache_key = "rooms:10:0".to_string();
    assert!(cache.get(&cache_key).await.is_some());

    // Scenario: Second request should be served from cache (even if we delete from DB)
    sqlx::query!("DELETE FROM rooms WHERE id = $1", room_id)
        .execute(&pool)
        .await
        .unwrap();

    let response_cached = app
        .oneshot(
            Request::builder()
                .uri("/api/v1/lookups/rooms?limit=10&offset=0")
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    assert_eq!(response_cached.status(), StatusCode::OK);
    let body_cached = response_cached
        .into_body()
        .collect()
        .await
        .unwrap()
        .to_bytes();
    let rooms_cached: Value = serde_json::from_slice(&body_cached).unwrap();
    assert!(
        rooms_cached
            .as_array()
            .unwrap()
            .iter()
            .any(|r| r["name"] == room_name)
    );
}
