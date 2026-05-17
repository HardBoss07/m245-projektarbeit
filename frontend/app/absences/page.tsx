'use client';

import { useState, useMemo } from 'react';
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Calendar } from '@/components/molecules/Calendar';
import { useAttendance } from '@/hooks/useAttendance';
import { AttendanceStatus } from '@/types/models';
import { format, parseISO, isSameDay } from 'date-fns';
import { de } from 'date-fns/locale';
import Link from 'next/link';

export default function AbsencesPage() {
  const { summary, loading, error } = useAttendance();
  const [view, setView] = useState<'list' | 'calendar'>('list');
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);

  // Group summary by classId/className for the list view
  const classSummaries = useMemo(() => {
    return summary.reduce((acc, entry) => {
      if (!acc[entry.classId]) {
        acc[entry.classId] = {
          id: entry.classId,
          name: entry.className,
          totalRequired: 0,
          totalAttended: 0,
          unexcusedCount: 0
        };
      }
      const attended = entry.attendedLessons ? Number(entry.attendedLessons) : 0;
      acc[entry.classId].totalRequired += Number(entry.requiredLessons);
      acc[entry.classId].totalAttended += attended;
      
      return acc;
    }, {} as Record<string, any>);
  }, [summary]);

  const list = Object.values(classSummaries);
  
  const totalMissed = useMemo(() => {
    return summary.reduce((acc, entry) => {
      const required = Number(entry.requiredLessons);
      const attended = entry.attendedLessons ? Number(entry.attendedLessons) : 0;
      return acc + (required - attended);
    }, 0);
  }, [summary]);

  const openAbsences = useMemo(() => {
    return summary.filter(a => a.status === 'Offen' || !a.status).length;
  }, [summary]);

  const statusHighlights = useMemo(() => {
    const map: Record<string, AttendanceStatus> = {};
    summary.forEach(s => {
      if (s.status) {
        const dateKey = format(parseISO(s.sessionDate), 'yyyy-MM-dd');
        map[dateKey] = s.status;
      }
    });
    return map;
  }, [summary]);

  const selectedAbsences = useMemo(() => {
    if (!selectedDate) return [];
    return summary.filter(s => isSameDay(parseISO(s.sessionDate), selectedDate));
  }, [selectedDate, summary]);

  return (
    <MobileShell title="Absenzen" subtitle={view === 'list' ? "Semester 4 • 2026" : format(currentMonth, "MMMM yyyy", { locale: de })}>
      <div className="flex flex-col gap-md">
        {/* View Toggle */}
        <div className="px-margin pt-md">
          <div className="flex bg-surface-container p-1 rounded-xl">
            <button 
              onClick={() => setView('list')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'list' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Übersicht
            </button>
            <button 
              onClick={() => setView('calendar')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'calendar' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Kalender
            </button>
          </div>
        </div>

        {view === 'list' ? (
          <div className="p-margin flex flex-col gap-lg animate-in fade-in duration-300">
            <section className="flex flex-col gap-sm">
              <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
                Übersicht nach Modul
              </Typography>
              <Card className="!p-0 overflow-hidden">
                {loading ? (
                  <div className="p-md text-center animate-pulse">Lade Absenzen...</div>
                ) : error ? (
                  <div className="p-md text-center text-error">{error}</div>
                ) : list.length > 0 ? (
                  list.map((cls) => (
                    <Link key={cls.id} href={`/absences/${cls.id}/calendar`}>
                      <ListEntry
                        title={cls.name}
                        subtitle="Informatik"
                        value={`${(cls.totalRequired - cls.totalAttended).toFixed(1)} Lekt.`}
                        icon="event_busy"
                      />
                    </Link>
                  ))
                ) : (
                  <div className="p-md text-center text-on-surface-variant italic">
                    Keine Absenzen erfasst
                  </div>
                )}
              </Card>
            </section>

            <Card variant="glass" className="flex flex-col gap-sm">
              <Typography variant="h2">Zusammenfassung</Typography>
              <div className="flex justify-between items-center">
                <div className="flex flex-col">
                  <Typography variant="display" className="text-primary">{totalMissed.toFixed(1)}</Typography>
                  <Typography variant="label-sm" className="text-on-surface-variant">Gesamt (Lekt.)</Typography>
                </div>
                <div className="flex flex-col text-right">
                  <Typography variant="display" className={openAbsences > 0 ? "text-error" : "text-primary"}>
                    {openAbsences}
                  </Typography>
                  <Typography variant="label-sm" className={`${openAbsences > 0 ? "text-error" : "text-on-surface-variant"} font-bold`}>
                    Offene Einträge
                  </Typography>
                </div>
              </div>
            </Card>
          </div>
        ) : (
          <div className="p-margin flex flex-col gap-lg animate-in fade-in duration-300">
            <Calendar 
              currentDate={currentMonth}
              onMonthChange={setCurrentMonth}
              onDateClick={setSelectedDate}
              statusHighlights={statusHighlights}
              selectedDate={selectedDate || undefined}
            />

            {/* Selected Day Details */}
            {selectedDate && (
              <section className="flex flex-col gap-sm">
                <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1 uppercase">
                  Details für {format(selectedDate, "d. MMMM", { locale: de })}
                </Typography>
                {selectedAbsences.length > 0 ? (
                  <div className="flex flex-col gap-2">
                    {selectedAbsences.map((abs, idx) => (
                      <Card key={idx} variant="elevated" className="bg-white">
                        <div className="flex justify-between items-start">
                          <div>
                            <Typography variant="body-md" className="font-bold">{abs.className}</Typography>
                            <Typography variant="label-sm" className="text-on-surface-variant">
                              {abs.requiredLessons} Lektionen • {abs.status || 'Unentschuldigt'}
                            </Typography>
                          </div>
                          <div className={`w-3 h-3 rounded-full ${abs.status === 'Nicht teilgenommen entschuldigt' ? 'bg-success' : 'bg-error'}`} />
                        </div>
                      </Card>
                    ))}
                  </div>
                ) : (
                  <Card className="p-md text-center text-on-surface-variant italic">
                    Keine Einträge für diesen Tag
                  </Card>
                )}
              </section>
            )}
          </div>
        )}
      </div>
    </MobileShell>
  );
}
