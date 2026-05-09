"use client";

import { use, useState } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { MOCK_SUBJECTS, MOCK_ABSENCES } from '@/lib/mock-data';
import { Icon } from '@/components/atoms/Icon';

export default function AbsenceCalendarPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const subject = MOCK_SUBJECTS.find(s => s.id === id);
  const absences = MOCK_ABSENCES[id] || [];
  
  const [currentMonth, setCurrentMonth] = useState(4); // May (0-indexed 4)
  const monthName = "Mai 2026";
  
  // Basic calendar logic (simplified for May 2026)
  // May 1 2026 is a Friday
  const daysInMonth = 31;
  const startDay = 4; // 0=Mon, ..., 4=Fri
  const days = Array.from({ length: daysInMonth }, (_, i) => i + 1);
  const padding = Array.from({ length: startDay }, (_, i) => null);

  const isAbsent = (day: number) => {
    const dateStr = `2026-05-${day.toString().padStart(2, '0')}`;
    return absences.find(a => a.date === dateStr);
  };

  if (!subject) return <div>Subject not found</div>;

  return (
    <MobileShell title={`${subject.name} Kalender`} showBack>
      <div className="p-margin flex flex-col gap-lg">
        {/* Calendar Card */}
        <Card variant="elevated" className="bg-white">
          <div className="flex justify-between items-center mb-md">
            <Typography variant="h2">{monthName}</Typography>
            <div className="flex gap-sm">
              <button className="p-1 hover:bg-surface-container rounded-full transition-colors">
                <Icon name="chevron_left" />
              </button>
              <button className="p-1 hover:bg-surface-container rounded-full transition-colors">
                <Icon name="chevron_right" />
              </button>
            </div>
          </div>

          <div className="grid grid-cols-7 gap-1 text-center mb-2">
            {['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'].map(d => (
              <Typography key={d} variant="label-sm" className="text-on-surface-variant font-bold">
                {d}
              </Typography>
            ))}
          </div>

          <div className="grid grid-cols-7 gap-1">
            {padding.map((_, i) => <div key={`p-${i}`} className="h-10" />)}
            {days.map(day => {
              const abs = isAbsent(day);
              return (
                <div 
                  key={day} 
                  className={`h-10 flex items-center justify-center rounded-full transition-all text-sm font-medium
                             ${abs ? (abs.status === 'unexcused' ? 'bg-error text-white shadow-md' : 'bg-success text-white shadow-md') : 'hover:bg-surface-container'}`}
                >
                  {day}
                </div>
              );
            })}
          </div>
        </Card>

        {/* Legend */}
        <div className="flex gap-lg px-2">
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-full bg-success" />
            <Typography variant="label-sm" className="font-bold">Entschuldigt</Typography>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded-full bg-error" />
            <Typography variant="label-sm" className="font-bold">Offen</Typography>
          </div>
        </div>

        {/* Selected Day Info (Static Placeholder) */}
        <Card variant="glass" className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="font-bold uppercase tracking-wider text-accent">
            Details für 4. Mai 2026
          </Typography>
          <div className="flex flex-col">
            <Typography variant="h2">Unentschuldigte Absenz</Typography>
            <Typography variant="body-md">2 Lektionen • Keine Begründung</Typography>
          </div>
        </Card>
      </div>
    </MobileShell>
  );
}
