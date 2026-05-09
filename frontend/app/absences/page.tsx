import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { MOCK_SUBJECTS } from '@/lib/mock-data';
import Link from 'next/link';

export default function AbsencesPage() {
  return (
    <MobileShell title="Absenzen" subtitle="Semester 4 • 2026">
      <div className="p-margin flex flex-col gap-lg">
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Übersicht nach Modul
          </Typography>
          <Card className="!p-0 overflow-hidden">
            {MOCK_SUBJECTS.map((subject) => (
              <Link key={subject.id} href={`/absences/${subject.id}`}>
                <ListEntry
                  title={subject.name}
                  subtitle={subject.category}
                  value={`${subject.totalAbsences}h`}
                  icon="event_busy"
                />
              </Link>
            ))}
          </Card>
        </section>

        <Card variant="glass" className="flex flex-col gap-sm">
          <Typography variant="h2">Zusammenfassung</Typography>
          <div className="flex justify-between items-center">
            <div className="flex flex-col">
              <Typography variant="display" className="text-primary">14h</Typography>
              <Typography variant="label-sm" className="text-on-surface-variant">Gesamt</Typography>
            </div>
            <div className="flex flex-col text-right">
              <Typography variant="display" className="text-error">2h</Typography>
              <Typography variant="label-sm" className="text-error font-bold">Unentschuldigt</Typography>
            </div>
          </div>
        </Card>
      </div>
    </MobileShell>
  );
}
