'use client';

import { MobileShell } from '@/components/organisms/MobileShell';
import { BentoCard } from '@/components/molecules/BentoCard';
import { Typography } from '@/components/atoms/Typography';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Card } from '@/components/atoms/Card';
import { useUser } from '@/hooks/useUser';
import { useGrades } from '@/hooks/useGrades';
import { useAttendance } from '@/hooks/useAttendance';
import Link from 'next/link';

export default function DashboardPage() {
  const { user, loading: userLoading } = useUser();
  const { grades, loading: gradesLoading } = useGrades();
  const { summary: attendance, loading: attendanceLoading } = useAttendance();

  const loading = userLoading || gradesLoading || attendanceLoading;

  if (loading) {
    return (
      <MobileShell title="Dashboard" subtitle="Lade Daten...">
        <div className="p-margin flex flex-col gap-lg animate-pulse">
          <div className="h-32 bg-slate-200 rounded-xl" />
          <div className="grid grid-cols-2 gap-md">
            <div className="h-24 bg-slate-200 rounded-xl" />
            <div className="h-24 bg-slate-200 rounded-xl" />
          </div>
          <div className="h-48 bg-slate-200 rounded-xl" />
        </div>
      </MobileShell>
    );
  }

  // Calculate average grade
  const avgGrade = grades.length > 0 
    ? (grades.reduce((accumulator, gradeItem) => accumulator + (gradeItem.grade ? Number(gradeItem.grade) : 0), 0) / grades.length).toFixed(1) 
    : '0.0';

  // Open absences (where status is 'Offen')
  const openAbsences = attendance.filter(absence => absence.status === 'Offen').length;

  return (
    <MobileShell title="Dashboard" subtitle={`Willkommen zurück, ${user?.firstName || 'Matteo'}`}>
      <div className="p-margin flex flex-col lg:flex-row gap-8">
        {/* Main Column: Next Lesson & Stats (2/3) */}
        <div className="flex-1 flex flex-col gap-8 lg:max-w-[65%]">
          {/* Next Lesson Bento */}
          <Link href="/schedule">
            <BentoCard 
              title="NÄCHSTE LEKTION" 
              icon="schedule"
              className="lg:min-h-[200px]"
              footer={
                <Typography variant="label-sm" className="text-accent font-bold">
                  In Kürze • Raum unbekannt
                </Typography>
              }
            >
              <div className="flex flex-col gap-1">
                <Typography variant="h2" className="lg:text-4xl">Stundenplan ansehen</Typography>
                <Typography variant="body-lg" className="text-on-surface-variant">
                  Deine heutige Übersicht für den Schultag
                </Typography>
              </div>
            </BentoCard>
          </Link>

          {/* Stats Grid */}
          <div className="grid grid-cols-2 gap-md">
            <Link href="/grades">
              <BentoCard title="SCHNITT" className="hover:shadow-md transition-shadow">
                <Typography variant="display" className="text-accent">{avgGrade}</Typography>
                <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-wider">
                  Aktuelles Semester
                </Typography>
              </BentoCard>
            </Link>
            <Link href="/absences">
              <BentoCard title="ABSENZEN" className="hover:shadow-md transition-shadow">
                <Typography variant="display" className={openAbsences > 0 ? "text-error" : "text-accent"}>
                  {openAbsences}
                </Typography>
                <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-wider">
                  Offene Einträge
                </Typography>
              </BentoCard>
            </Link>
          </div>
          
          {/* Recent Activity (Moved here for desktop or kept in right column? Let's keep it in right but add more here if needed) */}
        </div>

        {/* Sidebar Column: Recent Activity & Illustration (1/3) */}
        <div className="flex flex-col gap-8 lg:w-[350px]">
          {/* Recent Activity */}
          <section className="flex flex-col gap-sm">
            <div className="flex items-center justify-between ml-1">
              <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-widest">
                Letzte Noten
              </Typography>
              <Link href="/grades">
                <Typography variant="label-sm" className="text-accent font-bold hover:underline">ALLE ANZEIGEN</Typography>
              </Link>
            </div>
            <Card className="!p-0 overflow-hidden shadow-sm">
              {grades.length > 0 ? (
                grades.slice(0, 4).map(grade => (
                  <ListEntry 
                    key={grade.id}
                    title={grade.description || 'Prüfung'} 
                    subtitle={grade.subject} 
                    value={grade.grade ? Number(grade.grade).toFixed(1) : 'N/A'} 
                    icon="grade"
                  />
                ))
              ) : (
                <div className="p-md text-center">
                  <Typography variant="body-md" className="text-on-surface-variant italic">
                    Noch keine Noten vorhanden
                  </Typography>
                </div>
              )}
            </Card>
          </section>

          {/* Illustration Card */}
          <section className="rounded-xl overflow-hidden h-48 relative group shadow-md hidden md:block">
            <img 
              className="w-full h-full object-cover grayscale brightness-50 group-hover:grayscale-0 group-hover:brightness-75 transition-all duration-700" 
              src="https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&w=800&q=80"
              alt="Library"
            />
            <div className="absolute inset-0 flex flex-col justify-end p-md bg-gradient-to-t from-black/90 to-transparent">
              <Typography variant="h2" className="text-white">Präsenz ist der Schlüssel</Typography>
              <Typography variant="body-md" className="text-white/70">Behalte deine Fehlzeiten im Griff für deinen Erfolg.</Typography>
            </div>
          </section>
        </div>
      </div>
    </MobileShell>
  );
}
