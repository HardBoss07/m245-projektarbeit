"use client";

import { useState, useMemo } from 'react';
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { Icon } from '@/components/atoms/Icon';
import { Calendar } from '@/components/molecules/Calendar';
import { useTimetable } from '@/hooks/useTimetable';
import { format, parseISO, isSameDay, startOfDay, startOfMonth, endOfMonth } from 'date-fns';
import { de } from 'date-fns/locale';

export default function SchedulePage() {
  const [view, setView] = useState<'day' | 'month'>('day');
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [currentMonth, setCurrentMonth] = useState(new Date());

  const days = ['Mo', 'Di', 'Mi', 'Do', 'Fr'];
  
  const timetableParams = useMemo(() => {
    // Standardize ISO strings to exclude milliseconds
    const formatDate = (date: Date) => date.toISOString().split('.')[0] + 'Z';
    
    // Fetch for the entire current month to show dots in calendar
    return {
      from: formatDate(startOfMonth(currentMonth)),
      to: formatDate(endOfMonth(currentMonth))
    };
  }, [currentMonth]);

  const { entries, loading, error } = useTimetable(timetableParams);

  const daySchedule = useMemo(() => {
    return entries.filter(entry => isSameDay(parseISO(entry.startTime), selectedDate));
  }, [entries, selectedDate]);

  const eventDates = useMemo(() => {
    return entries.map(entry => parseISO(entry.startTime));
  }, [entries]);

  const handleDateClick = (date: Date) => {
    setSelectedDate(date);
    setView('day');
  };

  // Find Monday of the week containing selectedDate
  const weekDays = useMemo(() => {
    const startOfWeek = new Date(selectedDate);
    const day = startOfWeek.getDay();
    const diff = startOfWeek.getDate() - day + (day === 0 ? -6 : 1); // adjust when day is sunday
    startOfWeek.setDate(diff);

    const dates = [];
    for (let index = 0; index < 5; index++) {
      const date = new Date(startOfWeek);
      date.setDate(startOfWeek.getDate() + index);
      dates.push(date);
    }
    return dates;
  }, [selectedDate]);

  return (
    <MobileShell 
      title="Stundenplan" 
      subtitle={view === 'day' ? format(selectedDate, "eeee, d. MMMM yyyy", { locale: de }) : format(currentMonth, "MMMM yyyy", { locale: de })}
    >
      <div className="flex flex-col gap-md">
        {/* View Toggle */}
        <div className="px-margin pt-md">
          <div className="flex bg-surface-container p-1 rounded-xl">
            <button 
              onClick={() => setView('day')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'day' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Tag
            </button>
            <button 
              onClick={() => setView('month')}
              className={`flex-1 py-2 rounded-lg text-sm font-bold transition-all
                         ${view === 'month' ? 'bg-white shadow-sm text-primary' : 'text-on-surface-variant'}`}
            >
              Monat
            </button>
          </div>
        </div>

        {view === 'day' ? (
          <>
            {/* Week Navigation for Desktop */}
            <div className="hidden lg:flex justify-between items-center px-margin pt-md">
              <button
                onClick={() => {
                  const previousWeek = new Date(selectedDate);
                  previousWeek.setDate(selectedDate.getDate() - 7);
                  setSelectedDate(previousWeek);
                }}
                className="flex items-center gap-1 text-sm font-bold text-on-surface-variant hover:text-primary transition-colors"
              >
                <Icon name="chevron_left" /> Vorherige Woche
              </button>
              <Typography variant="h2" className="font-bold">
                Wochenansicht
              </Typography>
              <button
                onClick={() => {
                  const nextWeek = new Date(selectedDate);
                  nextWeek.setDate(selectedDate.getDate() + 7);
                  setSelectedDate(nextWeek);
                }}
                className="flex items-center gap-1 text-sm font-bold text-on-surface-variant hover:text-primary transition-colors"
              >
                Nächste Woche <Icon name="chevron_right" />
              </button>
            </div>

            {/* Day Selector - 5 day work week around selected date - Mobile Only */}
            <div className="bg-white border-y border-outline-variant px-margin py-4 flex justify-between lg:hidden">
              {days.map((day, index) => {
                const dayDate = new Date(selectedDate);
                const dayOffset = index - (selectedDate.getDay() === 0 ? 6 : selectedDate.getDay() - 1);
                dayDate.setDate(selectedDate.getDate() + dayOffset);
                
                return (
                  <div 
                    key={day}
                    onClick={() => setSelectedDate(new Date(dayDate))}
                    className={`w-12 h-12 rounded-full flex flex-col items-center justify-center transition-colors cursor-pointer
                               ${isSameDay(selectedDate, dayDate) ? 'bg-accent text-white shadow-md' : 'text-on-surface-variant'}`}
                  >
                    <Typography variant="label-sm" className="font-bold">{day}</Typography>
                    <Typography variant="body-md" className="font-bold">{format(dayDate, 'd')}</Typography>
                  </div>
                );
              })}
            </div>

            {/* Desktop Week Grid */}
            <div className="hidden lg:grid lg:grid-cols-5 lg:gap-4 p-margin">
              {weekDays.map((dayDate) => {
                const dayName = format(dayDate, 'eeee', { locale: de });
                const formattedDate = format(dayDate, 'd. MMMM', { locale: de });
                const isToday = isSameDay(new Date(), dayDate);
                const lessons = entries.filter((entry) => isSameDay(parseISO(entry.startTime), dayDate));

                return (
                  <div 
                    key={dayDate.toString()} 
                    className={`flex flex-col gap-md p-md rounded-2xl border transition-all duration-300
                               ${isToday 
                                 ? 'bg-accent/5 border-accent shadow-sm' 
                                 : 'bg-white border-outline-variant'}`}
                  >
                    {/* Day Column Header */}
                    <div className="flex flex-col border-b border-outline-variant/60 pb-3">
                      <Typography variant="body-lg" className={`font-bold ${isToday ? 'text-accent' : 'text-primary'}`}>
                        {dayName}
                      </Typography>
                      <Typography variant="label-sm" className="text-on-surface-variant font-bold">
                        {formattedDate}
                      </Typography>
                    </div>

                    {/* Day Column Lessons */}
                    <div className="flex-1 flex flex-col gap-sm overflow-y-auto min-h-[400px]">
                      {loading ? (
                        <div className="p-md text-center text-sm text-on-surface-variant animate-pulse">
                          Lade...
                        </div>
                      ) : lessons.length > 0 ? (
                        lessons.map((item) => {
                          const startTime = format(parseISO(item.startTime), 'HH:mm');
                          const endTime = format(parseISO(item.endTime), 'HH:mm');
                          const currentTime = new Date();
                          const isActive = currentTime >= parseISO(item.startTime) && currentTime <= parseISO(item.endTime);

                          return (
                            <Card 
                              key={item.id}
                              variant={isActive ? 'glass' : 'elevated'} 
                              className={`flex flex-col gap-1 p-3 transition-all duration-200 hover:shadow-lg hover:-translate-y-1 group
                                         ${isActive ? 'border-accent border-2 ring-1 ring-accent/20' : 'hover:border-accent/40'}`}
                            >
                              <div className="flex justify-between items-start">
                                <Typography variant="label-sm" className="font-bold text-accent group-hover:scale-105 transition-transform origin-left">
                                  {startTime} - {endTime}
                                </Typography>
                                {isActive && (
                                  <span className="flex h-2 w-2 relative">
                                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-accent opacity-75"></span>
                                    <span className="relative inline-flex rounded-full h-2 w-2 bg-accent"></span>
                                  </span>
                                )}
                              </div>
                              <Typography variant="body-md" className="font-bold line-clamp-2 leading-tight">
                                {item.subjectName}
                              </Typography>
                              <Typography variant="label-sm" className="text-on-surface-variant mt-1 group-hover:text-on-surface transition-colors">
                                {item.lecturerName} • {item.roomName}
                              </Typography>
                            </Card>
                          );
                        })
                      ) : (
                        <div className="flex-1 flex items-center justify-center py-8 opacity-40">
                          <Typography variant="body-md" className="text-on-surface-variant italic text-center">
                            Keine Lektionen
                          </Typography>
                        </div>
                      )}
                    </div>
                  </div>
                );
              })}
            </div>

            {/* Timeline - Mobile Only */}
            <div className="p-margin flex flex-col gap-md lg:hidden">
              {loading ? (
                <div className="p-md text-center animate-pulse">Lade Stundenplan...</div>
              ) : error ? (
                <div className="p-md text-center text-error">{error}</div>
              ) : daySchedule.length > 0 ? (
                daySchedule.map((item) => {
                  const startTime = format(parseISO(item.startTime), 'HH:mm');
                  const now = new Date();
                  const isActive = now >= parseISO(item.startTime) && now <= parseISO(item.endTime);

                  return (
                    <div key={item.id} className="flex gap-md">
                      <div className="w-12 flex flex-col items-center pt-2">
                        <Typography variant="label-sm" className="font-bold text-on-surface-variant">
                          {startTime}
                        </Typography>
                        <div className="w-px h-full bg-outline-variant my-2" />
                      </div>
                      
                      <Card 
                        variant={isActive ? 'glass' : 'elevated'} 
                        className={`flex-1 flex flex-col gap-1 ${isActive ? 'border-accent border-2' : ''}`}
                      >
                        <div className="flex justify-between items-start">
                          <Typography variant="body-md" className="font-bold">{item.subjectName}</Typography>
                          {isActive && (
                            <div className="flex items-center gap-1 text-accent">
                              <div className="w-2 h-2 rounded-full bg-accent animate-pulse" />
                              <Typography variant="label-sm" className="font-bold uppercase tracking-widest">Jetzt</Typography>
                            </div>
                          )}
                        </div>
                        <Typography variant="label-sm" className="text-on-surface-variant">
                          {item.lecturerName} • {item.roomName}
                        </Typography>
                      </Card>
                    </div>
                  );
                })
              ) : (
                <div className="p-md text-center text-on-surface-variant italic">
                  Keine Lektionen an diesem Tag
                </div>
              )}
            </div>
          </>
        ) : (
          /* Month View using reusable Calendar component - Responsive columns */
          <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-6">
            <div className="lg:col-span-2">
              <Calendar 
                currentDate={currentMonth}
                onMonthChange={setCurrentMonth}
                onDateClick={handleDateClick}
                eventDates={eventDates}
                selectedDate={selectedDate}
              />
            </div>

            <section className="space-y-md">
              <Typography variant="label-sm" className="font-bold text-on-surface-variant ml-1">KOMMENDE TERMINE</Typography>
              <Card className="flex items-center gap-md">
                <div className="w-12 h-12 bg-primary text-white rounded-lg flex flex-col items-center justify-center">
                  <span className="text-[10px] uppercase font-bold">Mai</span>
                  <span className="text-lg font-bold">15</span>
                </div>
                <div className="flex-1">
                  <Typography variant="body-md" className="font-bold">Modul-Abschlussprüfung</Typography>
                  <Typography variant="label-sm" className="text-on-surface-variant">Raum 405 • 09:00 Uhr</Typography>
                </div>
                <Icon name="chevron_right" />
              </Card>
            </section>
          </div>
        )}
      </div>
    </MobileShell>
  );
}
