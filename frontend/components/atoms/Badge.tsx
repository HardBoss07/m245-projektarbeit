import React from 'react';

/**
 * Properties for the Badge component.
 */
interface BadgeProps {
  /** The content to be displayed within the badge. */
  children: React.ReactNode;
  /** The visual style variant of the badge. Defaults to 'neutral'. */
  variant?: 'success' | 'error' | 'warning' | 'neutral' | 'outline';
  /** Additional CSS class names to apply to the badge. */
  className?: string;
}

/**
 * Atomic component representing a small status or category indicator.
 *
 * @param {BadgeProps} props - The component properties.
 * @returns {JSX.Element} The rendered Badge component.
 */
export const Badge: React.FC<BadgeProps> = ({ children, variant = 'neutral', className = '' }) => {
  const variants = {
    success: 'bg-green-100 text-green-800',
    error: 'bg-red-100 text-red-900',
    warning: 'bg-amber-100 text-amber-900',
    neutral: 'bg-slate-100 text-slate-700',
    outline: 'border border-slate-300 text-slate-600 bg-transparent',
  };

  return (
    <span className={`px-2.5 py-0.5 rounded-md text-[11px] font-bold uppercase tracking-wider ${variants[variant]} ${className}`}>
      {children}
    </span>
  );
};
