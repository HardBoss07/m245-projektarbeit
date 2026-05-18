import React from 'react';

/**
 * Properties for the Card component.
 */
interface CardProps {
  /** The content to be contained within the card. */
  children: React.ReactNode;
  /** The visual style variant of the card. Defaults to 'flat'. */
  variant?: 'flat' | 'elevated' | 'glass';
  /** Additional CSS class names to apply to the card. */
  className?: string;
  /** Optional click handler for interactive cards. */
  onClick?: () => void;
}

/**
 * Atomic component representing a structured container for UI elements.
 *
 * @param {CardProps} props - The component properties.
 * @returns {JSX.Element} The rendered Card component.
 */
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
