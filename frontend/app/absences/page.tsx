'use client';

import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { useAttendance } from '@/hooks/useAttendance';
import Link from 'next/link';

export default function AbsencesPage() {
  const { summary, loading, error } = useAttendance();

  // Group summary by classId/className
  const classSummaries = summary.reduce((acc, entry) => {
    if (!acc[entry.classId]) {
      acc[entry.classId] = {
        id: entry.classId,
        name: entry.className,
        totalRequired: 0,
        totalAttended: 0,
        unexcusedCount: 0
      };
    }
    acc[entry.classId].totalRequired += Number(entry.requiredLessons);
    acc[entry.classId].totalAttended += Number(entry.attendedLessons);
    if (entry.status === 'Nicht teilgenommen entschuldigt' || entry.status === 'Offen') {
       // logic for unexcused vs excused could be more complex, 
       // but for now let's just show total missed hours.
    }
    return acc;
  }, {} as Record<string, any>);

  const list = Object.values(classSummaries);
  const totalMissed = summary.reduce((acc, entry) => acc + (Number(entry.requiredLessons) - Number(entry.attendedLessons)), 0);

  return (
    <MobileShell title="Absenzen" subtitle="Semester 4 • 2026">
      <div className="p-margin flex flex-col gap-lg">
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
                <Link key={cls.id} href={`/absences/${cls.id}`}>
                  <ListEntry
                    title={cls.name}
                    subtitle="Informatik"
                    value={`${cls.totalRequired - cls.totalAttended} Lekt.`}
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
              <Typography variant="display" className="text-primary">{totalMissed}</Typography>
              <Typography variant="label-sm" className="text-on-surface-variant">Gesamt (Lekt.)</Typography>
            </div>
            <div className="flex flex-col text-right">
              <Typography variant="display" className="text-error">
                {summary.filter(a => a.status === 'Offen').length}
              </Typography>
              <Typography variant="label-sm" className="text-error font-bold">Offene Einträge</Typography>
            </div>
          </div>
        </Card>
      </div>
    </MobileShell>
  );
}
