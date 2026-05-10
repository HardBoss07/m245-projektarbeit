'use client';

import { useEffect, useState } from 'react';
import { Grade } from '@/types/api';
import { fetchClient } from '@/lib/fetchClient';

export function useGrades() {
  const [grades, setGrades] = useState<Grade[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchClient('/api/v1/grades')
      .then((res) => res.json())
      .then(setGrades)
      .finally(() => setLoading(false));
  }, []);

  const updateGrade = async (id: string, data: Partial<Grade>) => {
    await fetchClient(`/api/v1/grades/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(data),
    });
    // Re-fetch logic here
  };

  return { grades, loading, updateGrade };
}
