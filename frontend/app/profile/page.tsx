"use client";

import { MobileShell } from '@/components/organisms/MobileShell';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Button } from '@/components/atoms/Button';
import { useRouter } from 'next/navigation';
import { useUser } from '@/hooks/useUser';
import { authService } from '@/services/auth';

export default function ProfilePage() {
  const router = useRouter();
  const { user, loading } = useUser();

  const handleLogout = async () => {
    await authService.logout();
    router.push('/');
  };

  const initials = user ? `${user.firstName[0]}${user.lastName[0]}` : 'MT';

  return (
    <MobileShell title="Mein Profil">
      <div className="p-margin flex flex-col gap-lg">
        {/* Profile Card */}
        <div className="flex flex-col items-center gap-md py-lg">
          <div className="w-24 h-24 rounded-full bg-primary-container flex items-center justify-center text-white text-4xl font-bold shadow-lg">
            {loading ? '...' : initials}
          </div>
          <div className="text-center">
            <Typography variant="h1">{loading ? 'Lade...' : `${user?.firstName} ${user?.lastName}`}</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              {user?.roleName || 'Informatik Applikationsentwicklung'}
            </Typography>
          </div>
        </div>

        {/* Info Groups */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">
            PERSÖNLICHE INFORMATIONEN
          </Typography>
          <Card className="!p-0 overflow-hidden">
            <ListEntry title="E-Mail" subtitle={user?.email || '...'} icon="mail" />
            <ListEntry title="Sprache" subtitle={user?.language === 'de' ? 'Deutsch' : 'English'} icon="language" />
            <ListEntry title="Sichtbarkeit" subtitle={user?.publishDetails ? 'Öffentlich' : 'Privat'} icon="visibility" />
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
