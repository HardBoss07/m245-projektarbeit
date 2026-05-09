import React from 'react';

interface BadgeProps {
  children: React.ReactNode;
  variant?: 'cyan' | 'green' | 'red' | 'navy';
  className?: string;
}

export const Badge: React.FC<BadgeProps> = ({ children, variant = 'cyan', className = '' }) => {
  const variants = {
    cyan: 'bg-accent/10 text-accent',
    green: 'bg-success/10 text-success',
    red: 'bg-error/10 text-error',
    navy: 'bg-primary-container/10 text-primary-container',
  };

  return (
    <span className={`px-3 py-1 rounded-full text-[12px] font-semibold tracking-wide ${variants[variant]} ${className}`}>
      {children}
    </span>
  );
};
