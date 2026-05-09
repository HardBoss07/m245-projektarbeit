import { MobileShell } from '@/components/organisms/MobileShell';
import { BentoCard } from '@/components/molecules/BentoCard';
import { Typography } from '@/components/atoms/Typography';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Card } from '@/components/atoms/Card';
import { MOCK_SUBJECTS } from '@/lib/mock-data';
import Link from 'next/link';

export default function DashboardPage() {
  const latestGradesSubject = MOCK_SUBJECTS[0];

  return (
    <MobileShell title="Dashboard" subtitle="Willkommen zurück, Matteo">
      <div className="p-margin flex flex-col gap-lg">
        {/* Next Lesson Bento */}
        <Link href="/schedule">
          <BentoCard 
            title="NÄCHSTE LEKTION" 
            icon="schedule"
            footer={
              <Typography variant="label-sm" className="text-accent font-bold">
                In 15 Minuten • Raum 302
              </Typography>
            }
          >
            <Typography variant="h2">Applikations-Sicherheit</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              Modul 245 • Informatik
            </Typography>
          </BentoCard>
        </Link>

        {/* Stats Row */}
        <div className="grid grid-cols-2 gap-md">
          <Link href="/grades">
            <BentoCard title="SCHNITT">
              <Typography variant="display" className="text-accent">5.2</Typography>
              <Typography variant="label-sm" className="text-on-surface-variant font-bold">
                Aktuelles Semester
              </Typography>
            </BentoCard>
          </Link>
          <Link href="/absences">
            <BentoCard title="ABSENZEN">
              <Typography variant="display" className="text-error">2</Typography>
              <Typography variant="label-sm" className="text-on-surface-variant font-bold">
                Offene Einträge
              </Typography>
            </BentoCard>
          </Link>
        </div>

        {/* Recent Activity */}
        <section className="flex flex-col gap-sm">
          <div className="flex items-center justify-between ml-1">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">
              LETZTE NOTEN
            </Typography>
            <Link href="/grades">
              <Typography variant="label-sm" className="text-accent font-bold">ALLE ANZEIGEN</Typography>
            </Link>
          </div>
          <Card className="!p-0 overflow-hidden">
            {latestGradesSubject.grades.slice(0, 2).map(grade => (
              <Link key={grade.id} href={`/grades/${latestGradesSubject.id}`}>
                <ListEntry 
                  title={grade.title} 
                  subtitle={`${latestGradesSubject.name} • ${grade.date}`} 
                  value={grade.value.toFixed(1)} 
                  icon="grade"
                />
              </Link>
            ))}
          </Card>
        </section>

        {/* Illustration Card (as seen in designs) */}
        <section className="rounded-xl overflow-hidden h-40 relative group shadow-md">
          <img 
            className="w-full h-full object-cover grayscale brightness-50 group-hover:grayscale-0 group-hover:brightness-75 transition-all duration-700" 
            src="https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&w=800&q=80"
            alt="Library"
          />
          <div className="absolute inset-0 flex flex-col justify-end p-md bg-gradient-to-t from-black/80 to-transparent">
            <Typography variant="h2" className="text-white">Präsenz ist der Schlüssel</Typography>
            <Typography variant="body-md" className="text-white/70">Behalte deine Fehlzeiten im Griff für einen Erfolg.</Typography>
          </div>
        </section>
      </div>
    </MobileShell>
  );
}
