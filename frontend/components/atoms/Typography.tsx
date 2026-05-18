import React from 'react';

/**
 * Properties for the Typography component.
 */
interface TypographyProps {
  /** The content to be rendered. */
  children: React.ReactNode;
  /** Additional CSS class names to apply. */
  className?: string;
  /** The HTML tag to be used for rendering. Defaults to 'p'. */
  as?: 'h1' | 'h2' | 'h3' | 'p' | 'span' | 'label';
  /** The design system typography variant. Defaults to 'body-md'. */
  variant?: 'display' | 'h1' | 'h2' | 'body-lg' | 'body-md' | 'label-sm';
}

const variants = {
  display: 'text-[30px] font-bold leading-[38px] tracking-[-0.02em]',
  h1: 'text-[24px] font-semibold leading-[32px] tracking-[-0.01em]',
  h2: 'text-[20px] font-semibold leading-[28px] tracking-normal',
  'body-lg': 'text-[16px] font-normal leading-[24px] tracking-normal',
  'body-md': 'text-[14px] font-normal leading-[20px] tracking-normal',
  'label-sm': 'text-[12px] font-medium leading-[16px] tracking-[0.05em] uppercase',
};

/**
 * Atomic component for consistent text rendering based on the design system.
 *
 * @param {TypographyProps} props - The component properties.
 * @returns {JSX.Element} The rendered Typography component.
 */
export const Typography: React.FC<TypographyProps> = ({
  children,
  className = '',
  as: Component = 'p',
  variant = 'body-md',
}) => {
  return (
    <Component className={`${variants[variant]} ${className}`}>
      {children}
    </Component>
  );
};
