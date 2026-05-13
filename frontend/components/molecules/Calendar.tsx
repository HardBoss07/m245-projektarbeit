"use client";

import { 
  format, 
  startOfMonth, 
  endOfMonth, 
  startOfWeek, 
  endOfWeek, 
  eachDayOfInterval, 
  isSameMonth, 
  isSameDay, 
  addMonths, 
  subMonths 
} from 'date-fns';
import { de } from 'date-fns/locale';
import { Typography } from '@/components/atoms/Typography';
import { Icon } from '@/components/atoms/Icon';
import { Card } from '@/components/atoms/Card';

interface CalendarProps {
  currentDate: Date;
  onMonthChange: (date: Date) => void;
  onDateClick?: (date: Date) => void;
  eventDates?: Date[];
  highlights?: Record<string, 'primary' | 'error' | 'success' | 'accent'>;
  selectedDate?: Date;
}

export function Calendar({ 
  currentDate, 
  onMonthChange, 
  onDateClick, 
  eventDates = [], 
  highlights = {},
  selectedDate 
}: CalendarProps) {
  const monthStart = startOfMonth(currentDate);
  const monthEnd = endOfMonth(monthStart);
  
  // Start on Monday (weekStartsOn: 1)
  const calendarStart = startOfWeek(monthStart, { weekStartsOn: 1 });
  const calendarEnd = endOfWeek(monthEnd, { weekStartsOn: 1 });

  const calendarDays = eachDayOfInterval({
    start: calendarStart,
    end: calendarEnd,
  });

  const weekDays = ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'];

  return (
    <Card variant="elevated" className="bg-white">
      <div className="flex justify-between items-center mb-md">
        <Typography variant="h2" className="capitalize">
          {format(currentDate, "MMMM yyyy", { locale: de })}
        </Typography>
        <div className="flex gap-sm">
          <button 
            onClick={() => onMonthChange(subMonths(currentDate, 1))}
            className="p-1 hover:bg-surface-container rounded-full transition-colors active:scale-95"
          >
            <Icon name="chevron_left" />
          </button>
          <button 
            onClick={() => onMonthChange(addMonths(currentDate, 1))}
            className="p-1 hover:bg-surface-container rounded-full transition-colors active:scale-95"
          >
            <Icon name="chevron_right" />
          </button>
        </div>
      </div>

      <div className="grid grid-cols-7 gap-1 text-center mb-2">
        {weekDays.map(d => (
          <Typography key={d} variant="label-sm" className="text-on-surface-variant font-bold">
            {d}
          </Typography>
        ))}
      </div>

      <div className="grid grid-cols-7 gap-1">
        {calendarDays.map((day, idx) => {
          const isCurrentMonth = isSameMonth(day, monthStart);
          const isToday = isSameDay(day, new Date());
          const isSelected = selectedDate && isSameDay(day, selectedDate);
          const dateKey = format(day, 'yyyy-MM-dd');
          const highlight = highlights[dateKey];
          const hasEvent = eventDates.some(ed => isSameDay(ed, day));

          let bgClass = 'hover:bg-surface-container';
          let textClass = isCurrentMonth ? 'text-on-surface' : 'text-on-surface-variant/40';

          if (isSelected) {
            bgClass = 'bg-accent text-white shadow-md';
            textClass = 'text-white';
          } else if (highlight === 'error') {
            bgClass = 'bg-error text-white shadow-sm';
            textClass = 'text-white';
          } else if (highlight === 'success') {
            bgClass = 'bg-success text-white shadow-sm';
            textClass = 'text-white';
          } else if (highlight === 'primary') {
            bgClass = 'bg-primary-container text-white shadow-sm';
            textClass = 'text-white';
          } else if (isToday) {
            bgClass = 'border-2 border-accent';
          }

          return (
            <div 
              key={idx} 
              onClick={() => isCurrentMonth && onDateClick?.(day)}
              className={`h-10 flex flex-col items-center justify-center rounded-full transition-all text-sm font-medium relative cursor-pointer
                         ${bgClass} ${textClass}`}
            >
              {format(day, 'd')}
              {hasEvent && !isSelected && !highlight && (
                <div className="absolute bottom-1 w-1 h-1 rounded-full bg-accent" />
              )}
            </div>
          );
        })}
      </div>
    </Card>
  );
}
