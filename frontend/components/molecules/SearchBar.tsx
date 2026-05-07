import React from "react";
import { Search, SlidersHorizontal } from "lucide-react";
import { Input } from "@/components/atoms/Input";
import { cn } from "@/lib/utils";

interface SearchBarProps {
  placeholder?: string;
  className?: string;
}

export function SearchBar({ placeholder = "Search...", className }: SearchBarProps) {
  return (
    <div className={cn("relative", className)}>
      <Input
        placeholder={placeholder}
        icon={<Search size={20} />}
        className="bg-surface-container-low border-outline-variant pr-10"
      />
      <button className="absolute right-3 top-1/2 -translate-y-1/2 text-on-surface-variant hover:text-primary transition-colors">
        <SlidersHorizontal size={20} />
      </button>
    </div>
  );
}
