use chrono::{DateTime, NaiveDate, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use sqlx::{FromRow, Type};
use uuid::Uuid;

pub mod absenzen;
pub mod auth;
pub mod grades;
pub mod pagination;
pub mod types;

pub use pagination::Pagination;

// ==========================================
// 1. Newtype Identifiers
// ==========================================

macro_rules! define_id {
    ($name:ident) => {
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize, Type)]
        #[sqlx(transparent)]
        pub struct $name(pub Uuid);

        impl From<Uuid> for $name {
            fn from(id: Uuid) -> Self {
                Self(id)
            }
        }

        impl From<$name> for Uuid {
            fn from(id: $name) -> Self {
                id.0
            }
        }
    };
}

define_id!(RoleId);
define_id!(RoomId);
define_id!(ClassId);
define_id!(SubjectId);
define_id!(UserId);
define_id!(EventId);
define_id!(ExamId);

// ==========================================
// 2. ENUMs
// ==========================================

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type, PartialEq)]
#[sqlx(type_name = "class_type_enum")]
#[serde(rename_all = "snake_case")]
pub enum ClassType {
    #[sqlx(rename = "GE Modul")]
    GeModul,
    Modul,
    Semester,
    Parallelmodul,
    #[sqlx(rename = "GE Überbetrieblicher Kurs")]
    GeUberbetrieblicherKurs,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct Role {
    pub id: RoleId,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct Room {
    pub id: RoomId,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
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

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Class {
    pub id: ClassId,
    pub designation: String,
    pub short_name: Option<String>,
    pub class_type: Option<ClassType>,
    pub description: Option<String>,
    pub min_attendance_pct: Option<Decimal>,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Subject {
    pub id: SubjectId,
    pub code: String,
    pub name: String,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Exam {
    pub id: ExamId,
    pub event_id: EventId,
    pub description: String,
    pub weight_percentage: Decimal,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
#[serde(rename_all = "camelCase")]
pub struct ExamResult {
    pub id: Uuid,
    pub exam_id: ExamId,
    pub student_id: UserId,
    pub grade: Decimal,
}

#[derive(Debug, Clone, Copy, Serialize, Deserialize, Type, PartialEq)]
#[sqlx(type_name = "varchar")]
pub enum DocumentType {
    GENERAL,
    PERSONAL,
}

#[derive(Debug, Serialize, Deserialize, FromRow, Clone)]
pub struct Document {
    pub id: Uuid,
    pub designation: String,
    pub file_path: String,
    pub document_type: DocumentType,
    pub target_user_id: Option<UserId>,
    pub modified_by: Option<UserId>,
    pub modified_at: Option<DateTime<Utc>>,
}
