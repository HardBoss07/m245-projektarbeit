'use client';

import { useEffect, useState } from 'react';
import { TimetableSession, TimetableQueryParams } from '@/types/api';
import { timetableService } from '@/services/timetable';

export function useTimetable(params: TimetableQueryParams = {}) {
  const [sessions, setSessions] = useState<TimetableSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchTimetable = async () => {
      try {
        setLoading(true);
        const data = await timetableService.getSessions(params);
        setSessions(data);
      } catch (err: any) {
        setError(err.message || 'Failed to fetch timetable');
      } finally {
        setLoading(false);
      }
    };

    fetchTimetable();
  }, [params.from, params.to, params.limit, params.offset]);

  return { sessions, loading, error };
}
