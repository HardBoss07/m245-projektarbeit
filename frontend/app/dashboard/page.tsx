"use client";

import React from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { BentoCard } from "@/components/molecules/BentoCard";
import { GraduationCap, Calendar, Clock, TrendingUp, Loader2 } from "lucide-react";
import { useAuth } from "@/hooks/useAuth";

export default function DashboardPage() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return (
      <div className="flex h-screen items-center justify-center bg-surface">
        <Loader2 className="animate-spin text-primary" size={48} />
      </div>
    );
  }

  if (!isAuthenticated) return null;

  return (
    <MobileShell>
      <div className="space-y-6">
        <header>
          <h2 className="text-h1">Dashboard</h2>
          <p className="text-body-md text-on-surface-variant">Welcome back, Max!</p>
        </header>

        {/* Quick Stats Grid */}
        <div className="grid grid-cols-2 gap-4">
          <BentoCard variant="elevated" className="flex flex-col gap-2">
            <GraduationCap className="text-primary" size={24} />
            <div>
              <p className="text-h2">5.4</p>
              <p className="text-label-sm text-on-surface-variant">Current GPA</p>
            </div>
          </BentoCard>
          <BentoCard variant="elevated" className="flex flex-col gap-2">
            <TrendingUp className="text-primary" size={24} />
            <div>
              <p className="text-h2">Top 5%</p>
              <p className="text-label-sm text-on-surface-variant">Class Rank</p>
            </div>
          </BentoCard>
        </div>

        {/* Upcoming Class */}
        <BentoCard variant="high-priority" padding="lg">
          <div className="flex justify-between items-start mb-4">
            <span className="text-label-sm font-bold bg-white/20 px-2 py-0.5 rounded-full uppercase tracking-wider">Now</span>
            <span className="text-label-sm opacity-80">Room 302</span>
          </div>
          <h3 className="text-h2 mb-1">Software Engineering</h3>
          <p className="text-body-md opacity-80 mb-4">Dr. Adrian Müller</p>
          <div className="flex items-center gap-2 text-label-sm">
            <Clock size={16} />
            <span>08:30 - 10:00</span>
          </div>
        </BentoCard>

        {/* Recent Activity Section */}
        <section className="space-y-4">
          <div className="flex justify-between items-center">
            <h3 className="text-h2">Recent Grades</h3>
            <button className="text-accent-cyan text-label-sm font-bold">View All</button>
          </div>
          <div className="space-y-3">
            {[
              { subject: "Informatik", grade: "5.8", date: "2 days ago" },
              { subject: "Mathematik", grade: "4.9", date: "Yesterday" },
            ].map((item, i) => (
              <BentoCard key={i} className="flex justify-between items-center">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-lg bg-surface-container-high flex items-center justify-center">
                    <GraduationCap size={20} className="text-on-surface-variant" />
                  </div>
                  <div>
                    <p className="text-body-md font-semibold">{item.subject}</p>
                    <p className="text-label-sm text-on-surface-variant">{item.date}</p>
                  </div>
                </div>
                <span className="text-h2 text-primary">{item.grade}</span>
              </BentoCard>
            ))}
          </div>
        </section>

        {/* Schedule Preview */}
        <section className="space-y-4">
          <div className="flex justify-between items-center">
            <h3 className="text-h2">Next Up</h3>
            <Calendar className="text-on-surface-variant" size={20} />
          </div>
          <BentoCard variant="flat" className="flex flex-col gap-1">
            <p className="text-body-md font-semibold">Database Management</p>
            <p className="text-label-sm text-on-surface-variant">10:15 - 11:45 • Lab 12</p>
          </BentoCard>
        </section>
      </div>
    </MobileShell>
  );
}
