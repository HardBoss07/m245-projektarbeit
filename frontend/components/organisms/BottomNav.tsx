"use client";

import React from 'react';
import { usePathname } from 'next/navigation';
import { NavTab } from '@/components/molecules/NavTab';

export const BottomNav: React.FC = () => {
  const pathname = usePathname();

  const navItems = [
    { href: '/dashboard', icon: 'dashboard', label: 'Home' },
    { href: '/schedule', icon: 'calendar_today', label: 'Plan' },
    { href: '/grades', icon: 'grade', label: 'Noten' },
    { href: '/absences', icon: 'history', label: 'Absenzen' },
  ];

  if (pathname === '/') return null;

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-50 bg-white border-t border-outline-variant shadow-[0_-4px_16px_rgba(0,0,0,0.05)] h-20 w-full lg:hidden">
      <div className="grid grid-cols-4 w-full h-full">
        {navItems.map((item) => {
          const isActive = pathname === item.href || pathname.startsWith(item.href + '/');
          return (
            <div key={item.href} className="w-full h-full flex items-center justify-center">
              <NavTab
                href={item.href}
                icon={item.icon}
                label={item.label}
                isActive={isActive}
              />
            </div>
          );
        })}
      </div>
    </nav>
  );
};
