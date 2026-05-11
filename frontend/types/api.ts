export * from './models';
import { User as RawUser, Document, Subject, Class as SchoolClass } from './models';

// Extend User model with roleName if needed
export type User = RawUser & { roleName?: string };

export type { Document, Subject, SchoolClass };

export interface Grade {
  id: string;
  subject: string;
  grade: number;
  weight: number;
  description: string;
}

export interface SubjectGrades {
  subject: string;
  grades: Grade[];
  average: number;
}

export interface GradesQueryParams {
  subjectId?: string;
}

export interface PostGradeRequest {
  examId: string;
  studentId: string;
  grade: number;
}

export interface UpdateGradeRequest {
  grade: number;
}

export interface TimetableSession {
  id: string;
  startTime: string;
  endTime: string;
  remarks: string | null;
  subjectName: string;
  subjectCode: string;
  roomName: string;
  lecturerName: string;
  classDesignation: string;
}

export interface TimetableQueryParams {
  from?: string;
  to?: string;
  limit?: number;
  offset?: number;
}

export interface AttendanceSummary {
  classId: string;
  className: string;
  sessionDate: string;
  requiredLessons: number;
  attendedLessons: number;
  status: string;
}

export interface AttendanceDetail {
  id: string;
  sessionId: string;
  studentId: string;
  attendedLessons: number;
  status: string;
}

export interface UpdateUserRequest {
  language?: string;
  publishDetails?: boolean;
}

export interface AuthResponse {
  token: string;
}

export interface LoginRequest {
  email: string;
  password: string;
}

export interface RegisterRequest {
  email: string;
  password: string;
  firstName: string;
  lastName: string;
}

export interface Room {
  id: string;
  name: string;
}

export interface PaginationParams {
  limit?: number;
  offset?: number;
}
