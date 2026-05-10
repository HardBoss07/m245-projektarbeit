export type UUID = string;
export type DateTime = string;
export type Decimal = number;
export type NaiveDate = string;

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
