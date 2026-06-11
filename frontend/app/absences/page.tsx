'use client';

import { useState, useMemo } from 'react';
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Calendar } from '@/components/molecules/Calendar';
import { SearchBar } from '@/components/molecules/SearchBar';
import { FilterChips } from '@/components/molecules/FilterChips';
import { useAttendance } from '@/hooks/useAttendance';
import { AttendanceStatus } from '@/types/models';
import { format, parseISO, isSameDay } from 'date-fns';
import { de } from 'date-fns/locale';
import Link from 'next/link';

type FilterStatus = AttendanceStatus | 'All';

const FILTER_OPTIONS: FilterStatus[] = [
  'All',
  'Teilgenommen',
  'Nicht teilgenommen entschuldigt',
  'Offen',
  'Abwesend 100%',
  'Nicht teilgenommen unentschuldigt'
];

export default function AbsencesPage() {
  const { summary, loading, error } = useAttendance();
  const [view, setView] = useState<'list' | 'calendar'>('list');
  const [currentMonth, setCurrentMonth] = useState(new Date());
  const [selectedDate, setSelectedDate] = useState<Date | null>(null);
  const [searchQuery, setSearchQuery] = useState('');
  const [activeFilter, setActiveFilter] = useState<FilterStatus>('All');

  // Combined filtering logic
  const filteredSummary = useMemo(() => {
    return summary.filter(entry => {
      const matchesSearch = entry.className.toLowerCase().includes(searchQuery.toLowerCase());
      const matchesStatus = activeFilter === 'All' || 
                           (activeFilter === 'Offen' ? (entry.status === 'Offen' || !entry.status) : entry.status === activeFilter);
      return matchesSearch && matchesStatus;
    });
  }, [summary, searchQuery, activeFilter]);

  // Group summary by classId/className for the list view
  const classSummaries = useMemo(() => {
    return filteredSummary.reduce((accumulator, entry) => {
      if (!accumulator[entry.classId]) {
        accumulator[entry.classId] = {
          id: entry.classId,
          name: entry.className,
          totalRequired: 0,
          totalAttended: 0,
          unexcusedCount: 0
        };
      }
      const attended = entry.attendedLessons ? Number(entry.attendedLessons) : 0;
      accumulator[entry.classId].totalRequired += Number(entry.requiredLessons);
      accumulator[entry.classId].totalAttended += attended;
      
      return accumulator;
    }, {} as Record<string, any>);
  }, [filteredSummary]);

  const list = Object.values(classSummaries);
  
  const totalMissed = useMemo(() => {
    return summary.reduce((accumulator, entry) => {
      const required = Number(entry.requiredLessons);
      const attended = entry.attendedLessons ? Number(entry.attendedLessons) : 0;
      return accumulator + (required - attended);
    }, 0);
  }, [summary]);

  const openAbsencesCount = useMemo(() => {
    return summary.filter(absence => absence.status === 'Offen' || !absence.status).length;
  }, [summary]);

  const statusHighlights = useMemo(() => {
    const map: Record<string, AttendanceStatus> = {};
    filteredSummary.forEach(summaryItem => {
      if (summaryItem.status) {
        const dateKey = format(parseISO(summaryItem.sessionDate), 'yyyy-MM-dd');
        map[dateKey] = summaryItem.status;
      }
    });
    return map;
  }, [filteredSummary]);

  const selectedAbsences = useMemo(() => {
    if (!selectedDate) return [];
    return filteredSummary.filter(summaryItem => isSameDay(parseISO(summaryItem.sessionDate), selectedDate));
  }, [selectedDate, filteredSummary]);

  return (
    <MobileShell title="Absenzen" subtitle={view === 'list' ? "Semester 4 • 2026" : format(currentMonth, "MMMM yyyy", { locale: de })}>
      <div className="flex flex-col gap-md">
        {/* Search and Filter Section */}
        <div className="p-margin flex flex-col gap-2">
          <SearchBar 
            placeholder="Nach Modul suchen..." 
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
          />
          <FilterChips 
            options={FILTER_OPTIONS}
            activeOption={activeFilter}
            onOptionChange={setActiveFilter}
          />
        </div>

        {/* View Toggle */}
        <div className="px-margin">
          <div className="flex bg-surface-container p-1 rounded-xl">
            <button 
              onClick={() => setView('list')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'list' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Übersicht
            </button>
            <button 
              onClick={() => setView('calendar')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'calendar' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Kalender
            </button>
          </div>
        </div>

        {view === 'list' ? (
          <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6 animate-in fade-in duration-300">
            {/* Table on Desktop / Card List on Mobile */}
            <section className="flex flex-col gap-sm lg:col-span-2">
              <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
                Übersicht nach Modul
              </Typography>
              
              {/* Mobile View Card */}
              <Card className="!p-0 overflow-hidden lg:hidden">
                {loading ? (
                  <div className="p-md text-center animate-pulse">Lade Absenzen...</div>
                ) : error ? (
                  <div className="p-md text-center text-error">{error}</div>
                ) : list.length > 0 ? (
                  list.map((classItem) => (
                    <Link key={classItem.id} href={`/absences/${classItem.id}/calendar`}>
                      <ListEntry
                        title={classItem.name}
                        subtitle="Informatik"
                        value={`${(classItem.totalRequired - classItem.totalAttended).toFixed(1)} Lekt.`}
                        icon="event_busy"
                      />
                    </Link>
                  ))
                ) : (
                  <div className="p-md text-center text-on-surface-variant italic">
                    {searchQuery || activeFilter !== 'All' ? 'Keine Übereinstimmungen gefunden' : 'Keine Absenzen erfasst'}
                  </div>
                )}
              </Card>

              {/* Desktop Table View */}
              <div className="hidden lg:block overflow-x-auto bg-white rounded-2xl border border-outline-variant shadow-sm">
                <table className="min-w-full divide-y divide-outline-variant">
                  <thead className="bg-surface-container-low">
                    <tr>
                      <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Modul</th>
                      <th className="px-6 py-4 text-left text-xs font-bold text-on-surface-variant uppercase tracking-wider">Kategorie</th>
                      <th className="px-6 py-4 text-right text-xs font-bold text-on-surface-variant uppercase tracking-wider">Verpasste Lektionen</th>
                      <th className="px-6 py-4 text-center text-xs font-bold text-on-surface-variant uppercase tracking-wider">Aktion</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-outline-variant/60 bg-white">
                    {loading ? (
                      <tr>
                        <td colSpan={4} className="px-6 py-8 text-center animate-pulse text-on-surface-variant">
                          Lade Absenzen...
                        </td>
                      </tr>
                    ) : error ? (
                      <tr>
                        <td colSpan={4} className="px-6 py-8 text-center text-error">
                          {error}
                        </td>
                      </tr>
                    ) : list.length > 0 ? (
                      list.map((classItem) => (
                        <tr key={classItem.id} className="hover:bg-surface-container-low/40 transition-colors">
                          <td className="px-6 py-4 whitespace-nowrap">
                            <Typography variant="body-md" className="font-bold">{classItem.name}</Typography>
                          </td>
                          <td className="px-6 py-4 whitespace-nowrap">
                            <Typography variant="body-md" className="text-on-surface-variant">Informatik</Typography>
                          </td>
                          <td className="px-6 py-4 whitespace-nowrap text-right">
                            <Typography variant="body-md" className="font-bold text-error">
                              {(classItem.totalRequired - classItem.totalAttended).toFixed(1)} Lekt.
                            </Typography>
                          </td>
                          <td className="px-6 py-4 whitespace-nowrap text-center">
                            <Link 
                              href={`/absences/${classItem.id}/calendar`}
                              className="inline-flex items-center justify-center px-4 py-2 bg-accent/10 hover:bg-accent/20 text-accent font-bold rounded-lg text-sm transition-colors"
                            >
                              Kalender anzeigen
                            </Link>
                          </td>
                        </tr>
                      ))
                    ) : (
                      <tr>
                        <td colSpan={4} className="px-6 py-8 text-center text-on-surface-variant italic">
                          {searchQuery || activeFilter !== 'All' ? 'Keine Übereinstimmungen gefunden' : 'Keine Absenzen erfasst'}
                        </td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            </section>

            {/* Summary Card */}
            <div className="lg:col-span-1">
              <Card variant="glass" className="flex flex-col gap-lg p-lg shadow-lg border-accent/20">
                <Typography variant="h2" className="text-primary border-b border-outline-variant pb-2">Zusammenfassung</Typography>
                <div className="flex flex-col gap-6">
                  <div className="flex justify-between items-end">
                    <Typography variant="label-sm" className="text-on-surface-variant font-bold uppercase tracking-widest">Gesamt (Lekt.)</Typography>
                    <Typography variant="display" className="text-primary leading-none">{totalMissed.toFixed(1)}</Typography>
                  </div>
                  <div className="flex justify-between items-end">
                    <Typography variant="label-sm" className={`${openAbsencesCount > 0 ? "text-error" : "text-on-surface-variant"} font-bold uppercase tracking-widest`}>
                      Offene Einträge
                    </Typography>
                    <Typography variant="display" className={`${openAbsencesCount > 0 ? "text-error" : "text-primary"} leading-none`}>
                      {openAbsencesCount}
                    </Typography>
                  </div>
                </div>
                
                <div className="mt-4 p-md bg-accent/5 rounded-xl border border-accent/10">
                  <Typography variant="body-md" className="text-on-surface-variant italic text-center">
                    Regelmässige Präsenz ist entscheidend für Ihren Studienerfolg.
                  </Typography>
                </div>
              </Card>
            </div>
          </div>
        ) : (
          /* Calendar View - Responsive Layout */
          <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6 animate-in fade-in duration-300">
            <div className="lg:col-span-2">
              <Calendar 
                currentDate={currentMonth}
                onMonthChange={setCurrentMonth}
                onDateClick={setSelectedDate}
                statusHighlights={statusHighlights}
                selectedDate={selectedDate || undefined}
              />
            </div>

            {/* Selected Day Details */}
            <div className="lg:col-span-1">
              {selectedDate && (
                <section className="flex flex-col gap-sm">
                  <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1 uppercase">
                    Details für {format(selectedDate, "d. MMMM", { locale: de })}
                  </Typography>
                  {selectedAbsences.length > 0 ? (
                    <div className="flex flex-col gap-2">
                      {selectedAbsences.map((absenceItem, index) => (
                        <Card key={`${absenceItem.classId}-${index}`} variant="elevated" className="bg-white">
                          <div className="flex justify-between items-start">
                            <div>
                              <Typography variant="body-md" className="font-bold">{absenceItem.className}</Typography>
                              <Typography variant="label-sm" className="text-on-surface-variant">
                                {absenceItem.requiredLessons} Lektionen • {absenceItem.status || 'Offen'}
                              </Typography>
                            </div>
                            <div className={`w-3 h-3 rounded-full ${absenceItem.status === 'Nicht teilgenommen entschuldigt' ? 'bg-success' : 'bg-error'}`} />
                          </div>
                        </Card>
                      ))}
                    </div>
                  ) : (
                    <Card className="p-md text-center text-on-surface-variant italic">
                      {searchQuery || activeFilter !== 'All' ? 'Keine Übereinstimmungen für diesen Tag' : 'Keine Einträge für diesen Tag'}
                    </Card>
                  )}
                </section>
              )}
            </div>
          </div>
        )}
      </div>
    </MobileShell>
  );
}
