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
    const classSessions = summary.filter(session => session.classId === id);
    if (classSessions.length === 0) return null;

    const totalRequired = classSessions.reduce((accumulator, session) => accumulator + Number(session.requiredLessons), 0);
    const totalAttended = classSessions.reduce((accumulator, session) => accumulator + (session.attendedLessons ? Number(session.attendedLessons) : 0), 0);
    const openEntries = classSessions.filter(session => session.status === 'Offen' || !session.status).length;

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
      <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Stats & Actions */}
        <div className="flex flex-col gap-lg lg:col-span-1">
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
            <Card className="flex items-center justify-between active:bg-surface-container transition-colors hover:shadow-md">
              <div className="flex items-center gap-md">
                <div className="w-10 h-10 rounded-full bg-accent/10 text-accent flex items-center justify-center">
                  <span className="material-symbols-outlined">calendar_month</span>
                </div>
                <Typography variant="body-md" className="font-bold">Kalenderansicht</Typography>
              </div>
              <span className="material-symbols-outlined text-outline">chevron_right</span>
            </Card>
          </Link>
        </div>

        {/* History */}
        <section className="flex flex-col gap-sm lg:col-span-2">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Verlauf
          </Typography>

          {/* Mobile view history list */}
          <Card className="!p-0 overflow-hidden lg:hidden">
            {classData.history.map((entry, index) => (
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

          {/* Desktop view history table */}
          <div className="hidden lg:block overflow-x-auto bg-white rounded-2xl border border-outline-variant shadow-sm">
            <table className="min-w-full divide-y divide-outline-variant">
              <thead className="bg-surface-container-low">
                <tr>
                  <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Datum</th>
                  <th className="px-6 py-4 text-center text-xs font-bold text-on-surface-variant uppercase tracking-wider">Lektionen</th>
                  <th className="px-6 py-4 text-center text-xs font-bold text-on-surface-variant uppercase tracking-wider">Status</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-outline-variant/60 bg-white">
                {classData.history.map((entry, index) => (
                  <tr key={`${entry.classId}-${entry.sessionDate}-${index}`} className="hover:bg-surface-container-low/40 transition-colors">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <Typography variant="body-md" className="font-bold">
                        {format(parseISO(entry.sessionDate), 'eeee, d. MMMM yyyy', { locale: de })}
                      </Typography>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-center">
                      <Typography variant="body-md">{entry.requiredLessons}</Typography>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-center">
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
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      </div>
    </MobileShell>
  );
}
