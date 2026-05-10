/**
 * API Types for Wiss Tocco Redesign
 */

export type UserRole = 'Lernende' | 'Dozent' | 'Admin';

export interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  roleName: UserRole;
  language: string;
  publishDetails: boolean;
}

export interface AuthResponse {
  token: string;
}

export interface RegisterRequest {
  email: string;
  password?: string;
  first_name: string;
  last_name: string;
}

export interface LoginRequest {
  email: string;
  password?: string;
}

export interface UpdateUserRequest {
  language?: string;
  publish_details?: boolean;
}

export interface TimetableSession {
  id: string;
  startTime: string; // ISO8601
  endTime: string;   // ISO8601
  remarks: string | null;
  subjectName: string;
  subjectCode: string;
  roomName: string;
  lecturerName: string;
  classDesignation: string;
}

export interface GradeEntry {
  examId: string;
  examDescription: string;
  grade: number;
  weightPercentage: number;
}

export interface SubjectGrades {
  eventId: string;
  subjectName: string;
  subjectCode: string;
  averageGrade: number;
  grades: GradeEntry[];
}

export interface PostGradeRequest {
  exam_id: string;
  student_id: string;
  grade: number;
}

export interface Room {
  id: string;
  name: string;
}

export interface Subject {
  id: string;
  code: string;
  name: string;
}

export interface SchoolClass {
  id: string;
  designation: string;
}

export type DocumentType = 'GENERAL' | 'PERSONAL';

export interface Document {
  id: string;
  designation: string;
  documentType: DocumentType;
  modifiedAt: string; // ISO8601
}

export interface AttendanceSummary {
  classId: string;
  shortName: string;
  classType: string;
  description: string;
  soll: number;
  besucht: number;
  anwesenheit: number;
}

export interface AttendanceDetail {
  sessionDate: string; // ISO8601
  requiredLessons: number;
  attendedLessons: number;
  status: string;
  anwesenheit: number;
}

export interface PaginationParams {
  limit?: number;
  offset?: number;
}

export interface TimetableQueryParams extends PaginationParams {
  from?: string;
  to?: string;
}

export interface GradesQueryParams extends PaginationParams {
  event_id?: string;
}
