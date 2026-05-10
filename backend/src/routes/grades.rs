use crate::AppState;
use crate::handlers::grades::{get_grades, update_grade};
use axum::{
    Router,
    routing::{get, patch},
};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/", get(get_grades))
        .route("/:id", patch(update_grade))
}
