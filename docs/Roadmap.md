# Projekt-Roadmap: Retrospektive MVP-Entwicklung

Diese rückwirkende Roadmap dokumentiert die Meilensteine und erledigten Pendenzen während der MVP-Entwicklungsphase (Minimum Viable Product). Die Phasen basieren auf der detaillierten Commit-Historie und spiegeln den Aufbau der Architektur, die Feature-Entwicklung sowie den finalen Feinschliff wider.

## Meilenstein 1: Fundament & Architektur-Setup (07.05. – 08.05.)

**Fokus:** Etablierung des Grundgerüsts, UI-Konzeptes und der Backend-Infrastruktur.

- **UI/UX Design & Atomic Design:**
  - Ausarbeitung der initialen Wireframes (Markdown Templates).
  - Definition der Design Tokens und der funktionalen Basis-Struktur.
  - Systematischer Aufbau der UI-Komponenten nach Atomic Design (Atoms, Molecules, Organisms).
- **Projektinfrastruktur:**
  - Initialisierung der Projektpakete für das Frontend (`wiss-estudio-frontend`) und Backend (`wiss-estudio-backend`).
  - Aufsetzen einer optimierten Multi-Stage Docker-Umgebung inklusive Datenbank-Services.
- **Datenbank-Core:**
  - Entwurf des initialen Datenbankschemas und Erstellung der Migrationen (`schema.sql`).
  - Definition der grundlegenden Backend-Modelle.

## Meilenstein 2: API, Security & Basis-Features (08.05. – 10.05.)

**Fokus:** Sichere Kommunikation, Datenmodelle und erste Frontend-Prototypen.

- **Authentifizierung & Security:**
  - Implementierung von JWT und Argon2 für eine sichere Nutzerauthentifizierung.
  - Integration von Refresh-Token-Rotation und Auth-Middlewares.
  - Einrichtung von Auth-Guards zum Schutz der Frontend-Routen.
- **Backend-Entwicklung:**
  - Bereitstellung zentraler REST-Endpunkte für den Stundenplan (Timetable), die Noten und die Absenzen.
  - Zentralisiertes Error-Handling implementiert.
- **Frontend-Prototyping:**
  - Entwicklung der ersten funktionalen Prototypen für Dashboard, Stundenplan, Notenübersicht und Benutzerprofil.
  - Aufbau des strikten Frontend-Typensystems synchron zu den Backend-Modellen.
- **Dokumentation:**
  - Ausarbeitung der technischen Spezifikationen, der Projekt-Roadmap und der API-Dokumentation.

## Meilenstein 3: State Management & UI-Erweiterungen (11.05. – 13.05.)

**Fokus:** Interaktive Benutzererfahrung und robuste Datenanbindung.

- **Datenanbindung & Offline-Support:**
  - Integration von `.sqlx` Offline-Queries für typsichere Datenbankabfragen zur Build-Zeit.
  - Implementierung des globalen Frontend-State-Managements und API-Integration.
- **OAuth-Integration:**
  - Migration des Login-Prozesses auf den offiziellen Microsoft OAuth-Flow.
- **Komplexe UI-Komponenten:**
  - Entwicklung eines interaktiven Kalender-Moleküls zur strukturierten Darstellung von Stundenplan und Absenzen.
  - Implementierung einer gruppierten Akkordeon-Ansicht (Accordion View) für die Notenübersicht.
- **Custom Hooks:**
  - Bereitstellung erweiterter React Hooks wie `useAttendanceDetails` für ein präzises, granulares Tracking auf Client-Seite.

## Meilenstein 4: Datenintegrität & High-Fidelity Seeding (14.05. – 16.05.)

**Fokus:** Realistische Testdaten, Schema-Refactoring und Behebung von Inkonsistenzen.

- **Data Seeding Skripte:**
  - Entwicklung komplexer Seed-Skripte für den automatisierten Import von Stundenplan-Einträgen aus ICS-Exporten.
  - Generierung von authentischen Absenzen- und Noten-Datensätzen mit hohen Volumina.
- **Schema-Refactoring:**
  - Anpassung des Datenbankschemas für ein präzises Session-Tracking auf Fachebene.
  - Sicherstellung einer exakten 1:1-Zuweisung zwischen Stundenplan-Sessions und Absenzen.
- **Fehlerbehebung & Stabilisierung:**
  - Bereinigung von UUID-Diskrepanzen und Anpassung der Datenbank-Constraints für maximale Datenintegrität.
  - Vereinfachung des Docker-Volume-Mappings für die reibungslose Datenbank-Initialisierung.

## Meilenstein 5: Polishing, Filtering & Handoff (17.05. – 21.05.)

**Fokus:** Feinschliff der Applikation, Suchfunktionen und finale Übergabedokumentation.

- **Funktionserweiterung:**
  - Implementierung einer Suchleiste mit Echtzeit-Filterung im Absenzen-Modul.
- **Code-Qualität & Refactoring:**
  - Migration aller API-Endpunkte auf vereinheitlichte Model-Interfaces.
  - Umfassende Kommentierung kritischer exportierter Funktionen (JSDoc für Frontend, RustDoc für Backend).
- **UI-Polishing:**
  - Semantische Farbanpassungen und striktes Mapping für den Anwesenheitsstatus im Kalender.
  - Überarbeitung der Badge-Varianten (Outline, semantische Farbschemata) und Verfeinerung der Typografie.
- **Abschlussdokumentation:**
  - Aktualisierung und Finalisierung der technischen Gesamtdokumentation (`HANDOFF.md`, `DESIGN.md`).
