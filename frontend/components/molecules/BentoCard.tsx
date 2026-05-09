import React from 'react';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { Icon } from '@/components/atoms/Icon';

interface BentoCardProps {
  title: string;
  icon?: string;
  children: React.ReactNode;
  footer?: React.ReactNode;
  className?: string;
}

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
