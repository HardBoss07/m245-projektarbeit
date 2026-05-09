"use client";

import { useState } from 'react';
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { Icon } from '@/components/atoms/Icon';
import { Badge } from '@/components/atoms/Badge';

export default function SchedulePage() {
  const [view, setView] = useState<'day' | 'month'>('day');
  const days = ['Mo', 'Di', 'Mi', 'Do', 'Fr'];
  const activeDay = 'Fr';

  const schedule = [
    { time: '08:00', subject: 'Informatik', room: 'R302', teacher: 'Herr Müller', active: false },
    { time: '10:00', subject: 'Mathematik', room: 'R105', teacher: 'Frau Schmid', active: false },
    { time: '13:00', subject: 'Modul 245', room: 'R302', teacher: 'Herr Müller', active: true },
    { time: '15:00', subject: 'Englisch', room: 'R210', teacher: 'Frau Weber', active: false },
  ];

  // Month View Data (Simplified)
  const monthDays = Array.from({ length: 31 }, (_, i) => i + 1);
  const monthPadding = Array.from({ length: 4 }, (_, i) => null);

  return (
    <MobileShell title="Stundenplan" subtitle={view === 'day' ? "Freitag, 8. Mai 2026" : "Mai 2026"}>
      <div className="flex flex-col gap-md">
        {/* View Toggle */}
        <div className="px-margin pt-md">
          <div className="flex bg-surface-container p-1 rounded-xl">
            <button 
              onClick={() => setView('day')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'day' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Tag
            </button>
            <button 
              onClick={() => setView('month')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'month' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Monat
            </button>
          </div>
        </div>

        {view === 'day' ? (
          <>
            {/* Day Selector */}
            <div className="bg-white border-y border-outline-variant px-margin py-4 flex justify-between">
              {days.map((day) => (
                <div 
                  key={day}
                  className={`w-12 h-12 rounded-full flex flex-col items-center justify-center transition-colors
                             ${day === activeDay ? 'bg-accent text-white shadow-md' : 'text-on-surface-variant'}`}
                >
                  <Typography variant="label-sm" className="font-bold">{day}</Typography>
                </div>
              ))}
            </div>

            {/* Timeline */}
            <div className="p-margin flex flex-col gap-md">
              {schedule.map((item, i) => (
                <div key={i} className="flex gap-md">
                  <div className="w-12 flex flex-col items-center pt-2">
                    <Typography variant="label-sm" className="font-bold text-on-surface-variant">
                      {item.time}
                    </Typography>
                    <div className="w-px h-full bg-outline-variant my-2" />
                  </div>
                  
                  <Card 
                    variant={item.active ? 'glass' : 'elevated'} 
                    className={`flex-1 flex flex-col gap-1 ${item.active ? 'border-accent border-2' : ''}`}
                  >
                    <div className="flex justify-between items-start">
                      <Typography variant="body-md" className="font-bold">{item.subject}</Typography>
                      {item.active && (
                        <div className="flex items-center gap-1 text-accent">
                          <div className="w-2 h-2 rounded-full bg-accent animate-pulse" />
                          <Typography variant="label-sm" className="font-bold uppercase tracking-widest">Jetzt</Typography>
                        </div>
                      )}
                    </div>
                    <Typography variant="label-sm" className="text-on-surface-variant">
                      {item.teacher} • {item.room}
                    </Typography>
                  </Card>
                </div>
              ))}
            </div>
          </>
        ) : (
          /* Month View */
          <div className="p-margin space-y-lg">
            <Card variant="elevated" className="bg-white">
              <div className="grid grid-cols-7 gap-1 text-center mb-2">
                {['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'].map(d => (
                  <Typography key={d} variant="label-sm" className="text-on-surface-variant font-bold">{d}</Typography>
                ))}
              </div>
              <div className="grid grid-cols-7 gap-1">
                {monthPadding.map((_, i) => <div key={`p-${i}`} className="h-10" />)}
                {monthDays.map(day => (
                  <div 
                    key={day} 
                    className={`h-10 flex flex-col items-center justify-center rounded-lg text-xs font-medium relative
                               ${day === 10 ? 'bg-primary-container text-white shadow-md' : 'hover:bg-surface-container'}`}
                  >
                    {day}
                    {day % 3 === 0 && <div className="absolute bottom-1 w-1 h-1 rounded-full bg-accent" />}
                  </div>
                ))}
              </div>
            </Card>

            <section className="space-y-md">
              <Typography variant="label-sm" className="font-bold text-on-surface-variant ml-1">KOMMENDE TERMINE</Typography>
              <Card className="flex items-center gap-md">
                <div className="w-12 h-12 bg-primary text-white rounded-lg flex flex-col items-center justify-center">
                  <span className="text-[10px] uppercase font-bold">Mai</span>
                  <span className="text-lg font-bold">15</span>
                </div>
                <div className="flex-1">
                  <Typography variant="body-md" className="font-bold">Modul-Abschlussprüfung</Typography>
                  <Typography variant="label-sm" className="text-on-surface-variant">Raum 405 • 09:00 Uhr</Typography>
                </div>
                <Icon name="chevron_right" />
              </Card>
            </section>
          </div>
        )}
      </div>
    </MobileShell>
  );
}
