use chrono::{DateTime, NaiveDate, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use sqlx::{FromRow, Type};
use uuid::Uuid;

// ==========================================
// 1. Newtype Identifiers
// ==========================================

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct RoleId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct RoomId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct ClassId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct SubjectId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct UserId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct EventId(pub Uuid);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, sqlx::Type)]
#[sqlx(transparent)]
pub struct ExamId(pub Uuid);

// ==========================================
// 2. ENUMs
// ==========================================

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type)]
#[sqlx(type_name = "class_type_enum", rename_all = "snake_case")]
pub enum ClassType {
    #[sqlx(rename = "GE Modul")]
    GeModul,
    Modul,
    Semester,
    Parallelmodul,
    #[sqlx(rename = "GE Überbetrieblicher Kurs")]
    GeUberbetrieblicherKurs,
}

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type)]
#[sqlx(type_name = "attendance_status_enum", rename_all = "snake_case")]
pub enum AttendanceStatus {
    Teilgenommen,
    #[sqlx(rename = "Nicht teilgenommen entschuldigt")]
    NichtTeilgenommenEntschuldigt,
    Offen,
}

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type)]
#[sqlx(type_name = "varchar")]
pub enum DocumentType {
    GENERAL,
    PERSONAL,
}

// ==========================================
// 3. Tables
// ==========================================

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Role {
    pub id: RoleId,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Room {
    pub id: RoomId,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Class {
    pub id: ClassId,
    pub designation: String,
    pub short_name: Option<String>,
    pub class_type: Option<ClassType>,
    pub description: Option<String>,
    pub min_attendance_pct: Option<Decimal>,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Subject {
    pub id: SubjectId,
    pub code: String,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct User {
    pub id: UserId,
    pub role_id: Option<RoleId>,
    pub email: String,
    pub password_hash: Option<String>,
    pub first_name: String,
    pub last_name: String,
    pub gender: Option<String>,
    pub birth_date: Option<NaiveDate>,
    pub language: Option<String>,
    pub publish_details: Option<bool>,
    pub created_at: Option<DateTime<Utc>>,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct ClassEnrollment {
    pub user_id: UserId,
    pub class_id: ClassId,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Event {
    pub id: EventId,
    pub subject_id: SubjectId,
    pub class_id: ClassId,
    pub event_shortcut: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct TimetableSession {
    pub id: Uuid,
    pub event_id: EventId,
    pub room_id: Option<RoomId>,
    pub lecturer_id: Option<UserId>,
    pub start_time: DateTime<Utc>,
    pub end_time: DateTime<Utc>,
    pub remarks: Option<String>,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Exam {
    pub id: ExamId,
    pub event_id: EventId,
    pub description: String,
    pub weight_percentage: Decimal,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct ExamResult {
    pub id: Uuid,
    pub exam_id: ExamId,
    pub student_id: UserId,
    pub grade: Decimal,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct Document {
    pub id: Uuid,
    pub designation: String,
    pub file_path: String,
    pub document_type: DocumentType,
    pub target_user_id: Option<UserId>,
    pub modified_by: Option<UserId>,
    pub modified_at: Option<DateTime<Utc>>,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct ClassSession {
    pub id: Uuid,
    pub class_id: ClassId,
    pub session_date: DateTime<Utc>,
    pub required_lessons: Decimal,
}

#[derive(Debug, Serialize, Deserialize, FromRow)]
pub struct AttendanceRecord {
    pub id: Uuid,
    pub session_id: Uuid,
    pub student_id: UserId,
    pub attended_lessons: Decimal,
    pub status: AttendanceStatus,
}
