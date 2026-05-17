import { fetchClient } from '@/lib/fetchClient';
import { UserResponse, UpdateUserPayload } from '@/types/models';

export const userService = {
  async getMe(): Promise<UserResponse> {
    return fetchClient<UserResponse>('/users/me');
  },

  async updateMe(payload: UpdateUserPayload): Promise<UserResponse> {
    return fetchClient<UserResponse>('/users/me', {
      method: 'PATCH',
      body: JSON.stringify(payload),
    });
  },
};
