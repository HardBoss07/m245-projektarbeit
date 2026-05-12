use chrono::{DateTime, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use sqlx::{FromRow, Type};
use uuid::Uuid;

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type)]
#[sqlx(type_name = "attendance_status_enum")]
pub enum AttendanceStatus {
    Teilgenommen,
    #[sqlx(rename = "Nicht teilgenommen entschuldigt")]
    NichtTeilgenommenEntschuldigt,
    Offen,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct ClassAttendance {
    pub class_id: Uuid,
    pub class_name: String,
    pub session_date: DateTime<Utc>,
    pub required_lessons: Decimal,
    pub attended_lessons: Option<Decimal>,
    pub status: Option<String>,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct ClassSession {
    pub id: Uuid,
    pub class_id: Uuid,
    pub session_date: DateTime<Utc>,
    pub required_lessons: Decimal,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
#[serde(rename_all = "camelCase")]
pub struct AttendanceRecord {
    pub id: Uuid,
    pub session_id: Uuid,
    pub student_id: Uuid,
    pub attended_lessons: Decimal,
    pub status: AttendanceStatus,
}
