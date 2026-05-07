import React from "react";
import Link from "next/link";
import { cn } from "@/lib/utils";

interface NavTabProps {
  href: string;
  icon: React.ReactNode;
  label: string;
  isActive?: boolean;
}

export function NavTab({ href, icon, label, isActive }: NavTabProps) {
  return (
    <Link
      href={href}
      className={cn(
        "flex flex-col items-center justify-center px-4 py-1 transition-all active:scale-90 duration-200",
        isActive
          ? "bg-secondary-container text-on-secondary-container rounded-xl"
          : "text-on-surface-variant hover:text-primary"
      )}
    >
      <div className={cn("mb-1", isActive && "[&>svg]:fill-current")}>
        {icon}
      </div>
      <span className="text-label-sm">{label}</span>
    </Link>
  );
}
