"use client";

import { MobileShell } from '@/components/organisms/MobileShell';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Button } from '@/components/atoms/Button';
import { useRouter } from 'next/navigation';

export default function ProfilePage() {
  const router = useRouter();

  const handleLogout = () => {
    router.push('/');
  };

  return (
    <MobileShell title="Mein Profil">
      <div className="p-margin flex flex-col gap-lg">
        {/* Profile Card */}
        <div className="flex flex-col items-center gap-md py-lg">
          <div className="w-24 h-24 rounded-full bg-primary-container flex items-center justify-center text-white text-4xl font-bold shadow-lg">
            MT
          </div>
          <div className="text-center">
            <Typography variant="h1">Matteo Tocco</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              Informatik Applikationsentwicklung
            </Typography>
          </div>
        </div>

        {/* Info Groups */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            PERSÖNLICHE INFORMATIONEN
          </Typography>
          <Card className="!p-0 overflow-hidden">
            <ListEntry title="E-Mail" subtitle="matteo.tocco@wiss.ch" icon="mail" />
            <ListEntry title="Klasse" subtitle="AP24a" icon="group" />
            <ListEntry title="Lehrjahr" subtitle="2. Lehrjahr" icon="calendar_today" />
          </Card>
        </section>

        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            SYSTEM & SICHERHEIT
          </Typography>
          <Card className="!p-0 overflow-hidden">
            <ListEntry title="Passwort ändern" icon="lock" onClick={() => {}} />
            <ListEntry title="Benachrichtigungen" icon="notifications" onClick={() => {}} />
          </Card>
        </section>

        <Button 
          variant="ghost" 
          fullWidth 
          className="mt-lg border-error text-error hover:bg-error/5"
          onClick={handleLogout}
        >
          Abmelden
        </Button>
      </div>
    </MobileShell>
  );
}
