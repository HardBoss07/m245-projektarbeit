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
    const filtered = grades.filter(gradeItem => gradeItem.subject === decodedId || gradeItem.id === decodedId);
    if (filtered.length === 0) return null;
    
    const subjectName = filtered[0].subject;
    const avg = filtered.reduce((accumulator, gradeItem) => accumulator + (gradeItem.grade ? Number(gradeItem.grade) : 0), 0) / filtered.length;
    
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
      <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Left Side: Summary & Info */}
        <div className="flex flex-col gap-lg lg:col-span-1">
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

        {/* Right Side: Grades List (Table on Desktop, List on Mobile) */}
        <section className="flex flex-col gap-sm lg:col-span-2">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Einzelnoten
          </Typography>

          {/* Mobile view list */}
          <Card className="!p-0 overflow-hidden lg:hidden">
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

          {/* Desktop view table */}
          <div className="hidden lg:block overflow-x-auto bg-white rounded-2xl border border-outline-variant shadow-sm">
            <table className="min-w-full divide-y divide-outline-variant">
              <thead className="bg-surface-container-low">
                <tr>
                  <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Prüfung</th>
                  <th className="px-6 py-4 text-center text-xs font-bold text-on-surface-variant uppercase tracking-wider">ID / Referenz</th>
                  <th className="px-6 py-4 text-right text-xs font-bold text-on-surface-variant uppercase tracking-wider">Note</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-outline-variant/60 bg-white">
                {subjectGrades.grades.map((grade) => (
                  <tr key={grade.id} className="hover:bg-surface-container-low/40 transition-colors">
                    <td className="px-6 py-4 whitespace-nowrap">
                      <Typography variant="body-md" className="font-bold">{grade.description || 'Prüfung'}</Typography>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-center">
                      <Typography variant="body-md" className="text-on-surface-variant">{grade.id.substring(0, 8)}</Typography>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-right">
                      <Typography 
                        variant="h2" 
                        className={`font-bold ${Number(grade.grade) < 4 ? "text-error" : "text-primary"}`}
                      >
                        {grade.grade ? Number(grade.grade).toFixed(1) : 'N/A'}
                      </Typography>
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
