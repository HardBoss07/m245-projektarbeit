import { fetchClient, buildQueryString } from '@/lib/fetchClient';
import { TimetableSession, TimetableQueryParams } from '@/types/api';

export const timetableService = {
  async getSessions(params: TimetableQueryParams = {}): Promise<TimetableSession[]> {
    const query = buildQueryString(params);
    return fetchClient<TimetableSession[]>(`/timetable${query}`);
  },
};
