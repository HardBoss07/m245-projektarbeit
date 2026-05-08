use crate::AppState;
use crate::errors::AppError;
use crate::models::User;
use crate::services::auth::Claims;
use axum::{
    extract::{Json, State},
    response::IntoResponse,
};
use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize)]
pub struct UpdateUserPayload {
    pub language: Option<String>,
    pub publish_details: Option<bool>,
}

#[derive(Debug, Serialize)]
pub struct UserResponse {
    pub id: uuid::Uuid,
    pub email: String,
    pub first_name: String,
    pub last_name: String,
    pub role_name: Option<String>,
    pub language: String,
    pub publish_details: bool,
}

impl From<User> for UserResponse {
    fn from(user: User) -> Self {
        Self {
            id: user.id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            role_name: None, // We'll populate this if needed
            language: user.language.unwrap_or_else(|| "de".to_string()),
            publish_details: user.publish_details.unwrap_or(false),
        }
    }
}

/// GET /api/v1/users/me
/// Returns the profile details of the currently authenticated user.
pub async fn get_me(
    State(state): State<AppState>,
    claims: Claims,
) -> Result<impl IntoResponse, AppError> {
    let user = sqlx::query_as!(
        User,
        r#"
        SELECT * FROM users WHERE id = $1
        "#,
        claims.sub
    )
    .fetch_optional(&state.db)
    .await?
    .ok_or_else(|| AppError::NotFound("User not found".to_string()))?;

    // Also get the role name
    let role_name = if let Some(role_id) = user.role_id {
        sqlx::query!("SELECT name FROM roles WHERE id = $1", role_id)
            .fetch_optional(&state.db)
            .await?
            .map(|r| r.name)
    } else {
        None
    };

    let mut response: UserResponse = user.into();
    response.role_name = role_name;

    Ok(Json(response))
}

/// PATCH /api/v1/users/me
/// Updates the profile preferences for the currently authenticated user.
pub async fn update_me(
    State(state): State<AppState>,
    claims: Claims,
    Json(payload): Json<UpdateUserPayload>,
) -> Result<impl IntoResponse, AppError> {
    let user = sqlx::query_as!(
        User,
        r#"
        UPDATE users
        SET 
            language = COALESCE($1, language),
            publish_details = COALESCE($2, publish_details)
        WHERE id = $3
        RETURNING *
        "#,
        payload.language,
        payload.publish_details,
        claims.sub
    )
    .fetch_optional(&state.db)
    .await?
    .ok_or_else(|| AppError::NotFound("User not found".to_string()))?;

    let mut response: UserResponse = user.clone().into();

    // Fetch role name for complete response
    let role_name = if let Some(role_id) = user.role_id {
        sqlx::query!("SELECT name FROM roles WHERE id = $1", role_id)
            .fetch_optional(&state.db)
            .await?
            .map(|r| r.name)
    } else {
        None
    };
    response.role_name = role_name;

    Ok(Json(response))
}
