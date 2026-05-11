use crate::{
    AppState,
    errors::AppError,
    models::absenzen::{AttendanceRecord, AttendanceStatus, ClassAttendance},
    services::auth::Claims,
};
use axum::{
    Json,
    extract::{Path, State},
    response::IntoResponse,
};
use uuid::Uuid;

pub async fn get_attendance_overview(
    State(state): State<AppState>,
    claims: Claims,
) -> Result<impl IntoResponse, AppError> {
    let attendance = sqlx::query_as!(
        ClassAttendance,
        r#"
        SELECT 
            c.id as "class_id",
            c.designation as "class_name",
            cs.session_date,
            cs.required_lessons,
            ar.attended_lessons as "attended_lessons?",
            ar.status::text as "status?"
        FROM class_sessions cs
        JOIN classes c ON cs.class_id = c.id
        LEFT JOIN attendance_records ar ON cs.id = ar.session_id AND ar.student_id = $1
        WHERE c.id IN (SELECT class_id FROM class_enrollments WHERE user_id = $1)
        ORDER BY cs.session_date DESC
        "#,
        claims.sub
    )
    .fetch_all(&state.db)
    .await?;

    Ok(Json(attendance))
}

pub async fn get_attendance_detail(
    State(state): State<AppState>,
    claims: Claims,
    Path(class_id): Path<Uuid>,
) -> Result<impl IntoResponse, AppError> {
    let details = sqlx::query_as!(
        AttendanceRecord,
        r#"
        SELECT 
            ar.id,
            ar.session_id,
            ar.student_id,
            ar.attended_lessons,
            ar.status as "status: AttendanceStatus"
        FROM attendance_records ar
        JOIN class_sessions cs ON ar.session_id = cs.id
        WHERE ar.student_id = $1 AND cs.class_id = $2
        ORDER BY cs.session_date DESC
        "#,
        claims.sub,
        class_id
    )
    .fetch_all(&state.db)
    .await?;

    Ok(Json(details))
}
