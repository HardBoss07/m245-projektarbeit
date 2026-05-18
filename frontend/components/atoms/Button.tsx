import React from 'react';

/**
 * Properties for the Button component.
 */
interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  /** The visual style variant of the button. Defaults to 'primary'. */
  variant?: 'primary' | 'secondary' | 'ghost';
  /** Whether the button should span the full width of its container. */
  fullWidth?: boolean;
  /** The content to be displayed within the button. */
  children: React.ReactNode;
}

/**
 * Atomic component representing a standard clickable button.
 *
 * @param {ButtonProps} props - The component properties.
 * @returns {JSX.Element} The rendered Button component.
 */
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
