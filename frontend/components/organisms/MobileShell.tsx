import React from 'react';
import { Header } from './Header';
import { BottomNav } from './BottomNav';

interface MobileShellProps {
  children: React.ReactNode;
  title: string;
  subtitle?: string;
  showBack?: boolean;
}

export const MobileShell: React.FC<MobileShellProps> = ({
  children,
  title,
  subtitle,
  showBack,
}) => {
  return (
    <div className="flex flex-col min-h-screen bg-surface">
      <Header title={title} subtitle={subtitle} showBack={showBack} />
      <main className="flex-1 w-full max-w-7xl mx-auto pb-[92px] lg:pb-12 px-0 md:px-6 lg:px-8">
        {children}
      </main>
      <BottomNav />
    </div>
  );
};
