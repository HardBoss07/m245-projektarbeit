'use client';

import { useState, useMemo } from 'react';
import { MobileShell } from '@/components/organisms/MobileShell';
import { SearchBar } from '@/components/molecules/SearchBar';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { Badge } from '@/components/atoms/Badge';
import { useGrades } from '@/hooks/useGrades';
import { Grade } from '@/types/api';

export default function GradesPage() {
  const { grades, loading, error } = useGrades();
  const [expandedSubjects, setExpandedSubjects] = useState<string[]>([]);

  // Group grades by subject
  const subjects = useMemo(() => {
    return grades.reduce((acc, grade) => {
      if (!acc[grade.subject]) {
        acc[grade.subject] = {
          name: grade.subject,
          grades: [],
          total: 0,
          count: 0
        };
      }
      const gradeValue = grade.grade ? Number(grade.grade) : 0;
      acc[grade.subject].grades.push(grade);
      acc[grade.subject].total += gradeValue;
      acc[grade.subject].count += 1;
      return acc;
    }, {} as Record<string, { name: string; grades: Grade[]; total: number; count: number }>);
  }, [grades]);

  const subjectList = Object.values(subjects);
  
  const totalAvg = useMemo(() => {
    return grades.length > 0 
      ? (grades.reduce((acc, g) => acc + (g.grade ? Number(g.grade) : 0), 0) / grades.length).toFixed(2)
      : '0.00';
  }, [grades]);

  const toggleSubject = (name: string) => {
    setExpandedSubjects(prev => 
      prev.includes(name) ? prev.filter(s => s !== name) : [...prev, name]
    );
  };

  return (
    <MobileShell title="Meine Noten" subtitle="Semester 4 • 2026">
      <div className="p-margin flex flex-col gap-lg">
        <SearchBar placeholder="Nach Modul suchen..." />
        
        <section className="flex flex-col gap-sm">
          <div className="flex items-center justify-between px-1">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">
              Aktuelle Resultate
            </Typography>
            <Typography variant="label-sm" className="text-accent font-bold uppercase tracking-wider">
              Gesamtschnitt: {totalAvg}
            </Typography>
          </div>
          
          <div className="flex flex-col gap-md">
            {loading ? (
              <Card className="p-md text-center animate-pulse">Lade Noten...</Card>
            ) : error ? (
              <Card className="p-md text-center text-error">{error}</Card>
            ) : subjectList.length > 0 ? (
              subjectList.map((subject) => {
                const isExpanded = expandedSubjects.includes(subject.name);
                const avg = (subject.total / subject.count).toFixed(2);

                return (
                  <div key={subject.name} className="flex flex-col gap-2">
                    <Card 
                      className="!p-0 overflow-hidden cursor-pointer active:scale-[0.99] transition-transform"
                      onClick={() => toggleSubject(subject.name)}
                    >
                      <ListEntry
                        title={subject.name}
                        subtitle={`${subject.count} Prüfungen`}
                        value={avg}
                        icon={isExpanded ? "expand_less" : "expand_more"}
                      />
                    </Card>

                    {isExpanded && (
                      <div className="ml-4 pl-4 border-l-2 border-accent/30 flex flex-col gap-2 animate-in slide-in-from-top-2 duration-200">
                        {subject.grades.map((grade) => (
                          <Card key={grade.id} variant="elevated" className="bg-white !py-3 !px-4">
                            <div className="flex justify-between items-center">
                              <div className="flex flex-col gap-0.5">
                                <Typography variant="body-md" className="font-bold">
                                  {grade.description}
                                </Typography>
                                <div className="flex gap-2 items-center">
                                  <Badge variant="outline" className="text-[10px] py-0 px-1.5 h-auto">
                                    Gewicht: {(Number(grade.weight) * 100).toFixed(0)}%
                                  </Badge>
                                  <Typography variant="label-sm" className="text-on-surface-variant">
                                    {grade.description.includes('ZP') ? 'Zwischenprüfung' : 'Leistungsbeurteilung'}
                                  </Typography>
                                </div>
                              </div>
                              <Typography variant="h2" className={Number(grade.grade) < 4 ? 'text-error' : 'text-primary'}>
                                {Number(grade.grade).toFixed(1)}
                              </Typography>
                            </div>
                          </Card>
                        ))}
                      </div>
                    )}
                  </div>
                );
              })
            ) : (
              <div className="p-md text-center text-on-surface-variant italic">
                Keine Resultate gefunden
              </div>
            )}
          </div>
        </section>
      </div>
    </MobileShell>
  );
}
