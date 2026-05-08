use crate::AppState;
use crate::handlers::health::health_check;
use axum::{Router, routing::get};

pub fn router() -> Router<AppState> {
    Router::new().route("/", get(health_check))
}
