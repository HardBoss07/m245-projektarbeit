import React from 'react';

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'ghost';
  fullWidth?: boolean;
  children: React.ReactNode;
}

export const Button: React.FC<ButtonProps> = ({
  variant = 'primary',
  fullWidth = false,
  children,
  className = '',
  ...props
}) => {
  const baseStyles = 'h-[48px] px-6 rounded-lg font-semibold transition-all flex items-center justify-center gap-2 active:scale-[0.98] disabled:opacity-50';
  
  const variants = {
    primary: 'bg-accent text-white shadow-sm hover:brightness-110',
    secondary: 'bg-primary-container text-white hover:bg-primary-container/90',
    ghost: 'bg-transparent border border-outline text-on-surface hover:bg-surface-container',
  };

  return (
    <button
      className={`${baseStyles} ${variants[variant]} ${fullWidth ? 'w-full' : ''} ${className}`}
      {...props}
    >
      {children}
    </button>
  );
};
