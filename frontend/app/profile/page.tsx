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
      <div className="p-margin grid grid-cols-1 lg:grid-cols-3 gap-lg">
        {/* Profile Column */}
        <div className="flex flex-col items-center lg:items-start gap-md py-lg lg:py-0 lg:col-span-1">
          <div className="w-24 h-24 lg:w-32 lg:h-32 rounded-full bg-primary-container flex items-center justify-center text-white text-4xl lg:text-5xl font-bold shadow-lg">
            {loading ? '...' : initials}
          </div>
          <div className="text-center lg:text-left">
            <Typography variant="h1" className="lg:text-3xl">{loading ? 'Lade...' : `${user?.firstName} ${user?.lastName}`}</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              {user?.roleName || 'Informatik Applikationsentwicklung'}
            </Typography>
          </div>
          
          <Button 
            variant="ghost" 
            fullWidth 
            className="mt-md border-error text-error hover:bg-error/5 hidden lg:flex"
            onClick={handleLogout}
          >
            Abmelden
          </Button>
        </div>

        {/* Settings Column */}
        <div className="flex flex-col gap-lg lg:col-span-2">
          {/* Info Groups */}
          <section className="flex flex-col gap-sm">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1 uppercase">
              Persönliche Informationen
            </Typography>
            <Card className="!p-0 overflow-hidden">
              <ListEntry title="E-Mail" subtitle={user?.email || '...'} icon="mail" />
              <ListEntry title="Sprache" subtitle={user?.language === 'de' ? 'Deutsch' : 'English'} icon="language" />
              <ListEntry title="Sichtbarkeit" subtitle={user?.publishDetails ? 'Öffentlich' : 'Privat'} icon="visibility" />
            </Card>
          </section>

          <section className="flex flex-col gap-sm">
            <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1 uppercase">
              System & Sicherheit
            </Typography>
            <Card className="!p-0 overflow-hidden">
              <ListEntry title="Passwort ändern" icon="lock" onClick={() => {}} />
              <ListEntry title="Benachrichtigungen" icon="notifications" onClick={() => {}} />
            </Card>
          </section>

          <Button 
            variant="ghost" 
            fullWidth 
            className="mt-lg border-error text-error hover:bg-error/5 lg:hidden"
            onClick={handleLogout}
          >
            Abmelden
          </Button>
        </div>
      </div>
    </MobileShell>
  );
}
