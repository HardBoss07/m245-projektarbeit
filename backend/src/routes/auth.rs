use crate::AppState;
use crate::handlers::auth::{dummy_oauth, refresh};
use axum::{Router, routing::post};

pub fn router() -> Router<AppState> {
    Router::new()
        // .route("/login", post(login)) // Legacy auth disabled
        // .route("/register", post(register)) // Legacy auth disabled
        .route("/dummy-oauth", post(dummy_oauth))
        .route("/refresh", post(refresh))
}
