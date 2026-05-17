"use client";

import { use, useMemo } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { Badge } from '@/components/atoms/Badge';
import { useAttendance, useAttendanceDetails } from '@/hooks/useAttendance';
import { format, parseISO } from 'date-fns';
import { de } from 'date-fns/locale';
import Link from 'next/link';

export default function AbsenceDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const { summary, loading: summaryLoading, error: summaryError } = useAttendance();
  const { details, loading: detailsLoading, error: detailsError } = useAttendanceDetails(id);

  const classData = useMemo(() => {
    const classSessions = summary.filter(s => s.classId === id);
    if (classSessions.length === 0) return null;

    const totalRequired = classSessions.reduce((acc, s) => acc + Number(s.requiredLessons), 0);
    const totalAttended = classSessions.reduce((acc, s) => acc + (s.attendedLessons ? Number(s.attendedLessons) : 0), 0);
    const openEntries = classSessions.filter(s => s.status === 'Offen' || !s.status).length;

    return {
      name: classSessions[0].className,
      totalMissed: totalRequired - totalAttended,
      openEntries,
      history: classSessions
    };
  }, [summary, id]);

  const loading = summaryLoading || detailsLoading;
  const error = summaryError || detailsError;

  if (loading) return <MobileShell title="Lade..." showBack><div className="p-margin animate-pulse">Lade Absenzendetails...</div></MobileShell>;

  if (error || !classData) {
    return (
      <MobileShell title="Nicht gefunden" showBack>
        <div className="p-margin text-center">
          <Typography variant="body-md" className="text-on-surface-variant">
            {error ? `Fehler: ${error}` : `Keine Daten für die Klasse "${id}" gefunden.`}
          </Typography>
        </div>
      </MobileShell>
    );
  }

  return (
    <MobileShell title={classData.name} subtitle="Absenzübersicht" showBack>
      <div className="p-margin flex flex-col gap-lg">
        {/* Stats */}
        <div className="grid grid-cols-2 gap-md">
          <Card variant="elevated" className="flex flex-col justify-between h-24">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">FEHLSTUNDEN</Typography>
            <Typography variant="display" className="text-primary">{classData.totalMissed.toFixed(1)}L</Typography>
          </Card>
          <Card variant="elevated" className={`flex flex-col justify-between h-24 ${classData.openEntries > 0 ? 'bg-error-container/20 border-error/20' : ''}`}>
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">OFFENE EINTRÄGE</Typography>
            <Typography variant="display" className={classData.openEntries > 0 ? "text-error" : "text-primary"}>
              {classData.openEntries}
            </Typography>
          </Card>
        </div>

        {/* Action Button for Calendar */}
        <Link href={`/absences/${id}/calendar`}>
          <Card className="flex items-center justify-between active:bg-surface-container transition-colors">
            <div className="flex items-center gap-md">
              <div className="w-10 h-10 rounded-full bg-accent/10 text-accent flex items-center justify-center">
                <span className="material-symbols-outlined">calendar_month</span>
              </div>
              <Typography variant="body-md" className="font-bold">Kalenderansicht</Typography>
            </div>
            <span className="material-symbols-outlined text-outline">chevron_right</span>
          </Card>
        </Link>

        {/* History */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Verlauf
          </Typography>
          <Card className="!p-0 overflow-hidden">
            {classData.history.map((entry, i) => (
              <div key={`${entry.classId}-${entry.sessionDate}`} className="border-b border-outline-variant last:border-0 p-md flex items-center justify-between">
                <div className="flex flex-col">
                  <Typography variant="body-md" className="font-bold">
                    {format(parseISO(entry.sessionDate), 'eeee, d. MMMM', { locale: de })}
                  </Typography>
                  <Typography variant="label-sm" className="text-on-surface-variant">
                    {entry.requiredLessons} Lekt. • {entry.status || 'Offen'}
                  </Typography>
                </div>
                <Badge 
                  variant={
                    entry.status === 'Teilgenommen' ? 'success' : 
                    entry.status === 'Nicht teilgenommen entschuldigt' ? 'warning' :
                    entry.status === 'Offen' ? 'neutral' : 
                    entry.status === 'Abwesend 100%' ? 'error' : 'outline'
                  }
                >
                  {entry.status || 'Offen'}
                </Badge>
              </div>
            ))}
          </Card>
        </section>
      </div>
    </MobileShell>
  );
}
