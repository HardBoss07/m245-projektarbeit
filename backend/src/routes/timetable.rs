use crate::AppState;
use crate::handlers::timetable::get_timetable;
use axum::{Router, routing::get};

pub fn router() -> Router<AppState> {
    Router::new().route("/", get(get_timetable))
}
