import React from 'react';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { Icon } from '@/components/atoms/Icon';

/**
 * Properties for the BentoCard component.
 */
interface BentoCardProps {
  /** The title of the bento card. */
  title: string;
  /** Optional icon name to display in the card header. */
  icon?: string;
  /** The content to be displayed in the card body. */
  children: React.ReactNode;
  /** Optional footer content. */
  footer?: React.ReactNode;
  /** Additional CSS class names to apply to the card. */
  className?: string;
}

/**
 * Molecular component acting as a structured, high-hierarchy container (Bento layout style).
 *
 * @param {BentoCardProps} props - The component properties.
 * @returns {JSX.Element} The rendered BentoCard component.
 */
export const BentoCard: React.FC<BentoCardProps> = ({
  title,
  icon,
  children,
  footer,
  className = '',
}) => {
  return (
    <Card variant="elevated" className={`flex flex-col gap-sm p-md h-full ${className}`}>
      <div className="flex items-center justify-between mb-1">
        <Typography variant="label-sm" className="text-on-surface-variant font-bold">
          {title}
        </Typography>
        {icon && <Icon name={icon} className="text-accent text-[20px]" />}
      </div>
      <div className="flex-1">
        {children}
      </div>
      {footer && (
        <div className="pt-sm mt-sm border-t border-outline-variant">
          {footer}
        </div>
      )}
    </Card>
  );
};
