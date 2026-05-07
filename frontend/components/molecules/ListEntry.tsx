import React from "react";
import { ChevronRight } from "lucide-react";
import { BentoCard } from "@/components/molecules/BentoCard";
import { cn } from "@/lib/utils";

interface ListEntryProps {
  icon: React.ReactNode;
  iconBgColor?: string;
  title: string;
  subtitle: string;
  rightElement?: React.ReactNode;
  onClick?: () => void;
  className?: string;
}

export function ListEntry({
  icon,
  iconBgColor = "bg-primary-container",
  title,
  subtitle,
  rightElement,
  onClick,
  className,
}: ListEntryProps) {
  return (
    <BentoCard
      variant="elevated"
      padding="md"
      className={cn(
        "flex items-center justify-between hover:bg-surface-container-low transition-colors group cursor-pointer",
        className
      )}
      onClick={onClick}
    >
      <div className="flex items-center gap-4">
        <div
          className={cn(
            "w-12 h-12 rounded-lg flex items-center justify-center shrink-0",
            iconBgColor
          )}
        >
          {icon}
        </div>
        <div>
          <p className="text-body-lg font-semibold text-on-surface line-clamp-1">
            {title}
          </p>
          <p className="text-label-sm text-on-surface-variant line-clamp-1">
            {subtitle}
          </p>
        </div>
      </div>
      <div className="flex items-center gap-2">
        {rightElement || (
          <ChevronRight className="text-outline group-hover:text-primary transition-colors" />
        )}
      </div>
    </BentoCard>
  );
}
