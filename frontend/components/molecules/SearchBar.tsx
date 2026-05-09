import React from 'react';
import { Icon } from '@/components/atoms/Icon';

interface SearchBarProps {
  placeholder?: string;
  value?: string;
  onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
  className?: string;
}

export const SearchBar: React.FC<SearchBarProps> = ({
  placeholder = 'Suchen...',
  value,
  onChange,
  className = '',
}) => {
  return (
    <div className={`relative w-full ${className}`}>
      <div className="absolute left-4 top-1/2 -translate-y-1/2 text-outline">
        <Icon name="search" className="text-[20px]" />
      </div>
      <input
        type="text"
        placeholder={placeholder}
        value={value}
        onChange={onChange}
        className="w-full h-[48px] pl-12 pr-4 rounded-full bg-surface-container border border-outline-variant
                   focus:outline-none focus:border-accent focus:ring-2 focus:ring-accent/20 
                   transition-all text-on-surface placeholder:text-outline"
      />
    </div>
  );
};
