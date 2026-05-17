import { fetchClient } from '@/lib/fetchClient';
import { TimetableEntry } from '@/types/models';

export const timetableService = {
  async getTimetable(params?: { from?: string; to?: string }): Promise<TimetableEntry[]> {
    const query = new URLSearchParams(params as any).toString();
    return fetchClient<TimetableEntry[]>(`/timetable${query ? `?${query}` : ''}`);
  },
};
