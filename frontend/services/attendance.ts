import { fetchClient } from '@/lib/fetchClient';
import { AttendanceSummary, AttendanceDetail } from '@/types/api';

export const attendanceService = {
  async getSummary(): Promise<AttendanceSummary[]> {
    return fetchClient<AttendanceSummary[]>('/absenzen');
  },

  async getDetails(classId: string): Promise<AttendanceDetail[]> {
    return fetchClient<AttendanceDetail[]>(`/absenzen/${classId}`);
  },
};
