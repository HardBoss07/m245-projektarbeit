import { fetchClient } from '@/lib/fetchClient';
import { User, UpdateUserRequest } from '@/types/api';

export const userService = {
  async getMe(): Promise<User> {
    return fetchClient<User>('/users/me');
  },

  async updateMe(data: UpdateUserRequest): Promise<User> {
    return fetchClient<User>('/users/me', {
      method: 'PATCH',
      body: JSON.stringify(data),
    });
  },
};
