use chrono::{DateTime, NaiveDate, Utc};
use rust_decimal::Decimal; // Alternative: use f64 for NUMERIC types
use serde::{Deserialize, Serialize};
use sqlx::FromRow;
use uuid::Uuid;

// Enum for document_type
#[derive(sqlx::Type, Serialize, Deserialize, Debug, Clone)]
#[sqlx(type_name = "VARCHAR")]
#[serde(rename_all = "camelCase")]
pub enum DocumentType {
    #[sqlx(rename = "GENERAL")]
    General,
    #[sqlx(rename = "PERSONAL")]
    Personal,
}

// ==========================================
// 1. CORE LOOKUP TABLES
// ==========================================

/// Represents a role in the system (e.g., 'Lernende', 'Dozent', 'Admin').
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Role {
    pub id: Uuid,
    pub name: String,
}

/// Represents a room (e.g., 'ZH 208', 'Extern Extern').
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Room {
    pub id: Uuid,
    pub name: String,
}

/// Represents a class (e.g., 'IFZK-2524-017').
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Class {
    pub id: Uuid,
    pub designation: String,
}

/// Represents a subject (e.g., 'GB-ZH-IFZK-M-B21-03-IK-GE-231').
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Subject {
    pub id: Uuid,
    pub code: String,
    pub name: String,
}

// ==========================================
// 2. USERS & ENROLLMENT
// ==========================================

/// Represents a user in the system.
/// Relationships:
/// - Belongs to a Role (role_id).
/// - Can be enrolled in multiple Classes via ClassEnrollment.
/// - Can be a lecturer in TimetableSession.
/// - Can have ExamResults.
/// - Can be the target of Documents.
/// - Can modify Documents.
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct User {
    pub id: Uuid,
    pub role_id: Option<Uuid>,
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

/// Represents the many-to-many relationship between Users and Classes.
/// Relationships:
/// - Links User to Class.
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct ClassEnrollment {
    pub user_id: Uuid,
    pub class_id: Uuid,
}

// ==========================================
// 3. CURRICULUM & TIMETABLE
// ==========================================

/// Represents an event (course instance).
/// Relationships:
/// - Belongs to a Subject (subject_id).
/// - Belongs to a Class (class_id).
/// - Has multiple TimetableSessions.
/// - Has multiple Exams.
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Event {
    pub id: Uuid,
    pub subject_id: Option<Uuid>,
    pub class_id: Option<Uuid>,
    pub event_shortcut: String,
}

/// Represents a timetable session.
/// Relationships:
/// - Belongs to an Event (event_id).
/// - Belongs to a Room (room_id).
/// - Belongs to a User as lecturer (lecturer_id).
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct TimetableSession {
    pub id: Uuid,
    pub event_id: Option<Uuid>,
    pub room_id: Option<Uuid>,
    pub lecturer_id: Option<Uuid>,
    pub start_time: DateTime<Utc>,
    pub end_time: DateTime<Utc>,
    pub remarks: Option<String>,
}

// ==========================================
// 4. GRADING SYSTEM
// ==========================================

/// Represents an exam for an event.
/// Relationships:
/// - Belongs to an Event (event_id).
/// - Has multiple ExamResults.
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Exam {
    pub id: Uuid,
    pub event_id: Option<Uuid>,
    pub description: String,
    pub weight_percentage: Decimal, // Alternative: f64
}

/// Represents a student's result on an exam.
/// Relationships:
/// - Belongs to an Exam (exam_id).
/// - Belongs to a User as student (student_id).
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct ExamResult {
    pub id: Uuid,
    pub exam_id: Option<Uuid>,
    pub student_id: Option<Uuid>,
    pub grade: Decimal, // Alternative: f64
}

// ==========================================
// 5. DOCUMENTS
// ==========================================

/// Represents a document.
/// Relationships:
/// - Optionally targets a User (target_user_id).
/// - Modified by a User (modified_by).
#[derive(FromRow, Serialize, Deserialize, Debug, Clone)]
#[serde(rename_all = "camelCase")]
pub struct Document {
    pub id: Uuid,
    pub designation: String,
    pub file_path: String,
    pub document_type: DocumentType,
    pub target_user_id: Option<Uuid>,
    pub modified_by: Option<Uuid>,
    pub modified_at: Option<DateTime<Utc>>,
}
