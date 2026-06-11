import type { Metadata } from "next";
import lexend from "@/styles/fonts";
import "./globals.css";
import { AppLayout } from "@/components/organisms/AppLayout";

export const metadata: Metadata = {
  title: "Wiss Tocco Redesign",
  description: "Academic Excellence and Digital Fluidity",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="de" className={`${lexend.variable}`}>
      <head>
        <link 
          rel="stylesheet" 
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" 
        />
      </head>
      <body>
        <AppLayout>{children}</AppLayout>
      </body>
    </html>
  );
}
