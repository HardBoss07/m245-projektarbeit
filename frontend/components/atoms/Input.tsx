import React from 'react';

interface InputProps extends React.InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
}

export const Input: React.FC<InputProps> = ({ label, error, className = '', ...props }) => {
  return (
    <div className={`flex flex-col gap-1.5 w-full ${className}`}>
      {label && (
        <label className="text-[12px] font-medium text-on-surface-variant uppercase tracking-wider ml-1">
          {label}
        </label>
      )}
      <input
        className={`w-full h-[48px] px-4 rounded-lg bg-surface-container-low border border-outline-variant 
                   text-on-surface placeholder:text-outline focus:outline-none focus:border-accent 
                   focus:ring-2 focus:ring-accent/20 transition-all ${error ? 'border-error' : ''}`}
        {...props}
      />
      {error && <span className="text-error text-xs ml-1">{error}</span>}
    </div>
  );
};
