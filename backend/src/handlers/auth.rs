use crate::AppState;
use crate::errors::AppError;
use crate::models::Role;
use crate::models::auth::{RefreshToken, UserAuth};
use crate::services::auth::{create_refresh_token, create_token};
use axum::{Json, extract::State, http::StatusCode, response::IntoResponse};
use axum_extra::extract::CookieJar;
use axum_extra::extract::cookie::{Cookie, SameSite};
use chrono::{Duration, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Deserialize)]
pub struct LoginRequest {
    pub email: String,
    pub password: String,
}

#[derive(Serialize)]
pub struct AuthResponse {
    pub token: String,
}

pub async fn login(
    State(_state): State<AppState>,
    _jar: CookieJar,
    Json(_payload): Json<LoginRequest>,
) -> Result<impl IntoResponse, AppError> {
    Err::<StatusCode, AppError>(AppError::Unauthorized) // Legacy auth disabled
}

pub async fn dummy_oauth(
    State(state): State<AppState>,
    jar: CookieJar,
) -> Result<impl IntoResponse, AppError> {
    // 3. Simulate Latency (Fixed 750ms for local dev)
    tokio::time::sleep(std::time::Duration::from_millis(750)).await;

    // 4. Hardcoded User Auth (matteo.bosshard@wiss-edu.ch)
    let user = sqlx::query_as::<_, crate::models::auth::UserAuth>(
        r#"
        SELECT u.id, u.password_hash, r.name as role_name
        FROM users u
        JOIN roles r ON u.role_id = r.id
        WHERE u.email = 'matteo.bosshard@wiss-edu.ch'
        "#,
    )
    .fetch_optional(&state.db)
    .await?;

    let user = match user {
        Some(u) => u,
        None => {
            tracing::error!("Dummy OAuth user not found in database. Ensure example_data.sql is loaded.");
            return Err(AppError::Unauthorized);
        }
    };

    // 5. Token Generation (Reuse existing logic)
    let token = create_token(user.id, &user.role_name, &state.jwt_secret)?;
    let refresh_token = create_refresh_token();
    let family_id = Uuid::new_v4();
    let expires_at = Utc::now() + Duration::days(7);

    // Store refresh token
    sqlx::query(
        r#"
        INSERT INTO refresh_tokens (user_id, token_hash, family_id, expires_at)
        VALUES ($1, $2, $3, $4)
        "#,
    )
    .bind(user.id)
    .bind(&refresh_token)
    .bind(family_id)
    .bind(expires_at)
    .execute(&state.db)
    .await?;

    let cookie = Cookie::build(("refresh_token", refresh_token))
        .path("/")
        .http_only(true)
        .same_site(SameSite::Strict)
        .secure(false) // Disable for local dev compatibility
        .expires(Some(std::time::SystemTime::from(expires_at).into()))
        .build();

    Ok((jar.add(cookie), Json(AuthResponse { token })))
}

pub async fn refresh(
    State(state): State<AppState>,
    jar: CookieJar,
) -> Result<impl IntoResponse, AppError> {
    let refresh_token = jar
        .get("refresh_token")
        .map(|c| c.value().to_string())
        .ok_or(AppError::Unauthorized)?;

    // 1. Find the token in the DB
    let token_record = sqlx::query_as::<_, RefreshToken>(
        r#"
        SELECT rt.*
        FROM refresh_tokens rt
        WHERE rt.token_hash = $1
        "#,
    )
    .bind(&refresh_token)
    .fetch_optional(&state.db)
    .await?
    .ok_or(AppError::Unauthorized)?;

    // 2. Check if revoked or expired
    if token_record.is_revoked || token_record.expires_at < Utc::now() {
        return Err(AppError::Unauthorized);
    }

    // 3. Reuse Detection: If already rotated, check grace period (30s)
    if let Some(rotated_at) = token_record.rotated_at {
        if rotated_at + Duration::seconds(30) < Utc::now() {
            // Potential theft! Revoke the whole family
            sqlx::query("UPDATE refresh_tokens SET is_revoked = true WHERE family_id = $1")
                .bind(token_record.family_id)
                .execute(&state.db)
                .await?;
            return Err(AppError::Unauthorized);
        }
        return Err(AppError::Unauthorized);
    }

    // Need role_name for new token
    let user_info = sqlx::query_as::<_, UserAuth>(
        r#"
        SELECT u.id, u.password_hash, r.name as role_name
        FROM users u
        JOIN roles r ON u.role_id = r.id
        WHERE u.id = $1
        "#,
    )
    .bind(token_record.user_id)
    .fetch_one(&state.db)
    .await?;

    // 4. Mark old token as rotated
    sqlx::query("UPDATE refresh_tokens SET rotated_at = $1 WHERE id = $2")
        .bind(Utc::now())
        .bind(token_record.id)
        .execute(&state.db)
        .await?;

    // 5. Issue new tokens
    let new_access_token = create_token(
        token_record.user_id,
        &user_info.role_name,
        &state.jwt_secret,
    )?;
    let new_refresh_token = create_refresh_token();
    let expires_at = Utc::now() + Duration::days(7);

    sqlx::query(
        r#"
        INSERT INTO refresh_tokens (user_id, token_hash, family_id, expires_at)
        VALUES ($1, $2, $3, $4)
        "#,
    )
    .bind(token_record.user_id)
    .bind(&new_refresh_token)
    .bind(token_record.family_id)
    .bind(expires_at)
    .execute(&state.db)
    .await?;

    let cookie = Cookie::build(("refresh_token", new_refresh_token))
        .path("/")
        .http_only(true)
        .same_site(SameSite::Strict)
        .secure(false) // Disable for local dev compatibility
        .expires(Some(std::time::SystemTime::from(expires_at).into()))
        .build();

    Ok((
        jar.add(cookie),
        Json(AuthResponse {
            token: new_access_token,
        }),
    ))
}

#[derive(Deserialize)]
pub struct RegisterRequest {
    pub email: String,
    pub password: String,
    pub first_name: String,
    pub last_name: String,
}

pub async fn register(
    State(state): State<AppState>,
    Json(payload): Json<RegisterRequest>,
) -> Result<impl IntoResponse, AppError> {
    let password_hash = crate::services::hash::hash_password(&payload.password)?;

    // Get a default role (e.g., 'Lernende')
    let role = sqlx::query_as::<_, Role>("SELECT id, name FROM roles WHERE name = 'Lernende'")
        .fetch_one(&state.db)
        .await?;

    sqlx::query(
        r#"
        INSERT INTO users (email, password_hash, first_name, last_name, role_id)
        VALUES ($1, $2, $3, $4, $5)
        "#,
    )
    .bind(payload.email)
    .bind(password_hash)
    .bind(payload.first_name)
    .bind(payload.last_name)
    .bind(role.id)
    .execute(&state.db)
    .await?;

    Ok((
        StatusCode::CREATED,
        Json(serde_json::json!({ "message": "User created" })),
    ))
}
