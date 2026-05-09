import React from 'react';

interface TypographyProps {
  children: React.ReactNode;
  className?: string;
  as?: 'h1' | 'h2' | 'h3' | 'p' | 'span' | 'label';
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
