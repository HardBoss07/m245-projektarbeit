pub mod absenzen;
pub mod auth;
pub mod documents;
pub mod grades;
pub mod health;
pub mod lookups;
pub mod timetable;
pub mod user;

pub async fn not_found() -> (axum::http::StatusCode, &'static str) {
    (axum::http::StatusCode::NOT_FOUND, "404 - Route not found")
}
