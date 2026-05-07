import React from "react";
import { School, Search, MoreVertical } from "lucide-react";

export function Header() {
  return (
    <header className="bg-surface sticky top-0 z-50 border-b border-outline-variant flex items-center justify-between px-5 h-16 w-full">
      <div className="flex items-center gap-2">
        <School className="text-primary" size={24} />
        <h1 className="text-display text-primary tracking-tight">WISS Tocco</h1>
      </div>
      <div className="flex items-center gap-4">
        <button className="text-on-surface-variant hover:bg-surface-container-high p-2 rounded-full transition-colors active:scale-95">
          <Search size={24} />
        </button>
        <button className="text-on-surface-variant hover:bg-surface-container-high p-2 rounded-full transition-colors active:scale-95">
          <MoreVertical size={24} />
        </button>
      </div>
    </header>
  );
}
