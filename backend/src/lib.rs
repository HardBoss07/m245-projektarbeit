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
use tower_http::cors::CorsLayer;
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
    let cors = CorsLayer::new()
        .allow_origin(frontend_url.parse::<axum::http::HeaderValue>().unwrap())
        .allow_methods([
            axum::http::Method::GET,
            axum::http::Method::POST,
            axum::http::Method::PATCH,
            axum::http::Method::DELETE,
        ])
        .allow_headers([
            axum::http::header::AUTHORIZATION,
            axum::http::header::CONTENT_TYPE,
        ])
        .allow_credentials(true);

    Router::new()
        .nest("/api/v1/health", routes::health::router())
        .nest("/api/v1/auth", routes::auth::router())
        .nest("/api/v1/users", routes::user::router())
        .nest("/api/v1/timetable", routes::timetable::router())
        .nest("/api/v1/grades", routes::grades::router())
        .nest("/api/v1/lookups", routes::lookups::router())
        .nest("/api/v1/documents", routes::documents::router())
        .nest("/api/v1/absenzen", routes::absenzen::router())
        .with_state(state)
        .layer(cors)
        .layer(TraceLayer::new_for_http())
        .layer(TimeoutLayer::with_status_code(
            axum::http::StatusCode::REQUEST_TIMEOUT,
            Duration::from_secs(30),
        ))
        .layer(CompressionLayer::new())
}
