import { fetchClient, setAccessToken } from '@/lib/fetchClient';
import { AuthResponse, LoginRequest, RegisterRequest } from '@/types/api';

export const authService = {
  async login(data: LoginRequest): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/login', {
      method: 'POST',
      body: JSON.stringify(data),
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },

  async dummyOAuth(): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/dummy-oauth', {
      method: 'POST',
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },

  async register(data: RegisterRequest): Promise<void> {
    return fetchClient<void>('/auth/register', {
      method: 'POST',
      body: JSON.stringify(data),
      skipAuth: true,
    });
  },

  async logout(): Promise<void> {
    setAccessToken(null);
    // Optional: Call a backend logout endpoint if it exists to clear cookies
  },

  async refresh(): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/refresh', {
      method: 'POST',
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },
};
