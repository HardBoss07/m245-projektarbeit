use crate::AppState;
use crate::handlers::user::{get_me, update_me};
use axum::{
    Router,
    routing::{get, patch},
};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/me", get(get_me))
        .route("/me", patch(update_me))
}
