'use client';

import React from 'react';
import { Typography } from '@/components/atoms/Typography';
import { Button } from '@/components/atoms/Button';

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <html>
      <body>
        <div className="min-h-screen bg-surface flex flex-col items-center justify-center p-margin text-center">
          <Typography variant="display" className="text-error mb-4">
            Ups! Etwas ist schief gelaufen.
          </Typography>
          <Typography variant="body-lg" className="text-on-surface-variant mb-8 max-w-md">
            Ein unerwarteter Fehler ist aufgetreten. Wir bitten um Entschuldigung.
          </Typography>
          <Button onClick={() => reset()} variant="primary">
            Erneut versuchen
          </Button>
          {error.digest && (
            <Typography variant="label-sm" className="mt-8 text-on-surface-variant opacity-50">
              Error ID: {error.digest}
            </Typography>
          )}
        </div>
      </body>
    </html>
  );
}
