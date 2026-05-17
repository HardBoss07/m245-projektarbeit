'use client';

import { useState, useEffect } from 'react';
import { userService } from '@/services/user';
import { UserResponse, UpdateUserPayload } from '@/types/models';

export function useUser() {
  const [user, setUser] = useState<UserResponse | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    userService.getMe()
      .then(setUser)
      .catch((err: any) => setError(err.message))
      .finally(() => setLoading(false));
  }, []);

  const updateProfile = async (payload: UpdateUserPayload) => {
    const updated = await userService.updateMe(payload);
    setUser(updated);
  };

  return { user, loading, error, updateProfile };
}
