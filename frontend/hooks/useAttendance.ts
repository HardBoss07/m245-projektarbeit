'use client';

import { useState, useEffect } from 'react';
import { attendanceService } from '@/services/attendance';
import { ClassAttendance, AttendanceRecord } from '@/types/models';

export function useAttendance() {
  const [summary, setSummary] = useState<ClassAttendance[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    attendanceService.getSummary()
      .then(setSummary)
      .catch((err: any) => setError(err.message))
      .finally(() => setLoading(false));
  }, []);

  return { summary, loading, error };
}

export function useAttendanceDetails(classId: string) {
  const [details, setDetails] = useState<AttendanceRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!classId) return;
    attendanceService.getDetails(classId)
      .then(setDetails)
      .catch((err: any) => setError(err.message))
      .finally(() => setLoading(false));
  }, [classId]);

  return { details, loading, error };
}
