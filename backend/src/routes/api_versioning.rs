use axum::Router;

use crate::AppState;

pub fn api_v1_routes(state: AppState) -> Router {
    Router::new()
        .nest("/health", super::health::router())
        .nest("/auth", super::auth::router())
        .nest("/users", super::user::router())
        .nest("/timetable", super::timetable::router())
        .nest("/grades", super::grades::router())
        .nest("/lookups", super::lookups::router())
        .nest("/documents", super::documents::router())
        .nest("/absenzen", super::absenzen::router())
        .with_state(state)
}
