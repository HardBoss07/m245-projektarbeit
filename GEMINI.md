# Wiss Tocco Redesign

## 1. Project Overview

The **Wiss Tocco Redesign** is a comprehensive modernization of the `wiss.tocco.ch` school portal. The current system suffers from poor mobile usability and frequent session expirations. This project focuses on a "Mobile-First" makeover, emphasizing performance, modern UI/UX, and improved session handling via JWT.

### Core Objectives

- **Mobile-First Design**: Primary focus on touch-friendly interfaces and responsive layouts.
- **Modernization**: Transition from a legacy feel to a clean, professional aesthetic.
- **Performance**: Optimized caching and indexing for rapid data retrieval.
- **Seamless Sessions**: Implementation of JWT-based session handling to prevent frequent timeouts.

## 2. Technical Stack

| Component     | Technology                       | Version        |
| :------------ | :------------------------------- | :------------- |
| **Frontend**  | Next.js (App Router), TypeScript | 16.2.5         |
| **Styling**   | Tailwind CSS, Lucide React       | Latest         |
| **Backend**   | Rust (Axum, Tokio, Tower)        | Axum 0.8.8     |
| **Container** | Docker                           | rust-slim:1.92 |
| **Database**  | PostgreSQL                       | Latest         |

## 3. Design System & Principles

### Palette: Slate & Indigo (High-End Redesign)

The UI follows a modern Shadcn-inspired minimalist theme.

- **Grayscale**: White (#FFFFFF), Slate-50 (#F8FAFC), Slate-200 (#E2E8F0), Slate-900 (#020617).
- **Primary Accent**: Indigo-600 (#4f46e5).

### Key Components

- **SmartImage**: Production-grade wrapper for `next/image` with fallback states.
- **BentoCard**: Container for structured, high-hierarchy grid layouts.
- **Atoms**: Refined Button and Input components with subtle borders and shadows.

### Atomic Design Methodology

1.  **Atoms**: Buttons, Inputs, Typography, Icons (Lucide).
2.  **Molecules**: Search bars, Form fields, Navigation items.
3.  **Organisms**: Headers, Sidebars, Activity Feeds, Grade Cards.
4.  **Templates/Pages**: Dashboard, Schedule, Profile.

## 4. AI Implementation Roadmap

### Phase 1: Frontend Foundation (Current Focus)

_Goal: Establish the local environment and design tokens._

- [x] **1.1 Docker Environment**:
  - [x] Create `docker-compose.yml` for local development.
  - [x] Create `Dockerfile.frontend` using a Node-based image.
  - [x] Configure `.env` file with placeholders for future JWT secrets.
- [x] **1.2 Next.js Project Setup**:
  - [x] Initialize Next.js 16.2.5 with App Router and TypeScript.
  - [x] Configure `tailwind.config.ts` (via globals.css for TW4) with the Bordeaux color steps.
- [x] **1.3 Directory Scaffolding**:
  - [x] Setup `@/components/atoms`, `@/components/molecules`, and `@/components/organisms`.
  - [x] Setup `@/styles` for global CSS and @layer components.

### Phase 2: Atomic UI Construction (Mobile-First)

_Goal: Build the visual building blocks based on @docs/wireframes._

- [x] **2.1 Atoms**:
  - [x] Design high-contrast buttons (Bordeaux/White).
  - [x] Design accessible input fields with focus states.
- [x] **2.2 Molecules**:
  - [x] Build a responsive navigation bar optimized for mobile thumbs.
  - [x] Build simple "Stat Cards" for grades and attendance.
- [x] **2.3 Organisms**:
  - [x] Implement the Global Layout (Sidebar/Mobile Bottom Nav).
  - [x] Create a "Mobile Dashboard Shell" as the main entry point.

### Phase 3: Page Prototyping (Mock Data)

_Goal: Assemble components into functional pages without a live backend._

- [x] **3.1 Login Page**:
  - [x] Clean, centered grayscale design with Bordeaux login button.
- [x] **3.2 Main Dashboard**:
  - [x] Grid layout for schedules, news, and recent grades.
- [x] **3.3 Mock Data Integration**:
  - [x] Create TypeScript interfaces for User, Grade, and Schedule.
  - [x] Use local JSON or constants to populate the UI.

### Phase 4: Backend Infrastructure (Dummy Mode)

_Goal: Prepare the Rust environment._

- [x] **4.1 Rust Setup**:
  - [x] Create `Dockerfile.backend` using `rust-slim:1.92`.
  - [x] Scaffold Axum 0.8.8 project with Tokio/Tower.
- [x] **4.2 API Skeleton**:
  - [x] Define basic health check routes and `/api/v1/auth` stubs.

### Phase 5: State & Session Management

_Goal: Integrate JWT logic._

- [x] **5.1 JWT Handler**:
  - [x] Implement client-side session context in Next.js.
  - [x] Configure interceptors to handle token expiration/refresh.


## 5. Development Guidelines

- **Localhost Only**: All services must communicate via internal Docker network or `localhost`.
- **Secrets**: No hardcoded keys. Use `.env`.
- **Responsiveness**: Every component must be tested on a simulated mobile view (375px to 425px width) before desktop testing.
