use crate::AppState;
use crate::errors::AppError;
use crate::middleware::auth::check_role;
use crate::models::pagination::Pagination;
use crate::services::auth::Claims;
use axum::{
    Json,
    extract::{Query, State},
};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Deserialize)]
pub struct GradesQuery {
    pub event_id: Option<Uuid>,
    #[serde(flatten)]
    pub pagination: Pagination,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct GradeEntry {
    pub exam_id: Uuid,
    pub exam_description: String,
    pub grade: Decimal,
    pub weight_percentage: Decimal,
}

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct SubjectGrade {
    pub event_id: Uuid,
    pub subject_name: String,
    pub subject_code: String,
    pub average_grade: Option<Decimal>,
    pub grades: Vec<GradeEntry>,
}

#[derive(Debug, Deserialize)]
pub struct CreateGradePayload {
    pub exam_id: Uuid,
    pub student_id: Uuid,
    pub grade: Decimal,
}

/// GET /api/v1/grades
/// Retrieves the grades for the authenticated student, grouped by subject.
pub async fn get_my_grades(
    State(state): State<AppState>,
    claims: Claims,
    Query(query): Query<GradesQuery>,
) -> Result<Json<Vec<SubjectGrade>>, AppError> {
    // 1. Fetch all events (subjects) the student is enrolled in
    let events = sqlx::query!(
        r#"
        SELECT DISTINCT e.id, s.name as subject_name, s.code as subject_code
        FROM events e
        JOIN subjects s ON e.subject_id = s.id
        JOIN class_enrollments ce ON e.class_id = ce.class_id
        WHERE ce.user_id = $1 AND ($2::UUID IS NULL OR e.id = $2)
        LIMIT $3 OFFSET $4
        "#,
        claims.sub,
        query.event_id,
        query.pagination.limit(),
        query.pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    let mut response = Vec::new();

    for event in events {
        // 2. Fetch grades for this event
        let results = sqlx::query_as!(
            GradeEntry,
            r#"
            SELECT 
                ex.id as exam_id,
                ex.description as exam_description,
                er.grade as "grade: Decimal",
                ex.weight_percentage as "weight_percentage: Decimal"
            FROM exams ex
            JOIN exam_results er ON ex.id = er.exam_id
            WHERE ex.event_id = $1 AND er.student_id = $2
            "#,
            event.id,
            claims.sub
        )
        .fetch_all(&state.db)
        .await?;

        // 3. Calculate weighted average
        let mut total_weight = Decimal::ZERO;
        let mut weighted_sum = Decimal::ZERO;

        for res in &results {
            weighted_sum += res.grade * res.weight_percentage;
            total_weight += res.weight_percentage;
        }

        let average_grade = if !total_weight.is_zero() {
            Some(weighted_sum / total_weight)
        } else {
            None
        };

        response.push(SubjectGrade {
            event_id: event.id,
            subject_name: event.subject_name,
            subject_code: event.subject_code,
            average_grade,
            grades: results,
        });
    }

    Ok(Json(response))
}

/// POST /api/v1/grades
/// Publishes a new grade for a student. Only accessible by teachers (Dozenten).
pub async fn publish_grade(
    State(state): State<AppState>,
    claims: Claims,
    Json(payload): Json<CreateGradePayload>,
) -> Result<impl axum::response::IntoResponse, AppError> {
    check_role(&claims, "Dozent")?;

    sqlx::query!(
        r#"
        INSERT INTO exam_results (exam_id, student_id, grade)
        VALUES ($1, $2, $3)
        ON CONFLICT (exam_id, student_id) 
        DO UPDATE SET grade = EXCLUDED.grade
        "#,
        payload.exam_id,
        payload.student_id,
        payload.grade
    )
    .execute(&state.db)
    .await?;

    Ok(axum::http::StatusCode::CREATED)
}
