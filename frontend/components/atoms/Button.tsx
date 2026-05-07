import React from "react";
import { cn } from "@/lib/utils";

interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: "primary" | "secondary" | "outline" | "error" | "cyan" | "ghost";
  size?: "sm" | "md" | "lg" | "xl";
  fullWidth?: boolean;
}

export function Button({
  className,
  variant = "primary",
  size = "md",
  fullWidth = false,
  ...props
}: ButtonProps) {
  const variants = {
    primary: "bg-primary text-on-primary hover:opacity-90",
    secondary: "bg-secondary text-on-secondary hover:opacity-90",
    outline: "border border-outline bg-transparent text-on-surface hover:bg-surface-container-low",
    error: "bg-error text-on-error hover:opacity-90",
    cyan: "bg-accent-cyan text-white hover:opacity-90 shadow-raised",
    ghost: "bg-transparent text-on-surface-variant hover:bg-surface-container-high",
  };

  const sizes = {
    sm: "h-8 px-3 text-label-sm rounded",
    md: "h-10 px-4 text-body-md rounded-lg",
    lg: "h-12 px-6 text-body-lg rounded-lg",
    xl: "h-16 px-8 text-h2 rounded-xl",
  };

  return (
    <button
      className={cn(
        "inline-flex items-center justify-center gap-2 font-medium transition-all active:scale-95 disabled:opacity-50 disabled:pointer-events-none",
        variants[variant],
        sizes[size],
        fullWidth && "w-full",
        className
      )}
      {...props}
    />
  );
}
