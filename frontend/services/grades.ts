import { fetchClient } from '@/lib/fetchClient';
import { Grade, UpdateGradeRequest } from '@/types/models';

export const gradesService = {
  async getGrades(): Promise<Grade[]> {
    return fetchClient<Grade[]>('/grades');
  },

  async updateGrade(id: string, payload: UpdateGradeRequest): Promise<Grade> {
    return fetchClient<Grade>(`/grades/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(payload),
    });
  },
};
