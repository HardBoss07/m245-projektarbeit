"use client";

import React, { useState } from 'react';
import { Typography } from '@/components/atoms/Typography';
import { Input } from '@/components/atoms/Input';
import { Button } from '@/components/atoms/Button';
import { Icon } from '@/components/atoms/Icon';
import { useRouter } from 'next/navigation';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const router = useRouter();

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    // Simulate API call
    setTimeout(() => {
      setIsLoading(false);
      router.push('/dashboard');
    }, 1000);
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
            <Typography variant="display" className="tracking-tighter">WISS TOCCO</Typography>
            <Typography variant="body-md" className="text-on-surface-variant">
              Academic Excellence & Clarity
            </Typography>
          </div>
        </div>

        {/* Form */}
        <form onSubmit={handleLogin} className="flex flex-col gap-6 bg-white p-8 rounded-2xl border border-outline-variant shadow-md w-full">
          <div className="flex flex-col gap-5 w-full">
            <Input 
              label="Studenten E-Mail" 
              placeholder="vorname.nachname@wiss.ch" 
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
            <Input 
              label="Passwort" 
              placeholder="••••••••" 
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>

          <div className="flex items-center justify-between">
            <label className="flex items-center gap-2 cursor-pointer">
              <input type="checkbox" className="w-4 h-4 rounded border-outline-variant text-accent focus:ring-accent" />
              <Typography variant="label-sm">Angemeldet bleiben</Typography>
            </label>
            <Typography variant="label-sm" className="text-accent font-bold cursor-pointer hover:underline">
              Passwort vergessen?
            </Typography>
          </div>

          <div className="flex flex-col gap-3">
            <Button 
              type="submit" 
              fullWidth 
              disabled={isLoading}
            >
              {isLoading ? 'Anmelden...' : 'Login'}
            </Button>
            
            <Button 
              type="button"
              variant="ghost"
              fullWidth
              onClick={handleBypass}
              className="border-accent text-accent hover:bg-accent/5"
            >
              Dev Bypass (No Login)
            </Button>
          </div>
        </form>

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
