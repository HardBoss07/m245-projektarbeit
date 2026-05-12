use crate::AppState;
use crate::errors::AppError;
use crate::services::auth::Claims;
use crate::services::auth::decode_token;
use axum::{extract::FromRequestParts, http::request::Parts};

impl FromRequestParts<AppState> for Claims {
    type Rejection = AppError;

    async fn from_request_parts(
        parts: &mut Parts,
        state: &AppState,
    ) -> Result<Self, Self::Rejection> {
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

pub struct RequireRole(pub String);

impl FromRequestParts<AppState> for RequireRole {
    type Rejection = AppError;

    async fn from_request_parts(
        parts: &mut Parts,
        state: &AppState,
    ) -> Result<Self, Self::Rejection> {
        let claims = Claims::from_request_parts(parts, state).await?;
        Ok(RequireRole(claims.role))
    }
}

pub fn check_role(claims: &Claims, required_role: &str) -> Result<(), AppError> {
    if claims.role == required_role || claims.role == "Admin" {
        Ok(())
    } else {
        Err(AppError::Forbidden)
    }
}

pub async fn auth_middleware(
    claims: Claims,
    request: axum::extract::Request,
    next: axum::middleware::Next,
) -> Result<axum::response::Response, AppError> {
    // The Claims extractor will already return 401 if the token is missing/invalid
    // This middleware just ensures the extractor is run for the request
    let mut request = request;
    request.extensions_mut().insert(claims);
    Ok(next.run(request).await)
}
