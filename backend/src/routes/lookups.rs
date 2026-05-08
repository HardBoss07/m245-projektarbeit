use crate::AppState;
use crate::handlers::lookups::{list_classes, list_rooms, list_subjects};
use axum::{Router, routing::get};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/rooms", get(list_rooms))
        .route("/subjects", get(list_subjects))
        .route("/classes", get(list_classes))
}
