"use client";

import React, { useState } from 'react';
import { Typography } from '@/components/atoms/Typography';
import { Input } from '@/components/atoms/Input';
import { Button } from '@/components/atoms/Button';
import { Icon } from '@/components/atoms/Icon';
import { useRouter } from 'next/navigation';
import { authService } from '@/services/auth';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);
    
    try {
      await authService.dummyOAuth();
      router.push('/dashboard');
    } catch (err) {
      setError('Fehler bei der Authentifizierung. Bitte versuchen Sie es erneut.');
      console.error(err);
    } finally {
      setIsLoading(false);
    }
  };

  const handleBypass = () => {
    router.push('/dashboard');
  };

  return (
    <main className="min-h-screen bg-surface flex flex-col justify-center items-center px-6 py-12">
      <div className="w-full max-w-[400px] flex flex-col gap-10">
        {/* Logo/Brand */}
        <div className="flex flex-col items-center gap-4">
          <div className="w-20 h-20 bg-primary-container rounded-2xl flex items-center justify-center text-white shadow-xl">
            <Icon name="school" className="text-4xl" />
          </div>
          <div className="text-center">
            <Typography variant="display" className="tracking-tighter">WISS ESTUDIO</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              Academic Excellence & Clarity
            </Typography>
          </div>
        </div>

        {/* Form */}
        <div className="flex flex-col gap-6 bg-white p-8 rounded-2xl border border-outline-variant shadow-md w-full">
          <div className="text-center mb-4">
            <Typography variant="body-md" className="text-on-surface-variant">
              Der lokale Login wurde durch den Microsoft OAuth Flow ersetzt.
            </Typography>
          </div>

          {error && (
            <div className="bg-error/10 text-error p-3 rounded-lg text-sm mb-4 border border-error/20">
              {error}
            </div>
          )}

          <div className="flex flex-col gap-3">
            <Button 
              type="button" 
              fullWidth 
              onClick={handleLogin}
              disabled={isLoading}
              className="bg-[#2F2F2F] hover:bg-black"
            >
              <div className="flex items-center gap-2">
                {isLoading ? 'Verbinden...' : (
                  <>
                    <Icon name="login" className="text-xl" />
                    Mit Microsoft anmelden
                  </>
                )}
              </div>
            </Button>
            
            <Typography variant="label-sm" className="text-center text-on-surface-variant mt-2 italic">
              Authentifiziert als: matteo.bosshard@wiss-edu.ch
            </Typography>
          </div>
        </div>

        {/* Footer */}
        <div className="text-center">
          <Typography variant="label-sm" className="text-on-surface-variant">
            Probleme beim Login? <br/>
            <span className="text-accent font-bold cursor-pointer">Support kontaktieren</span>
          </Typography>
        </div>
      </div>
    </main>
  );
}
