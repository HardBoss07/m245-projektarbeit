import React from 'react';
import Link from 'next/link';
import { Icon } from '@/components/atoms/Icon';
import { Typography } from '@/components/atoms/Typography';

interface NavTabProps {
  href: string;
  icon: string;
  label: string;
  isActive?: boolean;
}

export const NavTab: React.FC<NavTabProps> = ({ href, icon, label, isActive = false }) => {
  return (
    <Link 
      href={href} 
      className={`relative flex flex-col items-center justify-center w-full h-full transition-all duration-200 active:scale-90
                 ${isActive ? 'text-accent' : 'text-on-surface-variant'}`}
    >
      <Icon 
        name={icon} 
        fill={isActive} 
        className={`text-[24px] mb-1 transition-transform ${isActive ? 'scale-110' : ''}`} 
      />
      <Typography 
        variant="label-sm" 
        className={`font-bold !tracking-tight text-center leading-none
                   ${isActive ? 'text-accent' : 'text-on-surface-variant'}`}
      >
        {label}
      </Typography>
      {isActive && (
        <div className="absolute bottom-1.5 w-1 h-1 rounded-full bg-accent" />
      )}
    </Link>
  );
};
