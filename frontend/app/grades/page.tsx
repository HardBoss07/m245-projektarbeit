"use client";

import { useState, useMemo } from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { SearchBar } from "@/components/molecules/SearchBar";
import { ListEntry } from "@/components/molecules/ListEntry";
import { Card } from "@/components/atoms/Card";
import { Typography } from "@/components/atoms/Typography";
import { Badge } from "@/components/atoms/Badge";
import { useGrades } from "@/hooks/useGrades";
import { Grade } from "@/types/api";

export default function GradesPage() {
  const { grades, loading, error } = useGrades();
  const [expandedSubjects, setExpandedSubjects] = useState<string[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedSubjectName, setSelectedSubjectName] = useState<string | null>(null);

  // Group grades by subject
  const subjects = useMemo(() => {
    return grades.reduce(
      (accumulator, gradeItem) => {
        if (!accumulator[gradeItem.subject]) {
          accumulator[gradeItem.subject] = {
            name: gradeItem.subject,
            grades: [],
            total: 0,
            count: 0,
          };
        }
        const gradeValue = gradeItem.grade ? Number(gradeItem.grade) : 0;
        accumulator[gradeItem.subject].grades.push(gradeItem);
        accumulator[gradeItem.subject].total += gradeValue;
        accumulator[gradeItem.subject].count += 1;
        return accumulator;
      },
      {} as Record<
        string,
        { name: string; grades: Grade[]; total: number; count: number }
      >,
    );
  }, [grades]);

  const subjectList = Object.values(subjects);

  const currentSelectedSubject = useMemo(() => {
    if (subjectList.length === 0) return null;
    if (!selectedSubjectName) {
      return subjectList[0];
    }
    return subjectList.find(subjectItem => subjectItem.name === selectedSubjectName) || subjectList[0];
  }, [selectedSubjectName, subjectList]);

  const { matchedSubjects, remainingSubjects } = useMemo(() => {
    if (!searchQuery.trim()) {
      return { matchedSubjects: subjectList, remainingSubjects: [] };
    }
    const query = searchQuery.toLowerCase();
    const matched = subjectList.filter((subjectItem) =>
      subjectItem.name.toLowerCase().includes(query),
    );
    const remaining = subjectList.filter(
      (subjectItem) => !subjectItem.name.toLowerCase().includes(query),
    );
    return { matchedSubjects: matched, remainingSubjects: remaining };
  }, [subjectList, searchQuery]);

  const totalAvg = useMemo(() => {
    return grades.length > 0
      ? (
          grades.reduce((accumulator, gradeItem) => accumulator + (gradeItem.grade ? Number(gradeItem.grade) : 0), 0) /
          grades.length
        ).toFixed(2)
      : "0.00";
  }, [grades]);

  const toggleSubject = (name: string) => {
    setExpandedSubjects((prev) =>
      prev.includes(name) ? prev.filter((subjectName) => subjectName !== name) : [...prev, name],
    );
  };

  const handleSubjectClick = (name: string) => {
    toggleSubject(name);
    setSelectedSubjectName(name);
  };

  const renderSubject = (subject: (typeof subjectList)[0]) => {
    const isExpanded = expandedSubjects.includes(subject.name);
    const isSelected = selectedSubjectName === subject.name || (currentSelectedSubject && currentSelectedSubject.name === subject.name);
    const avg = (subject.total / subject.count).toFixed(2);

    return (
      <div key={subject.name} className="flex flex-col gap-2">
        <Card
          className={`!p-0 overflow-hidden cursor-pointer active:scale-[0.99] transition-all
                     ${isSelected ? 'ring-2 ring-accent bg-accent/5' : ''}`}
          onClick={() => handleSubjectClick(subject.name)}
        >
          <ListEntry
            title={subject.name}
            subtitle={`${subject.count} Prüfungen`}
            value={avg}
            icon={isExpanded ? "expand_less" : "expand_more"}
          />
        </Card>

        {isExpanded && (
          <div className="ml-4 pl-4 border-l-2 border-accent/30 flex flex-col gap-2 animate-in slide-in-from-top-2 duration-200 lg:hidden">
            {subject.grades.map((grade) => (
              <Card
                key={grade.id}
                variant="elevated"
                className="bg-white !py-3 !px-4"
              >
                <div className="flex justify-between items-center">
                  <div className="flex flex-col gap-0.5">
                    <Typography variant="body-md" className="font-bold">
                      {grade.description}
                    </Typography>
                    <div className="flex gap-2 items-center">
                      <Badge
                        variant="outline"
                        className="text-[10px] py-0 px-1.5 h-auto"
                      >
                        Gewicht: {Number(grade.weight).toFixed(2)}%
                      </Badge>
                      <Typography
                        variant="label-sm"
                        className="text-on-surface-variant"
                      >
                        {grade.description.includes("ZP")
                          ? "Zwischenprüfung"
                          : "Leistungsbeurteilung"}
                      </Typography>
                    </div>
                  </div>
                  <Typography
                    variant="h2"
                    className={
                      Number(grade.grade) < 4 ? "text-error" : "text-primary"
                    }
                  >
                    {Number(grade.grade).toFixed(1)}
                  </Typography>
                </div>
              </Card>
            ))}
          </div>
        )}
      </div>
    );
  };

  return (
    <MobileShell title="Meine Noten" subtitle="Semester 4 • 2026">
      <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Left Column: Semester Performance Card, Search & Subject List */}
        <div className="flex flex-col gap-lg lg:col-span-1">
          {/* Semester Performance Card */}
          <Card variant="glass" className="flex flex-col gap-lg p-lg shadow-lg border-accent/20">
            <Typography variant="h2" className="text-primary border-b border-outline-variant pb-2">Zusammenfassung</Typography>
            <div className="flex flex-col gap-6">
              <div className="flex justify-between items-end">
                <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-widest">Gesamtschnitt</Typography>
                <Typography variant="display" className="text-accent leading-none">{totalAvg}</Typography>
              </div>
              <div className="flex justify-between items-end">
                <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-widest">Fächer</Typography>
                <Typography variant="display" className="text-primary leading-none text-3xl">{subjectList.length}</Typography>
              </div>
            </div>
            
            <div className="mt-4 p-md bg-accent/5 rounded-xl border border-accent/10">
              <Typography variant="body-md" className="text-on-surface-variant font-bold text-center">
                Semester 4 • 2026
              </Typography>
            </div>
          </Card>

          <SearchBar
            placeholder="Nach Modul suchen..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />

          <section className="flex flex-col gap-sm">
            <Typography
              variant="label-sm"
              className="text-on-surface-variant font-bold ml-1"
            >
              Fächerübersicht
            </Typography>

            <div className="flex flex-col gap-md">
              {loading ? (
                <Card className="p-md text-center animate-pulse">
                  Lade Noten...
                </Card>
              ) : error ? (
                <Card className="p-md text-center text-error">{error}</Card>
              ) : subjectList.length > 0 ? (
                <div className="flex flex-col gap-md">
                  {matchedSubjects.map(renderSubject)}

                  {searchQuery.trim() !== "" && remainingSubjects.length > 0 && (
                    <div
                      key="remaining-divider-section"
                      className="flex flex-col gap-md"
                    >
                      <div className="relative py-4">
                        <div
                          className="absolute inset-0 flex items-center"
                          aria-hidden="true"
                        >
                          <div className="w-full border-t border-outline-variant"></div>
                        </div>
                        <div className="relative flex justify-center">
                          <span className="bg-surface px-3 text-label-sm text-outline font-medium">
                            Weitere Resultate
                          </span>
                        </div>
                      </div>
                      {remainingSubjects.map(renderSubject)}
                    </div>
                  )}

                  {searchQuery.trim() !== "" && matchedSubjects.length === 0 && (
                    <div
                      key="no-matches-found"
                      className="p-md text-center text-on-surface-variant italic"
                    >
                      Keine Übereinstimmungen für "{searchQuery}"
                    </div>
                  )}
                </div>
              ) : (
                <div className="p-md text-center text-on-surface-variant italic">
                  Keine Resultate gefunden
                </div>
              )}
            </div>
          </section>
        </div>

        {/* Right Column: Desktop Detailed Subject Pane */}
        <div className="hidden lg:block lg:col-span-2 flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Details: {currentSelectedSubject?.name || 'Kein Fach ausgewählt'}
          </Typography>
          
          {currentSelectedSubject ? (
            <div className="flex flex-col gap-md">
              <div className="overflow-x-auto bg-white rounded-2xl border border-outline-variant shadow-sm">
                <table className="min-w-full divide-y divide-outline-variant">
                  <thead className="bg-surface-container-low">
                    <tr>
                      <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Prüfung</th>
                      <th className="px-6 py-4 text-center text-xs font-bold text-on-surface-variant uppercase tracking-wider">Gewicht</th>
                      <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Typ</th>
                      <th className="px-6 py-4 text-right text-xs font-bold text-on-surface-variant uppercase tracking-wider">Note</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-outline-variant/60 bg-white">
                    {currentSelectedSubject.grades.map((grade) => (
                      <tr key={grade.id} className="hover:bg-surface-container-low/40 transition-colors">
                        <td className="px-6 py-4 whitespace-nowrap">
                          <Typography variant="body-md" className="font-bold">{grade.description}</Typography>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-center">
                          <Badge variant="outline" className="text-[10px] py-0.5 px-2">
                            Gewicht: {Number(grade.weight).toFixed(2)}%
                          </Badge>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <Typography variant="body-md" className="text-on-surface-variant">
                            {grade.description.includes("ZP") ? "Zwischenprüfung" : "Leistungsbeurteilung"}
                          </Typography>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-right">
                          <Typography 
                            variant="h2" 
                            className={`font-bold ${Number(grade.grade) < 4 ? "text-error" : "text-primary"}`}
                          >
                            {Number(grade.grade).toFixed(1)}
                          </Typography>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          ) : (
            <Card className="p-md text-center text-on-surface-variant italic">
              Wählen Sie ein Fach aus, um Details anzuzeigen
            </Card>
          )}
        </div>
      </div>
    </MobileShell>
  );
}
