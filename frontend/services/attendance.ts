import { fetchClient } from '@/lib/fetchClient';
import { ClassAttendance, AttendanceRecord } from '@/types/models';

export const attendanceService = {
  async getSummary(): Promise<ClassAttendance[]> {
    return fetchClient<ClassAttendance[]>('/absenzen');
  },

  async getDetails(classId: string): Promise<AttendanceRecord[]> {
    return fetchClient<AttendanceRecord[]>(`/absenzen/${classId}`);
  },
};
