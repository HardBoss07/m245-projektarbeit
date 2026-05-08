"use client";

import React from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { BentoCard } from "@/components/molecules/BentoCard";
import { ListEntry } from "@/components/molecules/ListEntry";
import { User, Settings, Bell, ShieldCheck, LogOut, Edit3, GraduationCap, CalendarCheck, Loader2 } from "lucide-react";
import { Button } from "@/components/atoms/Button";
import { useAuth } from "@/hooks/useAuth";
import { useRouter } from "next/navigation";

export default function ProfilePage() {
  const router = useRouter();
  const { isAuthenticated, isLoading } = useAuth();

  const handleLogout = () => {
    localStorage.removeItem("token");
    router.push("/");
  };

  if (isLoading) {
    return (
      <div className="flex h-screen items-center justify-center bg-surface">
        <Loader2 className="animate-spin text-primary" size={48} />
      </div>
    );
  }

  if (!isAuthenticated) return null;

  const preferences = [
    { title: "Settings", icon: <Settings size={20} />, color: "bg-secondary-container" },
    { title: "Notifications", icon: <Bell size={20} />, color: "bg-secondary-container" },
    { title: "Privacy & Security", icon: <ShieldCheck size={20} />, color: "bg-secondary-container" },
  ];

  return (
    <MobileShell>
      <div className="space-y-8">
        {/* User Profile Section */}
        <section className="flex flex-col items-center">
          <div className="relative mb-6">
            <div className="w-28 h-28 rounded-full border-4 border-white shadow-soft overflow-hidden bg-surface-container-high flex items-center justify-center">
              <User size={64} className="text-on-surface-variant" />
            </div>
            <button className="absolute bottom-0 right-0 bg-primary text-on-primary w-10 h-10 rounded-full border-2 border-white flex items-center justify-center shadow-raised active:scale-95 transition-all">
              <Edit3 size={18} />
            </button>
          </div>
          <div className="text-center">
            <h2 className="text-h1">Max Mustermann</h2>
            <p className="text-body-lg text-on-surface-variant">Class 12B</p>
          </div>
        </section>

        {/* Profile Quick Stats (Bento Grid Style) */}
        <div className="grid grid-cols-2 gap-4">
          <BentoCard variant="elevated" className="flex flex-col items-center text-center gap-2">
            <GraduationCap className="text-primary" size={24} />
            <div>
              <p className="text-h2">4.8</p>
              <p className="text-label-sm text-on-surface-variant uppercase tracking-wider">GPA</p>
            </div>
          </BentoCard>
          <BentoCard variant="elevated" className="flex flex-col items-center text-center gap-2">
            <CalendarCheck className="text-primary" size={24} />
            <div>
              <p className="text-h2">98%</p>
              <p className="text-label-sm text-on-surface-variant uppercase tracking-wider">Attendance</p>
            </div>
          </BentoCard>
        </div>

        {/* Settings Options List */}
        <section className="space-y-4">
          <h3 className="text-label-sm text-on-surface-variant uppercase tracking-widest px-1">Preferences</h3>
          <div className="space-y-3">
            {preferences.map((pref, i) => (
              <ListEntry
                key={i}
                title={pref.title}
                subtitle="Manage your app experience"
                icon={pref.icon}
                iconBgColor={pref.color}
              />
            ))}
          </div>
        </section>

        {/* Logout Action */}
        <section className="mt-8">
          <Button variant="error" size="xl" fullWidth className="gap-2" onClick={handleLogout}>
            <LogOut size={20} />
            Logout
          </Button>
        </section>
      </div>
    </MobileShell>
  );
}
