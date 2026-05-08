use crate::errors::AppError;
use axum::{Json, http::StatusCode, response::IntoResponse};
use serde_json::json;

pub async fn login() -> Result<impl IntoResponse, AppError> {
    Ok((StatusCode::OK, Json(json!({ "token": "dummy-token" }))))
}

pub async fn register() -> Result<impl IntoResponse, AppError> {
    Ok((
        StatusCode::CREATED,
        Json(json!({ "message": "User created" })),
    ))
}
