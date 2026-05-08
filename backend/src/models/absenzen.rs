use chrono::{DateTime, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(sqlx::Type, Serialize, Deserialize, Debug, Clone, PartialEq, Eq)]
#[sqlx(type_name = "class_type_enum")]
pub enum ClassType {
    #[sqlx(rename = "GE Modul")]
    GeModul,
    #[sqlx(rename = "Modul")]
    Modul,
    #[sqlx(rename = "Semester")]
    Semester,
    #[sqlx(rename = "Parallelmodul")]
    Parallelmodul,
    #[sqlx(rename = "GE Überbetrieblicher Kurs")]
    GeUek,
}

#[derive(sqlx::Type, Serialize, Deserialize, Debug, Clone, PartialEq, Eq)]
#[sqlx(type_name = "attendance_status_enum")]
pub enum AttendanceStatus {
    #[sqlx(rename = "Teilgenommen")]
    Teilgenommen,
    #[sqlx(rename = "Nicht teilgenommen entschuldigt")]
    NichtTeilgenommenEntschuldigt,
    #[sqlx(rename = "Offen")]
    Offen,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct AttendanceOverview {
    pub class_id: Uuid,
    pub short_name: Option<String>,
    pub class_type: Option<ClassType>,
    pub description: Option<String>,
    pub soll: Decimal,
    pub besucht: Decimal,
    pub anwesenheit: i32,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct AttendanceDetail {
    pub session_date: DateTime<Utc>,
    pub required_lessons: Decimal,
    pub attended_lessons: Decimal,
    pub status: AttendanceStatus,
    pub anwesenheit: i32,
}
