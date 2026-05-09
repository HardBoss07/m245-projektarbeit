import { MobileShell } from '@/components/organisms/MobileShell';
import { SearchBar } from '@/components/molecules/SearchBar';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { MOCK_SUBJECTS } from '@/lib/mock-data';
import Link from 'next/link';

export default function GradesPage() {
  return (
    <MobileShell title="Meine Noten" subtitle="Semester 4 • 2026">
      <div className="p-margin flex flex-col gap-lg">
        <SearchBar placeholder="Nach Modul suchen..." />
        
        <section className="flex flex-col gap-sm">
          <div className="flex items-center justify-between px-1">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">
              Aktuelle Resultate
            </Typography>
            <Typography variant="label-sm" className="text-accent font-bold">
              Gesamtschnitt: 5.2
            </Typography>
          </div>
          
          <Card className="!p-0 overflow-hidden">
            {MOCK_SUBJECTS.map((subject) => (
              <Link key={subject.id} href={`/grades/${subject.id}`}>
                <ListEntry
                  title={subject.name}
                  subtitle={subject.category}
                  value={subject.averageGrade.toFixed(1)}
                  icon="school"
                />
              </Link>
            ))}
          </Card>
        </section>
      </div>
    </MobileShell>
  );
}
