"use client";

import React from 'react';
import { usePathname } from 'next/navigation';
import { SidebarNav } from './SidebarNav';

interface AppLayoutProps {
  children: React.ReactNode;
}

export const AppLayout: React.FC<AppLayoutProps> = ({ children }) => {
  const pathname = usePathname();
  const isLoginPage = pathname === '/';

  if (isLoginPage) {
    return <>{children}</>;
  }

  return (
    <div className="min-h-screen flex flex-col lg:flex-row bg-surface-container-low text-on-surface">
      <SidebarNav />
      <div className="flex-1 lg:pl-64 w-full min-h-screen bg-surface">
        {children}
      </div>
    </div>
  );
};
