use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use moka::future::Cache;
use std::time::Duration;
use tower::ServiceExt;
use wiss_tocco_backend::{AppState, create_app};

#[tokio::test]
async fn test_health_check() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();

    let cache = Cache::builder()
        .max_capacity(1000)
        .time_to_live(Duration::from_secs(3600))
        .build();

    let state = AppState {
        db: pool,
        jwt_secret: "secret".to_string(),
        cache,
    };

    let app = create_app(state).await;

    let response = app
        .oneshot(
            Request::builder()
                .uri("/api/v1/health")
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    assert_eq!(response.status(), StatusCode::OK);
}
