"use client";

import React from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import { Icon } from '@/components/atoms/Icon';
import { Typography } from '@/components/atoms/Typography';
import { useUser } from '@/hooks/useUser';

export const SidebarNav: React.FC = () => {
  const pathname = usePathname();
  const { user } = useUser();

  const navigationItems = [
    { href: '/dashboard', icon: 'dashboard', label: 'Dashboard' },
    { href: '/schedule', icon: 'Stundenplan', label: 'Stundenplan' },
    { href: '/absences', icon: 'history', label: 'Absenzen' },
    { href: '/grades', icon: 'grade', label: 'Noten' },
    { href: '/files', icon: 'folder', label: 'Dateien' },
    { href: '/profile', icon: 'person', label: 'Profil' },
  ];

  if (pathname === '/') {
    return null;
  }

  const userInitials = user ? `${user.firstName[0]}${user.lastName[0]}` : 'MT';

  return (
    <aside className="hidden lg:flex w-64 fixed left-0 top-0 h-screen border-r border-outline-variant bg-white flex-col justify-between py-6 px-4 z-50">
      <div className="flex flex-col gap-8">
        {/* Brand Logo */}
        <div className="flex items-center gap-3 px-2">
          <div className="w-10 h-10 bg-primary-container rounded-xl flex items-center justify-center text-white shadow-md">
            <Icon name="school" className="text-2xl" />
          </div>
          <div>
            <Typography variant="h2" className="tracking-tight leading-none">WISS ESTUDIO</Typography>
            <Typography variant="label-sm" className="text-on-surface-variant text-[10px] tracking-widest mt-1">
              Portal
            </Typography>
          </div>
        </div>

        {/* Nav Links */}
        <nav className="flex flex-col gap-1">
          {navigationItems.map((item) => {
            const isActive = pathname === item.href || pathname.startsWith(item.href + '/');
            // Mapping specific material symbol icon names where they might differ
            let iconName = item.icon;
            if (item.icon === 'Stundenplan') {
              iconName = 'calendar_today';
            }
            return (
              <Link
                key={item.href}
                href={item.href}
                className={`flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 group
                           ${isActive 
                             ? 'bg-accent/10 text-accent font-bold' 
                             : 'text-on-surface-variant hover:bg-surface hover:text-on-surface'}`}
              >
                <Icon
                  name={iconName}
                  fill={isActive}
                  className={`text-[24px] transition-transform duration-200 group-hover:scale-105
                             ${isActive ? 'text-accent' : 'text-on-surface-variant group-hover:text-on-surface'}`}
                />
                <Typography
                  variant="body-md"
                  className={isActive ? 'font-bold' : 'font-normal'}
                >
                  {item.label}
                </Typography>
              </Link>
            );
          })}
        </nav>
      </div>

      {/* User Info / Logout shortcut */}
      <div className="border-t border-outline-variant pt-4 px-2">
        <Link href="/profile" className="flex items-center gap-3 hover:opacity-80 transition-opacity">
          <div className="w-10 h-10 rounded-full bg-primary-container flex items-center justify-center text-white font-bold shadow-sm">
            <Typography variant="label-sm" className="font-bold">{userInitials}</Typography>
          </div>
          <div className="flex flex-col min-w-0">
            <Typography variant="body-md" className="font-bold truncate">
              {user ? `${user.firstName} ${user.lastName}` : 'Matteo Bosshard'}
            </Typography>
            <Typography variant="label-sm" className="text-on-surface-variant text-[10px] truncate uppercase font-bold">
              {user?.roleName || 'Informatik'}
            </Typography>
          </div>
        </Link>
      </div>
    </aside>
  );
};
