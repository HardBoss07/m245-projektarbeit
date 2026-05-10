import { fetchClient, buildQueryString } from '@/lib/fetchClient';
import { SubjectGrades, GradesQueryParams, PostGradeRequest } from '@/types/api';

export const gradesService = {
  async getGrades(params: GradesQueryParams = {}): Promise<SubjectGrades[]> {
    const query = buildQueryString(params);
    return fetchClient<SubjectGrades[]>(`/grades${query}`);
  },

  async postGrade(data: PostGradeRequest): Promise<void> {
    return fetchClient<void>('/grades', {
      method: 'POST',
      body: JSON.stringify(data),
    });
  },
};
