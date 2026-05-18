import { fetchClient, setAccessToken } from '@/lib/fetchClient';
import { AuthResponse, LoginRequest, RegisterRequest } from '@/types/api';

/**
 * Service providing authentication-related API interactions.
 */
export const authService = {
  /**
   * Authenticates a user and stores the access token.
   * @param {LoginRequest} data - The login credentials.
   * @returns {Promise<AuthResponse>} The authentication response.
   */
  async login(data: LoginRequest): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/login', {
      method: 'POST',
      body: JSON.stringify(data),
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },

  /**
   * Performs dummy OAuth authentication for development purposes.
   * @returns {Promise<AuthResponse>} The authentication response.
   */
  async dummyOAuth(): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/dummy-oauth', {
      method: 'POST',
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },

  /**
   * Registers a new user.
   * @param {RegisterRequest} data - The registration information.
   * @returns {Promise<void>}
   */
  async register(data: RegisterRequest): Promise<void> {
    return fetchClient<void>('/auth/register', {
      method: 'POST',
      body: JSON.stringify(data),
      skipAuth: true,
    });
  },

  /**
   * Logs out the user and clears the access token.
   * @returns {Promise<void>}
   */
  async logout(): Promise<void> {
    setAccessToken(null);
    // Optional: Call a backend logout endpoint if it exists to clear cookies
  },

  /**
   * Refreshes the authentication session.
   * @returns {Promise<AuthResponse>} The refreshed authentication response.
   */
  async refresh(): Promise<AuthResponse> {
    const res = await fetchClient<AuthResponse>('/auth/refresh', {
      method: 'POST',
      skipAuth: true,
    });
    setAccessToken(res.token);
    return res;
  },
};
