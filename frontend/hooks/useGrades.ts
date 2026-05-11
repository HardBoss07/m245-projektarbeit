'use client';

import { useEffect, useState } from 'react';
import { Grade } from '@/types/api';
import { gradesService } from '@/services/grades';

export function useGrades() {
  const [grades, setGrades] = useState<Grade[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchGrades = async () => {
    try {
      setLoading(true);
      // Backend returns a flat list of grades.
      const data = await gradesService.getGrades();
      // If gradesService.getGrades returns SubjectGrades[], we might need to flatten it or keep it.
      // Assuming we aligned it to return Grade[] for now based on backend response.
      setGrades(data as unknown as Grade[]);
    } catch (err: any) {
      setError(err.message || 'Failed to fetch grades');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchGrades();
  }, []);

  const updateGrade = async (id: string, value: number) => {
    try {
      await gradesService.updateGrade(id, { grade: value });
      await fetchGrades();
    } catch (err: any) {
      setError(err.message || 'Failed to update grade');
    }
  };

  return { grades, loading, error, updateGrade };
}
