use axum::{Json, http::StatusCode, response::IntoResponse};
use serde_json::json;

/// Performs a basic health check to ensure the API is running.
///
/// # Returns
/// A JSON response with status "ok" and an HTTP 200 OK status code.
pub async fn health_check() -> impl IntoResponse {
    (StatusCode::OK, Json(json!({ "status": "ok" })))
}
