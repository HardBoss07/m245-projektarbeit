"use client";

import React from "react";
import { MobileShell } from "@/components/organisms/MobileShell";
import { SearchBar } from "@/components/molecules/SearchBar";
import { ListEntry } from "@/components/molecules/ListEntry";
import { Folder, FileText, FileImage, FileCode, UploadCloud, Download, Eye, Loader2 } from "lucide-react";
import { useAuth } from "@/hooks/useAuth";

export default function FilesPage() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return (
      <div className="flex h-screen items-center justify-center bg-surface">
        <Loader2 className="animate-spin text-primary" size={48} />
      </div>
    );
  }

  if (!isAuthenticated) return null;

  const items = [
...
      type: "folder",
      title: "Semester Project 2024",
      subtitle: "Yesterday • 12 files",
      icon: <Folder className="text-on-primary-container" fill="currentColor" size={24} />,
      iconBg: "bg-primary-container",
    },
    {
      type: "folder",
      title: "Course Documents",
      subtitle: "Oct 12 • 8 files",
      icon: <Folder className="text-on-primary-container" fill="currentColor" size={24} />,
      iconBg: "bg-primary-container",
    },
    {
      type: "file-pdf",
      title: "Exam_Rules.pdf",
      subtitle: "2.4 MB • 2 days ago",
      icon: <FileText className="text-error" size={24} />,
      iconBg: "bg-surface-container",
      right: <Download className="text-outline group-hover:text-primary" size={20} />,
    },
    {
      type: "file-img",
      title: "Campus_Map_HighRes.jpg",
      subtitle: "5.1 MB • 1 week ago",
      icon: <FileImage className="text-secondary" size={24} />,
      iconBg: "bg-surface-container",
      right: <Eye className="text-outline group-hover:text-primary" size={20} />,
    },
    {
      type: "file-word",
      title: "Thesis_Draft_v2.docx",
      subtitle: "840 KB • Today",
      icon: <FileCode className="text-on-primary-container" size={24} />,
      iconBg: "bg-surface-container",
    },
  ];

  return (
    <MobileShell>
      <div className="space-y-6">
        <header className="flex justify-between items-center">
          <h2 className="text-h1 uppercase">Dateien</h2>
          <span className="text-label-sm text-on-surface-variant">32 Files • 4 Folders</span>
        </header>

        <SearchBar placeholder="Search files and folders..." />

        <div className="space-y-3">
          {items.map((item, i) => (
            <ListEntry
              key={i}
              title={item.title}
              subtitle={item.subtitle}
              icon={item.icon}
              iconBgColor={item.iconBg}
              rightElement={item.right}
            />
          ))}
        </div>

        <button className="w-full mt-6 border-2 border-dashed border-outline-variant rounded-xl p-8 flex flex-col items-center justify-center hover:bg-surface-container-low transition-colors active:scale-[0.98] duration-200">
          <UploadCloud className="text-primary mb-2" size={32} />
          <p className="text-h2 text-on-surface">Upload a file</p>
          <p className="text-body-md text-on-surface-variant">Max size: 50MB</p>
        </button>
      </div>
    </MobileShell>
  );
}
