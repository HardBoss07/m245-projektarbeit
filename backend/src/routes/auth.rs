use crate::AppState;
use crate::handlers::auth::{login, register};
use axum::{Router, routing::post};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/login", post(login))
        .route("/register", post(register))
}
