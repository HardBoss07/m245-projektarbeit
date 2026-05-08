"use client";

import React from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { BentoCard } from "@/components/molecules/BentoCard";
import { ListEntry } from "@/components/molecules/ListEntry";
import { GraduationCap, Terminal, BookOpen, Calculator, Globe, TrendingUp, Loader2 } from "lucide-react";
import { useAuth } from "@/hooks/useAuth";

export default function GradesPage() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return (
      <div className="flex h-screen items-center justify-center bg-surface">
        <Loader2 className="animate-spin text-primary" size={48} />
      </div>
    );
  }

  if (!isAuthenticated) return null;

  const subjects = [
    { name: "Informatik", subtitle: "Modul 122, 117", grade: "5.8", icon: <Terminal />, dots: 3 },
    { name: "Deutsch", subtitle: "Kommunikation", grade: "5.2", icon: <BookOpen />, dots: 2 },
    { name: "Mathematik", subtitle: "Lineare Algebra", grade: "4.9", icon: <Calculator />, dots: 1 },
    { name: "Englisch", subtitle: "Technical Writing", grade: "5.5", icon: <Globe />, dots: 2 },
  ];

  return (
    <MobileShell>
      <div className="space-y-8">
        {/* Grade Summary Hero */}
        <section>
          <BentoCard variant="high-priority" padding="lg" className="flex justify-between items-center relative overflow-hidden">
            <div className="z-10">
              <p className="text-label-sm opacity-80 mb-1">Durchschnittsnote</p>
              <h2 className="text-display text-[48px] leading-none font-bold">5.4</h2>
              <p className="text-body-md mt-2">Semester 1, 2024</p>
            </div>
            <div className="z-10 flex flex-col items-end">
              <GraduationCap size={64} className="opacity-20" />
            </div>
            {/* Aesthetic Background Element */}
            <div className="absolute -right-4 -bottom-4 w-32 h-32 bg-white/10 rounded-full blur-3xl"></div>
          </BentoCard>
        </section>

        {/* Subjects Grid/List */}
        <section className="space-y-4">
          <div className="flex justify-between items-center mb-2">
            <h3 className="text-h2 text-on-surface">Fächerübersicht</h3>
            <button className="text-primary text-label-sm hover:underline">Alle Details</button>
          </div>
          
          <div className="space-y-3">
            {subjects.map((sub, i) => (
              <ListEntry
                key={i}
                title={sub.name}
                subtitle={sub.subtitle}
                icon={React.cloneElement(sub.icon as React.ReactElement, { size: 24, className: "text-on-surface-variant" })}
                iconBgColor="bg-secondary-container"
                rightElement={
                  <div className="flex flex-col items-end">
                    <span className="text-h1 text-primary font-bold">{sub.grade}</span>
                    <div className="flex gap-1 mt-1">
                      {[...Array(3)].map((_, j) => (
                        <div
                          key={j}
                          className={cn(
                            "w-1.5 h-1.5 rounded-full",
                            j < sub.dots ? "bg-primary" : "bg-outline-variant"
                          )}
                        />
                      ))}
                    </div>
                  </div>
                }
              />
            ))}
          </div>
        </section>

        {/* Insights / Recent Performance (Bento Style) */}
        <section className="grid grid-cols-2 gap-4">
          <BentoCard variant="elevated" className="col-span-2 flex flex-col gap-2">
            <p className="text-label-sm text-on-surface-variant flex items-center gap-1">
              <TrendingUp size={16} />
              Letzte Entwicklung
            </p>
            <div className="h-24 w-full relative flex items-end">
              <svg className="w-full h-full" preserveAspectRatio="none" viewBox="0 0 200 100">
                <path d="M0,80 Q50,70 100,40 T200,20" fill="none" stroke="currentColor" strokeWidth="3" className="text-primary" />
                <circle cx="200" cy="20" fill="currentColor" r="4" className="text-primary" />
              </svg>
            </div>
          </BentoCard>
          <BentoCard variant="flat" className="aspect-square flex flex-col justify-between">
            <GraduationCap className="text-primary" size={24} />
            <div>
              <h5 className="text-h2">12</h5>
              <p className="text-label-sm text-on-surface-variant">Prüfungen total</p>
            </div>
          </BentoCard>
          <BentoCard variant="flat" className="aspect-square flex flex-col justify-between">
            <TrendingUp className="text-primary" size={24} />
            <div>
              <h5 className="text-h2">Top 5%</h5>
              <p className="text-label-sm text-on-surface-variant">Klassenrang</p>
            </div>
          </BentoCard>
        </section>
      </div>
    </MobileShell>
  );
}

import { cn } from "@/lib/utils";
