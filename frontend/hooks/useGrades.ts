'use client';

import { useState, useEffect } from 'react';
import { gradesService } from '@/services/grades';
import { Grade } from '@/types/models';

export function useGrades() {
  const [grades, setGrades] = useState<Grade[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    gradesService.getGrades()
      .then(setGrades)
      .catch((err: any) => setError(err.message))
      .finally(() => setLoading(false));
  }, []);

  return { grades, loading, error };
}
