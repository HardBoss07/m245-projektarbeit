"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";

/**
 * Hook to manage authentication state and session checking.
 *
 * @returns {Object} Authentication state.
 * @returns {boolean} returns.isAuthenticated - True if user is authenticated.
 * @returns {boolean} returns.isLoading - True if auth check is still in progress.
 */
export function useAuth() {
  const router = useRouter();
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      router.push("/");
    } else {
      setIsAuthenticated(true);
    }
    setIsLoading(false);
  }, [router]);

  return { isAuthenticated, isLoading };
}
