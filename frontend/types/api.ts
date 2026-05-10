export interface Grade {
  id: string;
  subject: string;
  grade: number;
  weight: number;
  date: string;
  lastUpdated: string;
}

export interface ClassAttendance {
  classId: string;
  className: string;
  sessionDate: string;
  requiredLessons: number;
  attendedLessons: number;
  status: string;
}
