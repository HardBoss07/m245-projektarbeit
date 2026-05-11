import { fetchClient, buildQueryString } from '@/lib/fetchClient';
import { Grade, GradesQueryParams, UpdateGradeRequest } from '@/types/api';

export const gradesService = {
  async getGrades(params: GradesQueryParams = {}): Promise<Grade[]> {
    const query = buildQueryString(params);
    return fetchClient<Grade[]>(`/grades${query}`);
  },

  async updateGrade(id: string, data: { grade: number }): Promise<void> {
    return fetchClient<void>(`/grades/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(data),
    });
  },
};
