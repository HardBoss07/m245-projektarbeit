"use client";

import { use } from "react";
import { MobileShell } from '@/components/organisms/MobileShell';
import { Typography } from '@/components/atoms/Typography';
import { Card } from '@/components/atoms/Card';
import { ListEntry } from '@/components/molecules/ListEntry';
import { MOCK_SUBJECTS, MOCK_ABSENCES } from '@/lib/mock-data';
import { Badge } from '@/components/atoms/Badge';
import Link from 'next/link';

export default function AbsenceDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = use(params);
  const subject = MOCK_SUBJECTS.find(s => s.id === id);
  const absences = MOCK_ABSENCES[id] || [];

  if (!subject) return <div>Subject not found</div>;

  return (
    <MobileShell title={subject.name} subtitle="Absenzübersicht" showBack>
      <div className="p-margin flex flex-col gap-lg">
        {/* Stats */}
        <div className="grid grid-cols-2 gap-md">
          <Card variant="elevated" className="flex flex-col justify-between h-24">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">GESAMT</Typography>
            <Typography variant="display" className="text-primary">{subject.totalAbsences}h</Typography>
          </Card>
          <Card variant="elevated" className={`flex flex-col justify-between h-24 ${subject.unexcusedAbsences > 0 ? 'bg-error-container/20 border-error/20' : ''}`}>
            <Typography variant="label-sm" className="text-on-surface-variant font-bold">OFFEN</Typography>
            <Typography variant="display" className={subject.unexcusedAbsences > 0 ? 'text-error' : 'text-primary'}>
              {subject.unexcusedAbsences}h
            </Typography>
          </Card>
        </div>

        {/* Action Button for Calendar */}
        <Link href={`/absences/${id}/calendar`}>
          <Card className="flex items-center justify-between active:bg-surface-container transition-colors">
            <div className="flex items-center gap-md">
              <div className="w-10 h-10 rounded-full bg-accent/10 text-accent flex items-center justify-center">
                <span className="material-symbols-outlined">calendar_month</span>
              </div>
              <Typography variant="body-md" className="font-bold">Kalenderansicht</Typography>
            </div>
            <span className="material-symbols-outlined text-outline">chevron_right</span>
          </Card>
        </Link>

        {/* History */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            Verlauf
          </Typography>
          <Card className="!p-0 overflow-hidden">
            {absences.map((abs, i) => (
              <div key={abs.id} className="border-b border-outline-variant last:border-0 p-md flex items-center justify-between">
                <div className="flex flex-col">
                  <Typography variant="body-md" className="font-bold">{abs.date}</Typography>
                  <Typography variant="label-sm" className="text-on-surface-variant">
                    {abs.duration}h • {abs.reason || 'Kein Grund angegeben'}
                  </Typography>
                </div>
                <Badge variant={abs.status === 'excused' ? 'green' : abs.status === 'unexcused' ? 'red' : 'cyan'}>
                  {abs.status.toUpperCase()}
                </Badge>
              </div>
            ))}
            {absences.length === 0 && (
              <div className="p-xl text-center">
                <Typography variant="body-md" className="text-on-surface-variant italic">
                  Keine Absenzen erfasst
                </Typography>
              </div>
            )}
          </Card>
        </section>
      </div>
    </MobileShell>
  );
}
