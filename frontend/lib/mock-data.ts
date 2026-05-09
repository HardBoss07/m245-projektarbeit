export interface Grade {
  id: string;
  value: number;
  weight: number;
  date: string;
  title: string;
  comment?: string;
}

export interface Subject {
  id: string;
  name: string;
  category: string;
  averageGrade: number;
  totalAbsences: number; // in hours
  unexcusedAbsences: number;
  grades: Grade[];
}

export interface AbsenceRecord {
  id: string;
  date: string;
  duration: number; // in hours
  status: 'excused' | 'unexcused' | 'pending';
  reason?: string;
}

export interface ScheduleEvent {
  id: string;
  subject: string;
  room: string;
  teacher: string;
  startTime: string;
  endTime: string;
  day: 'Mo' | 'Di' | 'Mi' | 'Do' | 'Fr' | 'Sa' | 'So';
}

export const MOCK_SUBJECTS: Subject[] = [
  {
    id: 'm245',
    name: 'Applikations-Sicherheit',
    category: 'Modul 245 • Informatik',
    averageGrade: 5.2,
    totalAbsences: 4,
    unexcusedAbsences: 0,
    grades: [
      { id: 'g1', value: 5.5, weight: 1, date: '2026-05-04', title: 'Lineare Algebra' },
      { id: 'g2', value: 4.8, weight: 1, date: '2026-04-20', title: 'Security Basics' },
    ]
  },
  {
    id: 'm122',
    name: 'Shell Scripting',
    category: 'Modul 122 • Informatik',
    averageGrade: 4.8,
    totalAbsences: 8,
    unexcusedAbsences: 2,
    grades: [
      { id: 'g3', value: 4.5, weight: 1, date: '2026-05-02', title: 'Scripting Fundamentals' },
      { id: 'g4', value: 5.2, weight: 1, date: '2026-04-15', title: 'Advanced Pipelines' },
    ]
  },
  {
    id: 'eng',
    name: 'Englisch',
    category: 'Allgemeinbildung',
    averageGrade: 5.5,
    totalAbsences: 2,
    unexcusedAbsences: 0,
    grades: [
      { id: 'g5', value: 6.0, weight: 0.5, date: '2026-04-10', title: 'Vocabulary Test' },
      { id: 'g6', value: 5.0, weight: 1, date: '2026-04-29', title: 'Business Correspondence' },
    ]
  }
];

export const MOCK_ABSENCES: Record<string, AbsenceRecord[]> = {
  'm245': [
    { id: 'a1', date: '2026-05-01', duration: 2, status: 'excused', reason: 'Arztbesuch' },
    { id: 'a2', date: '2026-04-15', duration: 2, status: 'excused', reason: 'Krankheit' },
  ],
  'm122': [
    { id: 'a3', date: '2026-05-04', duration: 2, status: 'unexcused', reason: 'Verschlafen' },
    { id: 'a4', date: '2026-04-20', duration: 2, status: 'pending' },
    { id: 'a5', date: '2026-04-06', duration: 4, status: 'excused' },
  ]
};

export const MOCK_SCHEDULE: ScheduleEvent[] = [
  { id: 's1', subject: 'Informatik', room: 'R302', teacher: 'Herr Müller', startTime: '08:00', endTime: '09:30', day: 'Mo' },
  { id: 's2', subject: 'Mathematik', room: 'R105', teacher: 'Frau Schmid', startTime: '10:00', endTime: '11:30', day: 'Mo' },
  { id: 's3', subject: 'Modul 245', room: 'R302', teacher: 'Herr Müller', startTime: '13:00', endTime: '16:30', day: 'Fr' },
  { id: 's4', subject: 'Englisch', room: 'R210', teacher: 'Frau Weber', startTime: '15:00', endTime: '16:30', day: 'Di' },
];
