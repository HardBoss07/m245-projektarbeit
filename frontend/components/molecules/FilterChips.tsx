import React from 'react';

interface FilterChipsProps<T extends string> {
  options: T[];
  activeOption: T;
  onOptionChange: (option: T) => void;
  className?: string;
}

/**
 * A horizontally scrollable row of pill-shaped buttons for filtering.
 * Designed for mobile-first touch interaction.
 */
export const FilterChips = <T extends string>({
  options,
  activeOption,
  onOptionChange,
  className = '',
}: FilterChipsProps<T>) => {
  return (
    <div className={`flex gap-2 overflow-x-auto no-scrollbar py-2 -mx-margin px-margin ${className}`}>
      {options.map((option) => (
        <button
          key={option}
          onClick={() => onOptionChange(option)}
          className={`px-4 py-2 rounded-full text-sm font-bold whitespace-nowrap transition-all
            ${activeOption === option 
              ? 'bg-primary text-white shadow-sm' 
              : 'bg-surface-container text-on-surface-variant hover:bg-surface-container-high'}`}
        >
          {option}
        </button>
      ))}
    </div>
  );
};
