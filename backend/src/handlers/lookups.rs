use crate::AppState;
use crate::errors::AppError;
use crate::models::{Class, Pagination, Room, Subject};
use axum::{
    Json,
    extract::{Query, State},
};
use serde_json::json;
use std::sync::Arc;

/// GET /api/v1/lookups/rooms
pub async fn list_rooms(
    State(state): State<AppState>,
    Query(pagination): Query<Pagination>,
) -> Result<Json<Vec<Room>>, AppError> {
    let cache_key = format!("rooms:{}:{}", pagination.limit(), pagination.offset());

    if let Some(cached) = state.cache.get(&cache_key).await {
        return Ok(Json(serde_json::from_value((*cached).clone()).unwrap()));
    }

    let rooms = sqlx::query_as!(
        Room,
        r#"SELECT id as "id: _", name FROM rooms ORDER BY name LIMIT $1 OFFSET $2"#,
        pagination.limit(),
        pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    state.cache.insert(cache_key, Arc::new(json!(rooms))).await;

    Ok(Json(rooms))
}

/// GET /api/v1/lookups/subjects
pub async fn list_subjects(
    State(state): State<AppState>,
    Query(pagination): Query<Pagination>,
) -> Result<Json<Vec<Subject>>, AppError> {
    let cache_key = format!("subjects:{}:{}", pagination.limit(), pagination.offset());

    if let Some(cached) = state.cache.get(&cache_key).await {
        return Ok(Json(serde_json::from_value((*cached).clone()).unwrap()));
    }

    let subjects = sqlx::query_as!(
        Subject,
        r#"SELECT id as "id: _", code, name FROM subjects ORDER BY name LIMIT $1 OFFSET $2"#,
        pagination.limit(),
        pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    state
        .cache
        .insert(cache_key, Arc::new(json!(subjects)))
        .await;

    Ok(Json(subjects))
}

/// GET /api/v1/lookups/classes
pub async fn list_classes(
    State(state): State<AppState>,
    Query(pagination): Query<Pagination>,
) -> Result<Json<Vec<Class>>, AppError> {
    let cache_key = format!("classes:{}:{}", pagination.limit(), pagination.offset());

    if let Some(cached) = state.cache.get(&cache_key).await {
        return Ok(Json(serde_json::from_value((*cached).clone()).unwrap()));
    }

    let classes = sqlx::query_as!(
        Class,
        r#"
        SELECT 
            id as "id: _", 
            designation, 
            short_name, 
            class_type as "class_type: crate::models::ClassType", 
            description, 
            min_attendance_pct
        FROM classes 
        ORDER BY designation 
        LIMIT $1 OFFSET $2
        "#,
        pagination.limit(),
        pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    state
        .cache
        .insert(cache_key, Arc::new(json!(classes)))
        .await;

    Ok(Json(classes))
}
