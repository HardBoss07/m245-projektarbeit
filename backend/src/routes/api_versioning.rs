use axum::{Router, middleware};

use crate::AppState;

pub fn api_v1_routes(state: AppState) -> Router {
    // 1. Public Routes (No Auth Required)
    let public_routes = Router::new()
        .nest("/health", super::health::router())
        .nest("/auth", super::auth::router());

    // 2. Protected Routes (Auth Required)
    let protected_routes = Router::new()
        .nest("/users", super::user::router())
        .nest("/timetable", super::timetable::router())
        .nest("/grades", super::grades::router())
        .nest("/lookups", super::lookups::router())
        .nest("/documents", super::documents::router())
        .nest("/absenzen", super::absenzen::router())
        .layer(middleware::from_fn_with_state(
            state.clone(),
            crate::middleware::auth::auth_middleware,
        ));

    Router::new()
        .merge(public_routes)
        .merge(protected_routes)
        .with_state(state)
}
