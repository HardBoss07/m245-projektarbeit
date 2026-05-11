pub mod errors;
pub mod handlers;
pub mod middleware;
pub mod models;
pub mod routes;
pub mod services;

use axum::Router;
use moka::future::Cache;
use std::sync::Arc;
use std::time::Duration;
use tower_http::compression::CompressionLayer;
use tower_http::timeout::TimeoutLayer;
use tower_http::trace::TraceLayer;

#[derive(Clone)]
pub struct AppState {
    pub db: sqlx::PgPool,
    pub jwt_secret: String,
    pub cache: Cache<String, Arc<serde_json::Value>>,
}

pub async fn create_app(state: AppState) -> Router {
    let frontend_url =
        std::env::var("FRONTEND_URL").unwrap_or_else(|_| "http://localhost:3000".to_string());

    // CORS configuration
    let cors = middleware::cors::cors_layer(&frontend_url);

    Router::new()
        .nest("/api/v1", routes::api_versioning::api_v1_routes(state))
        .layer(cors)
        .layer(TraceLayer::new_for_http())
        .layer(TimeoutLayer::with_status_code(
            axum::http::StatusCode::REQUEST_TIMEOUT,
            Duration::from_secs(30),
        ))
        .layer(CompressionLayer::new())
        .fallback(handlers::not_found)
}
