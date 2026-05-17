'use client';

import { useState, useEffect } from 'react';
import { timetableService } from '@/services/timetable';
import { TimetableEntry } from '@/types/models';

export function useTimetable(params?: { from?: string; to?: string }) {
  const [entries, setEntries] = useState<TimetableEntry[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    timetableService.getTimetable(params)
      .then(setEntries)
      .catch((err: any) => setError(err.message))
      .finally(() => setLoading(false));
  }, [JSON.stringify(params)]);

  return { entries, loading, error };
}
