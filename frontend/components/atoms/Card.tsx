import React from 'react';

interface CardProps {
  children: React.ReactNode;
  variant?: 'flat' | 'elevated' | 'glass';
  className?: string;
  onClick?: () => void;
}

export const Card: React.FC<CardProps> = ({ children, variant = 'flat', className = '', onClick }) => {
  const variants = {
    flat: 'bg-white border border-outline-variant',
    elevated: 'bg-white border border-outline-variant shadow-[0_2px_8px_rgba(15,23,42,0.05)]',
    glass: 'glass-card', 
  };

  return (
    <div 
      onClick={onClick}
      className={`p-md rounded-xl transition-all ${variants[variant]} ${onClick ? 'cursor-pointer active:scale-[0.99] active:bg-surface-container' : ''} ${className}`}
    >
      {children}
    </div>
  );
};
