'use client';

import { useEffect, useState } from 'react';
import { User } from '@/types/api';
import { userService } from '@/services/user';

export function useUser() {
  const [user, setUser] = useState<User | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    userService.getMe()
      .then(setUser)
      .catch((err: any) => setError(err.message || 'Failed to fetch user profile'))
      .finally(() => setLoading(false));
  }, []);

  return { user, loading, error };
}
