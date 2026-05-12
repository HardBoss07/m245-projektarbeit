"use client";

import { use, useMemo } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { useGrades } from "@/hooks/useGrades";

export default function GradeDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const decodedId = decodeURIComponent(id);
  const { grades, loading, error } = useGrades();

  // Find subject and its grades from the real data
  const subjectGrades = useMemo(() => {
    const filtered = grades.filter(g => g.subject === decodedId || g.id === decodedId);
    if (filtered.length === 0) return null;
    
    const subjectName = filtered[0].subject;
    const avg = filtered.reduce((acc, g) => acc + (g.grade ? Number(g.grade) : 0), 0) / filtered.length;
    
    return {
      name: subjectName,
      average: avg,
      grades: filtered
    };
  }, [grades, decodedId]);

  if (loading) return <MobileShell title="Lade..." showBack><div className="p-margin animate-pulse">Lade Details...</div></MobileShell>;
  
  if (error || !subjectGrades) {
    return (
      <MobileShell title="Not gefunden" showBack>
        <div className="p-margin text-center">
          <Typography variant="body-md" className="text-on-surface-variant">
            {error ? `Fehler: ${error}` : `Das Fach "${decodedId}" konnte nicht gefunden werden.`}
          </Typography>
        </div>
      </MobileShell>
    );
  }

  return (
    <MobileShell title={subjectGrades.name} subtitle="Notenübersicht" showBack>
      <div className="p-margin flex flex-col gap-lg">
        {/* Average Hero */}
        <Card variant="glass" className="flex items-center justify-between">
          <div className="flex flex-col">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">SCHNITT</Typography>
            <Typography variant="display" className="text-accent">{subjectGrades.average.toFixed(2)}</Typography>
          </div>
          <div className="text-right">
            <Typography variant="body-md" className="font-bold">Semester 4</Typography>
            <Typography variant="label-sm" className="text-on-surface-variant">WISS Tocco</Typography>
          </div>
        </Card>

        {/* Grades List */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Einzelnoten
          </Typography>
          <Card className="!p-0 overflow-hidden">
            {subjectGrades.grades.map((grade) => (
              <ListEntry
                key={grade.id}
                title={grade.description || 'Prüfung'}
                subtitle={grade.id.substring(0, 8)} // Mocking a date or ID for now
                value={grade.grade ? Number(grade.grade).toFixed(1) : 'N/A'}
                icon="grade"
              />
            ))}
          </Card>
        </section>

        {/* Info Card */}
        <Card variant="elevated" className="bg-surface-container-low border-none">
          <Typography variant="label-sm" className="font-bold text-on-surface-variant uppercase mb-2">
            Info
          </Typography>
          <Typography variant="body-md">
            Die Gewichtung der Noten entspricht den offiziellen Richtlinien des Faches {subjectGrades.name}.
          </Typography>
        </Card>
      </div>
    </MobileShell>
  );
}
