use crate::{
    AppState,
    errors::AppError,
    models::grades::{GradeResponse, UpdateGradeRequest},
    services::auth::Claims,
};
use axum::{
    Json,
    extract::{Path, State},
    http::StatusCode,
    response::IntoResponse,
};
use uuid::Uuid;

/// Retrieves all grades for the authenticated student.
///
/// # Arguments
/// * `state` - Application state containing the database pool.
/// * `claims` - Authenticated user claims.
///
/// # Errors
/// Returns `AppError::Sqlx` if the database query fails.
pub async fn get_grades(
    State(state): State<AppState>,
    claims: Claims,
) -> Result<impl IntoResponse, AppError> {
    let grades = sqlx::query_as!(
        GradeResponse,
        r#"
        SELECT 
            er.id,
            s.name as subject,
            er.grade,
            e.weight_percentage as weight,
            e.description
        FROM exam_results er
        JOIN exams e ON er.exam_id = e.id
        JOIN events ev ON e.event_id = ev.id
        JOIN subjects s ON ev.subject_id = s.id
        WHERE er.student_id = $1
        "#,
        claims.sub
    )
    .fetch_all(&state.db)
    .await?;

    Ok(Json(grades))
}

/// Updates an exam grade (Teacher only).
///
/// # Arguments
/// * `state` - Application state containing the database pool.
/// * `claims` - Authenticated user claims.
/// * `result_id` - UUID of the exam result to update.
/// * `payload` - New grade value.
///
/// # Errors
/// Returns `AppError::Unauthorized` if the user is not a teacher.
/// Returns `AppError::Sqlx` if the database update fails.
pub async fn update_grade(
    State(state): State<AppState>,
    claims: Claims,
    Path(result_id): Path<Uuid>,
    Json(payload): Json<UpdateGradeRequest>,
) -> Result<impl IntoResponse, AppError> {
    if !claims.is_teacher() {
        return Err(AppError::Unauthorized);
    }

    sqlx::query!(
        r#"
        UPDATE exam_results
        SET grade = $1
        WHERE id = $2
        "#,
        payload.grade,
        result_id
    )
    .execute(&state.db)
    .await?;

    Ok(StatusCode::OK)
}
