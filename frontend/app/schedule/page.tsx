import React from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { BentoCard } from "@/components/molecules/BentoCard";
import { Clock, MapPin, Search, Bell } from "lucide-react";
import { cn } from "@/lib/utils";

export default function SchedulePage() {
  const days = [
    { name: "Mon", date: "16", active: false },
    { name: "Tue", date: "17", active: true },
    { name: "Wed", date: "18", active: false },
    { name: "Thu", date: "19", active: false },
    { name: "Fri", date: "20", active: false },
  ];

  const classes = [
    {
      title: "Software Engineering",
      room: "Room 302",
      instructor: "Dr. Adrian Müller",
      time: "08:30 - 10:00",
      isNow: true,
    },
    {
      title: "Database Management",
      room: "Lab 12",
      instructor: "Prof. Sarah Jenkins",
      time: "10:15 - 11:45",
      isNow: false,
    },
    {
      type: "break",
      title: "Lunch Break",
      time: "11:45 - 13:00",
    },
    {
      title: "Web Development II",
      room: "Auditorium B",
      instructor: "Marcella Vontobel",
      time: "13:00 - 14:30",
      isNow: false,
    },
  ];

  return (
    <MobileShell>
      <div className="space-y-6">
        <header className="flex items-center justify-between">
          <h2 className="text-h1 uppercase">Stundenplan</h2>
          <span className="text-on-surface-variant text-label-sm">October 2023</span>
        </header>

        {/* Date Picker */}
        <div className="flex gap-3 overflow-x-auto pb-2 -mx-1 px-1 hide-scrollbar">
          {days.map((day, i) => (
            <button
              key={i}
              className={cn(
                "flex flex-col items-center justify-center min-w-[56px] h-20 rounded-xl transition-all active:scale-95",
                day.active
                  ? "bg-primary text-on-primary shadow-raised scale-105"
                  : "bg-surface-container-low border border-outline-variant text-on-surface-variant hover:bg-surface-container-high"
              )}
            >
              <span className={cn("text-label-sm", day.active ? "opacity-80" : "")}>
                {day.name}
              </span>
              <span className="text-h2">{day.date}</span>
              {day.active && <div className="w-1 h-1 bg-on-primary rounded-full mt-1" />}
            </button>
          ))}
        </div>

        {/* Timetable Timeline */}
        <div className="space-y-6 mt-4">
          {classes.map((cls, i) => (
            <div key={i} className="relative pl-8">
              {/* Timeline Indicator */}
              <div className="absolute left-[7px] top-0 bottom-0 w-[2px] bg-outline-variant" />
              <div
                className={cn(
                  "absolute left-0 top-1 w-4 h-4 rounded-full border-2 bg-background z-10",
                  cls.isNow ? "border-primary" : "border-outline-variant"
                )}
              />

              {cls.type === "break" ? (
                <div className="flex items-center gap-4 py-2">
                  <div className="h-[1px] flex-1 bg-outline-variant" />
                  <span className="text-label-sm text-outline uppercase tracking-widest font-bold">
                    {cls.title}
                  </span>
                  <div className="h-[1px] flex-1 bg-outline-variant" />
                </div>
              ) : (
                <BentoCard
                  variant={cls.isNow ? "elevated" : "flat"}
                  className={cn(cls.isNow && "bg-surface-container")}
                >
                  <div className="flex justify-between items-start mb-2">
                    {cls.isNow ? (
                      <span className="text-primary text-label-sm font-bold bg-primary-fixed px-2 py-0.5 rounded-full">
                        NOW
                      </span>
                    ) : (
                      <span className="text-on-surface-variant text-label-sm uppercase tracking-wider">
                        Upcoming
                      </span>
                    )}
                    <div className="flex items-center gap-1 text-label-sm text-on-surface-variant">
                      <MapPin size={14} />
                      <span>{cls.room}</span>
                    </div>
                  </div>
                  <h3 className="text-h2 mb-1">{cls.title}</h3>
                  <p className="text-body-md text-on-surface-variant mb-4">
                    {cls.instructor}
                  </p>
                  <div className="flex items-center gap-2 text-on-surface-variant text-label-sm">
                    <Clock size={16} />
                    <span>{cls.time}</span>
                  </div>
                </BentoCard>
              )}
            </div>
          ))}
        </div>

        {/* Event Card */}
        <div className="relative rounded-2xl overflow-hidden bg-primary-container h-40 group mt-4">
          <div className="absolute inset-0 bg-gradient-to-t from-primary-container via-primary-container/40 to-transparent p-6 flex flex-col justify-end">
            <span className="inline-block bg-tertiary-fixed text-on-tertiary-fixed text-label-sm px-2 py-1 rounded w-fit mb-2">
              SPECIAL EVENT
            </span>
            <h4 className="text-white text-h2">Cloud Computing Workshop</h4>
            <p className="text-on-primary-container text-body-md">Starts tomorrow at 09:00</p>
          </div>
        </div>
      </div>
    </MobileShell>
  );
}
