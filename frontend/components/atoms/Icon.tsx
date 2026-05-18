import React from 'react';

/**
 * Properties for the Icon component.
 */
interface IconProps {
  /** The name of the material symbol to display. */
  name: string;
  /** Additional CSS class names to apply to the icon. */
  className?: string;
  /** Whether to use the filled variant of the icon. */
  fill?: boolean;
}

/**
 * Atomic component wrapping Material Symbols Outlined.
 *
 * @param {IconProps} props - The component properties.
 * @returns {JSX.Element} The rendered Icon component.
 */
export const Icon: React.FC<IconProps> = ({ name, className = '', fill = false }) => {
  return (
    <span
      className={`material-symbols-outlined select-none ${className}`}
      style={{
        fontVariationSettings: `'FILL' ${fill ? 1 : 0}, 'wght' 400, 'GRAD' 0, 'opsz' 24`,
      }}
    >
      {name}
    </span>
  );
};
