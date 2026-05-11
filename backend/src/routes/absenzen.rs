use crate::AppState;
use crate::handlers::absenzen::{get_attendance_detail, get_attendance_overview};
use axum::{Router, routing::get};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/", get(get_attendance_overview))
        .route("/{class_id}", get(get_attendance_detail))
}
