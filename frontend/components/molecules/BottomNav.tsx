"use client";

import React from "react";
import { usePathname } from "next/navigation";
import { Folder, Calendar, GraduationCap, User } from "lucide-react";
import { NavTab } from "@/components/molecules/NavTab";

export function BottomNav() {
  const pathname = usePathname();

  const navItems = [
    { href: "/files", icon: <Folder size={24} />, label: "Files" },
    { href: "/schedule", icon: <Calendar size={24} />, label: "Timetable" },
    { href: "/grades", icon: <GraduationCap size={24} />, label: "Grades" },
    { href: "/profile", icon: <User size={24} />, label: "Profile" },
  ];

  return (
    <nav className="fixed bottom-0 w-full z-50 bg-surface/80 backdrop-blur-md border-t border-outline-variant flex justify-around items-center h-20 px-2 pb-safe shadow-sm">
      {navItems.map((item) => (
        <NavTab
          key={item.href}
          href={item.href}
          icon={item.icon}
          label={item.label}
          isActive={pathname === item.href}
        />
      ))}
    </nav>
  );
}
