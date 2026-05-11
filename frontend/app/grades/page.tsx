'use client';

import { MobileShell } from '@/components/organisms/MobileShell';
import { SearchBar } from '@/components/molecules/SearchBar';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { useGrades } from '@/hooks/useGrades';
import Link from 'next/link';

export default function GradesPage() {
  const { grades, loading, error } = useGrades();

  // Group grades by subject
  const subjects = grades.reduce((acc, grade) => {
    if (!acc[grade.subject]) {
      acc[grade.subject] = {
        name: grade.subject,
        grades: [],
        total: 0,
        count: 0
      };
    }
    acc[grade.subject].grades.push(grade);
    acc[grade.subject].total += grade.grade;
    acc[grade.subject].count += 1;
    return acc;
  }, {} as Record<string, any>);

  const subjectList = Object.values(subjects);
  const totalAvg = grades.length > 0 
    ? (grades.reduce((acc, g) => acc + g.grade, 0) / grades.length).toFixed(1)
    : '0.0';

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
              Gesamtschnitt: {totalAvg}
            </Typography>
          </div>
          
          <Card className="!p-0 overflow-hidden">
            {loading ? (
              <div className="p-md text-center animate-pulse">Lade Noten...</div>
            ) : error ? (
              <div className="p-md text-center text-error">{error}</div>
            ) : subjectList.length > 0 ? (
              subjectList.map((subject) => (
                <Link key={subject.name} href={`/grades/${subject.name}`}>
                  <ListEntry
                    title={subject.name}
                    subtitle={`${subject.count} Prüfungen`}
                    value={(subject.total / subject.count).toFixed(1)}
                    icon="school"
                  />
                </Link>
              ))
            ) : (
              <div className="p-md text-center text-on-surface-variant italic">
                Keine Resultate gefunden
              </div>
            )}
          </Card>
        </section>
      </div>
    </MobileShell>
  );
}
