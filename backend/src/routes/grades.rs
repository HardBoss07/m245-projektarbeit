use crate::AppState;
use crate::handlers::grades::{get_my_grades, publish_grade};
use axum::{
    Router,
    routing::{get, post},
};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/", get(get_my_grades))
        .route("/", post(publish_grade))
}
