use crate::AppState;
use crate::errors::AppError;
use crate::models::absenzen::{AttendanceDetail, AttendanceOverview, AttendanceStatus, ClassType};
use crate::services::auth::Claims;
use axum::{
    Json,
    extract::{Path, State},
};
use rust_decimal::Decimal;
use rust_decimal::prelude::ToPrimitive;
use uuid::Uuid;

/// GET /api/v1/absenzen
/// Aggregated overview of required (SOLL) vs attended (Besucht) lessons.
pub async fn get_attendance_overview(
    State(state): State<AppState>,
    claims: Claims,
) -> Result<Json<Vec<AttendanceOverview>>, AppError> {
    let student_id = claims.sub;

    let rows = sqlx::query!(
        r#"
        SELECT 
            c.id,
            c.short_name,
            c.class_type as "class_type: ClassType",
            c.description,
            COALESCE(SUM(cs.required_lessons), 0) as "soll: Decimal",
            COALESCE(SUM(ar.attended_lessons), 0) as "besucht: Decimal"
        FROM classes c
        JOIN class_enrollments ce ON c.id = ce.class_id
        LEFT JOIN class_sessions cs ON c.id = cs.class_id
        LEFT JOIN attendance_records ar ON cs.id = ar.session_id AND ar.student_id = ce.user_id
        WHERE ce.user_id = $1
        GROUP BY c.id, c.short_name, c.class_type, c.description
        "#,
        student_id
    )
    .fetch_all(&state.db)
    .await?;

    let overview = rows
        .into_iter()
        .map(|row| {
            let soll = row.soll.unwrap_or_default();
            let besucht = row.besucht.unwrap_or_default();

            let anwesenheit = if !soll.is_zero() {
                ((besucht / soll) * Decimal::from(100))
                    .to_i32()
                    .unwrap_or(0)
            } else {
                100 // Default to 100% if no lessons are required yet
            };

            AttendanceOverview {
                class_id: row.id,
                short_name: row.short_name,
                class_type: row.class_type,
                description: row.description,
                soll,
                besucht,
                anwesenheit,
            }
        })
        .collect();

    Ok(Json(overview))
}

/// GET /api/v1/absenzen/:class_id
/// Detailed timeline view of individual session attendance.
pub async fn get_attendance_detail(
    State(state): State<AppState>,
    claims: Claims,
    Path(class_id): Path<Uuid>,
) -> Result<Json<Vec<AttendanceDetail>>, AppError> {
    let student_id = claims.sub;

    let rows = sqlx::query!(
        r#"
        SELECT 
            cs.session_date,
            cs.required_lessons as "required_lessons: Decimal",
            ar.attended_lessons as "attended_lessons: Decimal",
            ar.status as "status: AttendanceStatus"
        FROM class_sessions cs
        JOIN attendance_records ar ON cs.id = ar.session_id
        WHERE cs.class_id = $1 AND ar.student_id = $2
        ORDER BY cs.session_date DESC
        "#,
        class_id,
        student_id
    )
    .fetch_all(&state.db)
    .await?;

    let details = rows
        .into_iter()
        .map(|row| {
            let required = row.required_lessons;
            let attended = row.attended_lessons;

            let anwesenheit = if !required.is_zero() {
                ((attended / required) * Decimal::from(100))
                    .to_i32()
                    .unwrap_or(0)
            } else {
                100
            };

            AttendanceDetail {
                session_date: row.session_date,
                required_lessons: required,
                attended_lessons: attended,
                status: row.status,
                anwesenheit,
            }
        })
        .collect();

    Ok(Json(details))
}
