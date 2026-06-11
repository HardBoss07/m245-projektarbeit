"use client";

import { use, useState, useMemo } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { Calendar } from '@/components/molecules/Calendar';
import { useAttendance } from '@/hooks/useAttendance';
import { AttendanceStatus } from '@/types/models';
import { format, parseISO, isSameDay } from 'date-fns';
import { de } from 'date-fns/locale';

export default function AbsenceCalendarPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const { summary, loading, error } = useAttendance();
  
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);

  const classSessions = useMemo(() => summary.filter(session => session.classId === id), [summary, id]);
  const className = classSessions.length > 0 ? classSessions[0].className : "Kalender";

  const statusHighlights = useMemo(() => {
    const map: Record<string, AttendanceStatus> = {};
    classSessions.forEach(session => {
      if (session.status) {
        const dateKey = format(parseISO(session.sessionDate), 'yyyy-MM-dd');
        map[dateKey] = session.status;
      }
    });
    return map;
  }, [classSessions]);

  const selectedAbsence = useMemo(() => {
    if (!selectedDate) return null;
    return classSessions.find(session => isSameDay(parseISO(session.sessionDate), selectedDate));
  }, [selectedDate, classSessions]);

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
      <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="lg:col-span-2 flex flex-col gap-md">
          <Calendar 
            currentDate={currentMonth}
            onMonthChange={setCurrentMonth}
            onDateClick={setSelectedDate}
            statusHighlights={statusHighlights}
            selectedDate={selectedDate || undefined}
          />
        </div>

        {/* Legend & Details Column */}
        <div className="flex flex-col gap-lg lg:col-span-1">
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

          {/* Selected Day Info */}
          {selectedDate && (
            <Card variant="glass" className="flex flex-col gap-sm animate-in fade-in slide-in-from-bottom-2 duration-300">
              <Typography variant="label-sm" className="font-bold uppercase tracking-wider text-accent">
                Details für {format(selectedDate, "d. MMMM yyyy", { locale: de })}
              </Typography>
              {selectedAbsence ? (
                <div className="flex flex-col">
                  <Typography variant="h2">
                    {selectedAbsence.status || 'Unentschuldigte Absenz'}
                  </Typography>
                  <Typography variant="body-md">
                    {selectedAbsence.requiredLessons} Lektionen • {selectedAbsence.status === 'Nicht teilgenommen entschuldigt' ? 'Entschuldigt' : 'Keine Begründung'}
                  </Typography>
                </div>
              ) : (
                <Typography variant="body-md" className="italic text-on-surface-variant">
                  Keine Absenzen an diesem Tag erfasst.
                </Typography>
              )}
            </Card>
          )}
        </div>
      </div>
    </MobileShell>
  );
}
