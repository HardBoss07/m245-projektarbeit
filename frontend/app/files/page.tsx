'use client';

import { MobileShell } from '@/components/organisms/MobileShell';
import { SearchBar } from '@/components/molecules/SearchBar';
import { Card } from '@/components/atoms/Card';
import { Typography } from '@/components/atoms/Typography';
import { ListEntry } from '@/components/molecules/ListEntry';
import { Badge } from '@/components/atoms/Badge';

export default function FilesPage() {
  const folders = [
    { name: 'Semester 1', items: 24 },
    { name: 'Semester 2', items: 18 },
    { name: 'Semester 3', items: 32 },
  ];

  const recentFiles = [
    { name: 'Prüfungsreglement.pdf', size: '1.2 MB', date: 'Vorgestern', type: 'PDF' },
    { name: 'M245_Uebung_01.docx', size: '450 KB', date: '04.05.2026', type: 'DOCX' },
    { name: 'Notenblatt_S3.pdf', size: '800 KB', date: '28.04.2026', type: 'PDF' },
  ];

  return (
    <MobileShell title="Meine Dateien">
      <div className="p-margin flex flex-col gap-lg">
        <SearchBar placeholder="Dateien oder Ordner suchen..." />

        {/* Folders */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">ORDNER</Typography>
          <div className="grid grid-cols-2 gap-md">
            {folders.map((folder, i) => (
              <Card key={i} className="flex flex-col gap-xs active:bg-surface-container transition-colors">
                <div className="w-10 h-10 rounded-lg bg-primary-container/10 text-primary-container flex items-center justify-center">
                  <span className="material-symbols-outlined">folder</span>
                </div>
                <Typography variant="body-md" className="font-bold">{folder.name}</Typography>
                <Typography variant="label-sm" className="text-on-surface-variant">{folder.items} Dateien</Typography>
              </Card>
            ))}
          </div>
        </section>

        {/* Recent Files */}
        <section className="flex flex-col gap-sm">
          <Typography variant="label-sm" className="text-on-surface-variant font-bold ml-1">KÜRZLICH VERWENDET</Typography>
          <Card className="!p-0 overflow-hidden">
            {recentFiles.map((file, i) => (
              <ListEntry
                key={i}
                title={file.name}
                subtitle={`${file.size} • ${file.date}`}
                icon={file.type === 'PDF' ? 'picture_as_pdf' : 'description'}
                onClick={() => {}}
              />
            ))}
          </Card>
        </section>

        {/* Quick Upload Action */}
        <Card variant="glass" className="flex items-center justify-between py-md border-dashed border-2 border-accent/30 bg-accent/5">
          <div className="flex items-center gap-md">
            <div className="w-10 h-10 rounded-full bg-accent text-white flex items-center justify-center shadow-md">
              <span className="material-symbols-outlined">upload</span>
            </div>
            <div>
              <Typography variant="body-md" className="font-bold">Datei hochladen</Typography>
              <Typography variant="label-sm" className="text-on-surface-variant">PDF, DOCX bis 20MB</Typography>
            </div>
          </div>
        </Card>
      </div>
    </MobileShell>
  );
}
