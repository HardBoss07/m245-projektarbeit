"use client";

import React from 'react';
import { Typography } from '@/components/atoms/Typography';
import { Icon } from '@/components/atoms/Icon';
import { useRouter } from 'next/navigation';

interface HeaderProps {
  title: string;
  subtitle?: string;
  showBack?: boolean;
}

export const Header: React.FC<HeaderProps> = ({ title, subtitle, showBack = false }) => {
  const router = useRouter();

  return (
    <header className="sticky top-0 z-50 bg-white/80 backdrop-blur-md border-b border-outline-variant px-margin py-4 flex items-center justify-between">
      <div className="flex items-center gap-md">
        {showBack && (
          <button 
            onClick={() => router.back()}
            className="w-10 h-10 rounded-full flex items-center justify-center active:bg-surface-container transition-colors"
          >
            <Icon name="arrow_back" />
          </button>
        )}
        <div className="flex flex-col">
          <Typography variant="h2" className="leading-tight">{title}</Typography>
          {subtitle && (
            <Typography variant="label-sm" className="text-on-surface-variant font-bold -mt-0.5">
              {subtitle}
            </Typography>
          )}
        </div>
      </div>
      <div className="w-10 h-10 rounded-full bg-primary-container flex items-center justify-center text-white overflow-hidden shadow-sm">
        <Typography variant="label-sm" className="font-bold">MT</Typography>
      </div>
    </header>
  );
};
