import { fetchClient, buildQueryString } from '@/lib/fetchClient';
import { Room, Subject, SchoolClass, PaginationParams } from '@/types/api';

export const lookupService = {
  async getRooms(params: PaginationParams = {}): Promise<Room[]> {
    const query = buildQueryString(params);
    return fetchClient<Room[]>(`/lookups/rooms${query}`);
  },

  async getSubjects(params: PaginationParams = {}): Promise<Subject[]> {
    const query = buildQueryString(params);
    return fetchClient<Subject[]>(`/lookups/subjects${query}`);
  },

  async getClasses(params: PaginationParams = {}): Promise<SchoolClass[]> {
    const query = buildQueryString(params);
    return fetchClient<SchoolClass[]>(`/lookups/classes${query}`);
  },
};
