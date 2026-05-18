use crate::AppState;
use crate::errors::AppError;
use crate::models::pagination::Pagination;
use crate::services::auth::Claims;
use axum::{
    Json,
    extract::{Query, State},
};
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use uuid::Uuid;

/// Query parameters for filtering and paginating timetable sessions.
#[derive(Debug, Deserialize)]
pub struct TimetableQuery {
    /// Start date filter (RFC3339).
    pub from: Option<String>,
    /// End date filter (RFC3339).
    pub to: Option<String>,
    #[serde(flatten)]
    pub pagination: Pagination,
}

fn parse_date(date_str: &Option<String>, default: DateTime<Utc>) -> DateTime<Utc> {
    date_str
        .as_ref()
        .and_then(|s| {
            DateTime::parse_from_rfc3339(s)
                .map(|dt| dt.with_timezone(&Utc))
                .ok()
                .or_else(|| s.parse::<DateTime<Utc>>().ok())
        })
        .unwrap_or(default)
}

#[derive(Debug, Serialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct TimetableEntry {
    pub id: Uuid,
    pub start_time: DateTime<Utc>,
    pub end_time: DateTime<Utc>,
    pub remarks: Option<String>,
    pub subject_name: String,
    pub subject_code: String,
    pub room_name: String,
    pub lecturer_name: String,
    pub class_designation: String,
}

/// Retrieves the timetable sessions for the authenticated user (student or teacher).
///
/// # Arguments
/// * `state` - Application state.
/// * `claims` - Authenticated user claims.
/// * `query` - Optional filtering (from, to) and pagination parameters.
///
/// # Returns
/// A JSON array of `TimetableEntry` objects for the specified time range and page.
///
/// # Errors
/// Returns `AppError::Sqlx` if the database query fails.
pub async fn get_timetable(
    State(state): State<AppState>,
    claims: Claims,
    Query(query): Query<TimetableQuery>,
) -> Result<Json<Vec<TimetableEntry>>, AppError> {
    let from = parse_date(&query.from, Utc::now() - chrono::Duration::days(7));
    let to = parse_date(&query.to, Utc::now() + chrono::Duration::days(7));

    // We join several tables to get a complete view.
    // Logic:
    // - If student: show sessions for classes they are enrolled in.
    // - If teacher: show sessions where they are the lecturer.
    // For now, we show all sessions related to the user's role/enrolment.

    let sessions = sqlx::query_as!(
        TimetableEntry,
        r#"
        SELECT 
            ts.id,
            ts.start_time,
            ts.end_time,
            ts.remarks,
            s.name as "subject_name!",
            s.code as "subject_code!",
            r.name as "room_name!",
            CONCAT(u_lec.first_name, ' ', u_lec.last_name) as "lecturer_name!",
            c.designation as "class_designation!"
        FROM timetable_sessions ts
        JOIN events e ON ts.event_id = e.id
        JOIN subjects s ON e.subject_id = s.id
        JOIN rooms r ON ts.room_id = r.id
        JOIN users u_lec ON ts.lecturer_id = u_lec.id
        JOIN classes c ON e.class_id = c.id
        WHERE ts.start_time >= $1 AND ts.end_time <= $2
        AND (
            -- Student check: enrolled in the class
            EXISTS (
                SELECT 1 FROM class_enrollments ce 
                WHERE ce.class_id = e.class_id AND ce.user_id = $3
            )
            OR 
            -- Teacher check: is the lecturer
            ts.lecturer_id = $3
        )
        ORDER BY ts.start_time ASC
        LIMIT $4 OFFSET $5
        "#,
        from,
        to,
        claims.sub,
        query.pagination.limit(),
        query.pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    Ok(Json(sessions))
}
