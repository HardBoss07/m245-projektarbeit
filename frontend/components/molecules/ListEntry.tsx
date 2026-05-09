import React from 'react';
import { Typography } from '@/components/atoms/Typography';
import { Icon } from '@/components/atoms/Icon';

interface ListEntryProps {
  title: string;
  subtitle?: string;
  value?: string;
  icon?: string;
  onClick?: () => void;
  className?: string;
}

export const ListEntry: React.FC<ListEntryProps> = ({
  title,
  subtitle,
  value,
  icon,
  onClick,
  className = '',
}) => {
  return (
    <div 
      onClick={onClick}
      className={`flex items-center gap-md p-md bg-white border-b border-outline-variant last:border-0 
                 active:bg-surface-container transition-colors ${onClick ? 'cursor-pointer' : ''} ${className}`}
    >
      {icon && (
        <div className="w-10 h-10 rounded-lg bg-surface-container flex items-center justify-center text-primary-container">
          <Icon name={icon} />
        </div>
      )}
      <div className="flex-1 flex flex-col">
        <Typography variant="body-md" className="font-semibold">{title}</Typography>
        {subtitle && (
          <Typography variant="label-sm" className="text-on-surface-variant leading-none mt-1">
            {subtitle}
          </Typography>
        )}
      </div>
      {value && (
        <Typography variant="body-md" className="font-bold text-accent">
          {value}
        </Typography>
      )}
    </div>
  );
};
