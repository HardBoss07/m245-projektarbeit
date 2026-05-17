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

  const classSessions = useMemo(() => summary.filter(s => s.classId === id), [summary, id]);
  const className = classSessions.length > 0 ? classSessions[0].className : "Kalender";

  const statusHighlights = useMemo(() => {
    const map: Record<string, AttendanceStatus> = {};
    classSessions.forEach(s => {
      if (s.status) {
        const dateKey = format(parseISO(s.sessionDate), 'yyyy-MM-dd');
        map[dateKey] = s.status;
      }
    });
    return map;
  }, [classSessions]);

  const selectedAbsence = useMemo(() => {
    if (!selectedDate) return null;
    return classSessions.find(s => isSameDay(parseISO(s.sessionDate), selectedDate));
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
      <div className="p-margin flex flex-col gap-lg">
        <Calendar 
          currentDate={currentMonth}
          onMonthChange={setCurrentMonth}
          onDateClick={setSelectedDate}
          statusHighlights={statusHighlights}
          selectedDate={selectedDate || undefined}
        />

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
    </MobileShell>
  );
}
