'use client';

import { useEffect, useState } from 'react';
import { TimetableSession, TimetableQueryParams } from '@/types/api';
import { timetableService } from '@/services/timetable';

export function useTimetable(params: TimetableQueryParams = {}) {
  const [sessions, setSessions] = useState<TimetableSession[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const paramsKey = JSON.stringify(params);

  useEffect(() => {
    let isMounted = true;
    const fetchTimetable = async () => {
      try {
        setLoading(true);
        setError(null);
        const data = await timetableService.getSessions(params);
        if (isMounted) setSessions(data);
      } catch (err: any) {
        if (isMounted) setError(err.message || 'Failed to fetch timetable');
      } finally {
        if (isMounted) setLoading(false);
      }
    };

    fetchTimetable();
    return () => { isMounted = false; };
  }, [paramsKey]);

  return { sessions, loading, error };
}
