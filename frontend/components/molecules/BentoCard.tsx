import React from "react";
import { cn } from "@/lib/utils";

interface BentoCardProps {
  children: React.ReactNode;
  className?: string;
  variant?: "elevated" | "flat" | "high-priority";
  padding?: "md" | "lg";
}

export function BentoCard({
  children,
  className,
  variant = "flat",
  padding = "md",
}: BentoCardProps) {
  const variants = {
    elevated: "bg-surface-container-lowest shadow-soft border border-outline-variant",
    flat: "bg-surface-container-lowest border border-outline-variant",
    "high-priority": "bg-primary text-on-primary shadow-raised",
  };

  const paddings = {
    md: "p-4", // 16px
    lg: "p-5", // 20px
  };

  return (
    <div
      className={cn(
        "rounded-xl transition-all", // xl = 1rem = 16px
        variants[variant],
        paddings[padding],
        className
      )}
    >
      {children}
    </div>
  );
}
