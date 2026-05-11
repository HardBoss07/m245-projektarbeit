/**
 * Core HTTP Client for Wiss Tocco Redesign
 * Implements JWT management and 401 retry queue logic.
 */

import { AuthResponse } from '@/types/api';

type FetchOptions = RequestInit & {
  skipAuth?: boolean;
};

let accessToken: string | null = null;
let isRefreshing = false;
let refreshQueue: Array<(token: string) => void> = [];

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || '/api/v1';

/**
 * Updates the in-memory access token.
 */
export const setAccessToken = (token: string | null) => {
  accessToken = token;
};

/**
 * Core fetch wrapper with auth and retry logic.
 */
export const fetchClient = async <T>(
  endpoint: string,
  options: FetchOptions = {}
): Promise<T> => {
  const { skipAuth, ...init } = options;
  const url = endpoint.startsWith('http') ? endpoint : `${API_BASE_URL}${endpoint}`;

  // Build headers
  const headers = new Headers(init.headers);
  if (!skipAuth && accessToken) {
    headers.set('Authorization', `Bearer ${accessToken}`);
  }
  if (!headers.has('Content-Type') && !(init.body instanceof FormData)) {
    headers.set('Content-Type', 'application/json');
  }

  const response = await fetch(url, {
    ...init,
    headers,
    credentials: 'include', // Ensure cookies (refresh_token) are sent
  });

  // Handle 401 Unauthorized - trigger refresh
  if (response.status === 401 && !skipAuth) {
    if (!isRefreshing) {
      isRefreshing = true;
      try {
        const newAccessToken = await refreshAccessToken();
        setAccessToken(newAccessToken);
        isRefreshing = false;
        
        // Resolve queue
        refreshQueue.forEach((cb) => cb(newAccessToken));
        refreshQueue = [];
      } catch (error) {
        isRefreshing = false;
        refreshQueue = [];
        setAccessToken(null);
        // Dispatch logout event or handle redirect if needed
        window.dispatchEvent(new CustomEvent('api-session-expired'));
        throw error;
      }
    }

    // Wait for refresh to complete
    return new Promise<T>((resolve) => {
      refreshQueue.push((token) => {
        resolve(fetchClient<T>(endpoint, { ...options }));
      });
    });
  }

  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    throw new Error(errorData.message || `API Error: ${response.status} ${response.statusText}`);
  }

  // Handle empty responses (like 201 Created or 204 No Content)
  if (response.status === 201 || response.status === 204) {
    return {} as T;
  }

  return response.json();
};

/**
 * Private helper to call the refresh endpoint.
 */
async function refreshAccessToken(): Promise<string> {
  const response = await fetch(`${API_BASE_URL}/auth/refresh`, {
    method: 'POST',
    credentials: 'include',
  });

  if (!response.ok) {
    throw new Error('Refresh failed');
  }

  const data: AuthResponse = await response.json();
  return data.token;
}

/**
 * Helper to build query strings from objects.
 */
export const buildQueryString = (params: Record<string, any>): string => {
  const searchParams = new URLSearchParams();
  Object.entries(params).forEach(([key, value]) => {
    if (value !== undefined && value !== null) {
      searchParams.append(key, value.toString());
    }
  });
  const query = searchParams.toString();
  return query ? `?${query}` : '';
};
