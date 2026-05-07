import React from "react";
import { Header } from "./Header";
import { BottomNav } from "@/components/molecules/BottomNav";

interface MobileShellProps {
  children: React.ReactNode;
  showNav?: boolean;
}

export function MobileShell({ children, showNav = true }: MobileShellProps) {
  return (
    <div className="flex min-h-screen flex-col bg-background pb-32">
      <Header />
      <main className="flex-1 px-5 pt-6">
        <div className="mx-auto max-w-md w-full">{children}</div>
      </main>
      {showNav && <BottomNav />}
    </div>
  );
}
