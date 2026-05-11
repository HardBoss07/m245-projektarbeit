'use client';

import { useEffect, useState } from 'react';
import { AttendanceSummary } from '@/types/api';
import { attendanceService } from '@/services/attendance';

export function useAttendance() {
  const [summary, setSummary] = useState<AttendanceSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    attendanceService.getSummary()
      .then(setSummary)
      .catch((err: any) => setError(err.message || 'Failed to fetch attendance data'))
      .finally(() => setLoading(false));
  }, []);

  return { summary, loading, error };
}
