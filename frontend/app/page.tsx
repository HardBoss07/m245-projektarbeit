import React from "react";
import { School, Info } from "lucide-react";
import { Button } from "@/components/atoms/Button";
import Link from "next/link";

export default function LoginPage() {
  return (
    <div className="bg-surface text-on-surface flex flex-col min-h-screen">
      <header className="bg-surface border-b border-outline-variant flex items-center justify-between px-5 h-16 w-full fixed top-0 z-50">
        <div className="flex items-center gap-2">
          <School className="text-primary" size={24} />
          <h1 className="text-display text-primary tracking-tight">WISS Tocco</h1>
        </div>
        <div className="hidden md:flex gap-6 items-center">
          <nav className="flex gap-4">
            <span className="text-label-sm text-on-surface-variant hover:bg-surface-container-high transition-colors px-3 py-2 rounded-lg cursor-pointer">Support</span>
            <span className="text-label-sm text-on-surface-variant hover:bg-surface-container-high transition-colors px-3 py-2 rounded-lg cursor-pointer">Help</span>
          </nav>
        </div>
      </header>

      <main className="flex-grow flex items-center justify-center pt-16 px-5">
        <div className="w-full max-w-sm flex flex-col gap-8">
          {/* Branding & Visual Anchor */}
          <div className="flex flex-col items-center text-center gap-6">
            <div className="w-24 h-24 rounded-full bg-surface-container-high flex items-center justify-center mb-2 shadow-soft">
              <School className="text-primary" size={48} />
            </div>
            <div className="space-y-2">
              <h2 className="text-h1 text-on-surface">Welcome Back</h2>
              <p className="text-body-md text-on-surface-variant">Sign in to your school account to access your digital campus.</p>
            </div>
          </div>

          {/* Login Card */}
          <div className="bg-surface-container-lowest border border-outline-variant rounded-xl p-6 shadow-soft">
            <div className="flex flex-col gap-6">
              {/* Microsoft Primary Action */}
              <Link href="/dashboard" className="w-full">
                <Button variant="primary" size="lg" fullWidth className="gap-4">
                  <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 23 23">
                    <path d="M1 1h10v10H1z" fill="#f35325"></path>
                    <path d="M12 1h10v10H12z" fill="#81bc06"></path>
                    <path d="M1 12h10v10H1z" fill="#05a6f0"></path>
                    <path d="M12 12h10v10H12z" fill="#ffba08"></path>
                  </svg>
                  Log in with Microsoft
                </Button>
              </Link>

              <div className="relative flex items-center">
                <div className="flex-grow border-t border-outline-variant"></div>
                <span className="flex-shrink mx-4 text-on-surface-variant text-label-sm uppercase tracking-wider">School Authentication</span>
                <div className="flex-grow border-t border-outline-variant"></div>
              </div>

              {/* Information Subtext */}
              <div className="flex gap-4 p-4 bg-surface-container-low rounded-lg border border-outline-variant/30">
                <Info className="text-on-surface-variant shrink-0" size={20} />
                <p className="text-body-md text-on-surface-variant">
                  This login is required for secure access to Files, Timetables, and Grades. Your credentials are managed by your institution.
                </p>
              </div>
            </div>
          </div>

          {/* Footer / Support Links */}
          <div className="flex flex-col gap-4 text-center">
            <p className="text-label-sm text-on-surface-variant">
              Having trouble signing in? <br/>
              <a className="text-primary font-bold hover:underline" href="#">Contact IT Support</a>
            </p>
          </div>
        </div>
      </main>
    </div>
  );
}
