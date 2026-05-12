"use client";

import { use, useState, useMemo } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { Icon } from '@/components/atoms/Icon';
import { useAttendance } from '@/hooks/useAttendance';
import { format, parseISO, getDate, isSameDay } from 'date-fns';
import { de } from 'date-fns/locale';

export default function AbsenceCalendarPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const { summary, loading, error } = useAttendance();
  
  const classSessions = useMemo(() => summary.filter(s => s.classId === id), [summary, id]);
  const className = classSessions.length > 0 ? classSessions[0].className : "Kalender";

  // Basic calendar logic (simplified for May 2026)
  const daysInMonth = 31;
  const startDay = 4; // 0=Mon, ..., 4=Fri
  const days = Array.from({ length: daysInMonth }, (_, i) => i + 1);
  const padding = Array.from({ length: startDay }, (_, i) => null);

  const getAbsenceForDay = (day: number) => {
    return classSessions.find(s => {
      const date = parseISO(s.sessionDate);
      return getDate(date) === day && (s.status === 'Offen' || s.status === 'Nicht teilgenommen entschuldigt' || !s.status);
    });
  };

  if (loading) return <MobileShell title="Lade..." showBack><div className="p-margin animate-pulse">Lade Kalender...</div></MobileShell>;

  if (error || classSessions.length === 0) {
    return (
      <MobileShell title="Nicht gefunden" showBack>
        <div className="p-margin text-center">
          <Typography variant="body-md" className="text-on-surface-variant">
            {error ? `Fehler: ${error}` : `Keine Daten für den Kalender der Klasse "${id}" gefunden.`}
          </Typography>
        </div>
      </MobileShell>
    );
  }

  return (
    <MobileShell title={`${className} Kalender`} showBack>
      <div className="p-margin flex flex-col gap-lg">
        {/* Calendar Card */}
        <Card variant="elevated" className="bg-white">
          <div className="flex justify-between items-center mb-md">
            <Typography variant="h2">Mai 2026</Typography>
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
              const abs = getAbsenceForDay(day);
              const isOffen = abs?.status === 'Offen' || !abs?.status;
              const isEntschuldigt = abs?.status === 'Nicht teilgenommen entschuldigt';

              return (
                <div 
                  key={day} 
                  className={`h-10 flex items-center justify-center rounded-full transition-all text-sm font-medium
                             ${abs ? (isOffen ? 'bg-error text-white shadow-md' : isEntschuldigt ? 'bg-success text-white shadow-md' : 'bg-primary-container text-white') : 'hover:bg-surface-container'}`}
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
