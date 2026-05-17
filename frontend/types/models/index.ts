export type UUID = string;
export type DateTime = string;
export type Decimal = number;
export type NaiveDate = string;

export type AttendanceStatus =
  | "Teilgenommen"
  | "Nicht teilgenommen entschuldigt"
  | "Offen"
  | "Abwesend 100%"
  | "Nicht teilgenommen unentschuldigt";

export interface User {
  id: UUID;
  roleId?: UUID | null;
  email: string;
  passwordHash?: string | null;
  firstName: string;
  lastName: string;
  gender?: string | null;
  birthDate?: NaiveDate | null;
  language?: string | null;
  publishDetails?: boolean | null;
  createdAt?: DateTime | null;
}

export interface Class {
  id: UUID;
  designation: string;
  shortName?: string | null;
  classType?: 'ge_modul' | 'modul' | 'semester' | 'parallelmodul' | 'ge_uberbetrieblicher_kurs' | null;
  description?: string | null;
  minAttendancePct?: Decimal | null;
}

export interface Subject {
  id: UUID;
  code: string;
  name: string;
}

export interface Exam {
  id: UUID;
  eventId: UUID;
  description: string;
  weightPercentage: Decimal;
}

export interface ExamResult {
  id: UUID;
  examId: UUID;
  studentId: UUID;
  grade: Decimal;
}

export interface Document {
  id: UUID;
  designation: string;
  filePath: string;
  documentType: 'GENERAL' | 'PERSONAL';
  targetUserId?: UUID | null;
  modifiedBy?: UUID | null;
  modifiedAt?: DateTime | null;
}

export interface RefreshToken {
  id: UUID;
  userId: UUID;
  tokenHash: string;
  familyId: UUID;
  isRevoked: boolean;
  expiresAt: DateTime;
  createdAt: DateTime;
  rotatedAt: DateTime | null;
}

export interface ClassAttendance {
  classId: UUID;
  className: string;
  sessionDate: DateTime;
  requiredLessons: Decimal;
  attendedLessons: Decimal | null;
  status: AttendanceStatus | null;
}

export interface ClassSession {
  id: UUID;
  classId: UUID;
  sessionDate: DateTime;
  requiredLessons: Decimal;
}

export interface AttendanceRecord {
  id: UUID;
  sessionId: UUID;
  studentId: UUID;
  attendedLessons: Decimal;
  status: AttendanceStatus;
}

export interface UserResponse {
  id: UUID;
  email: string;
  firstName: string;
  lastName: string;
  roleName: string | null;
  language: string;
  publishDetails: boolean;
}

export interface Grade {
  id: UUID;
  subject: string;
  grade: Decimal;
  weight: Decimal;
  description: string;
}

export interface UpdateGradeRequest {
  grade: Decimal;
}

export interface TimetableEntry {
  id: UUID;
  startTime: DateTime;
  endTime: DateTime;
  remarks: string | null;
  subjectName: string;
  subjectCode: string;
  roomName: string;
  lecturerName: string;
  classDesignation: string;
}

export interface UpdateUserPayload {
  language?: string;
  publishDetails?: boolean;
}
