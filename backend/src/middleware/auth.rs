use crate::AppState;
use crate::errors::AppError;
use crate::services::auth::decode_token;
use axum::{
    extract::FromRequestParts,
    http::request::Parts,
};
use crate::services::auth::Claims;

impl FromRequestParts<AppState> for Claims {
    type Rejection = AppError;

    async fn from_request_parts(parts: &mut Parts, state: &AppState) -> Result<Self, Self::Rejection> {
        let auth_header = parts
            .headers
            .get(axum::http::header::AUTHORIZATION)
            .and_then(|value| value.to_str().ok())
            .ok_or(AppError::Unauthorized)?;

        if !auth_header.starts_with("Bearer ") {
            return Err(AppError::Unauthorized);
        }

        let token = &auth_header[7..];
        let claims = decode_token(token, &state.jwt_secret)?;

        Ok(claims)
    }
}
