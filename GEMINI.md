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

### Palette: Grayscale & Bordeaux

The UI follows a minimalist grayscale theme with a single accent color.

- **Grayscale**: White (#FFFFFF), Light Gray (#F9FAFB), Mid Gray (#9CA3AF), Deep Black (#000000).
- **Bordeaux Accent**:
  - `bordeaux-light`: #a62639
  - `bordeaux-base`: #800020 (Primary Accent)
  - `bordeaux-dark`: #4a0404

### Atomic Design Methodology

1.  **Atoms**: Buttons, Inputs, Typography, Icons (Lucide).
2.  **Molecules**: Search bars, Form fields, Navigation items.
3.  **Organisms**: Headers, Sidebars, Activity Feeds, Grade Cards.
4.  **Templates/Pages**: Dashboard, Schedule, Profile.

## 4. AI Implementation Roadmap

### Phase 1: Frontend Foundation (Current Focus)

_Goal: Establish the local environment and design tokens._

- [ ] **1.1 Docker Environment**:
  - [ ] Create `docker-compose.yml` for local development.
  - [ ] Create `Dockerfile.frontend` using a Node-based image.
  - [ ] Configure `.env` file with placeholders for future JWT secrets.
- [ ] **1.2 Next.js Project Setup**:
  - [ ] Initialize Next.js 16.2.5 with App Router and TypeScript.
  - [ ] Configure `tailwind.config.ts` with the Bordeaux color steps.
- [ ] **1.3 Directory Scaffolding**:
  - [ ] Setup `@/components/atoms`, `@/components/molecules`, and `@/components/organisms`.
  - [ ] Setup `@/styles` for global CSS and @layer components.

### Phase 2: Atomic UI Construction (Mobile-First)

_Goal: Build the visual building blocks based on @docs/wireframes._

- [ ] **2.1 Atoms**:
  - [ ] Design high-contrast buttons (Bordeaux/White).
  - [ ] Design accessible input fields with focus states.
- [ ] **2.2 Molecules**:
  - [ ] Build a responsive navigation bar optimized for mobile thumbs.
  - [ ] Build simple "Stat Cards" for grades and attendance.
- [ ] **2.3 Organisms**:
  - [ ] Implement the Global Layout (Sidebar/Mobile Bottom Nav).
  - [ ] Create a "Mobile Dashboard Shell" as the main entry point.

### Phase 3: Page Prototyping (Mock Data)

_Goal: Assemble components into functional pages without a live backend._

- [ ] **3.1 Login Page**:
  - [ ] Clean, centered grayscale design with Bordeaux login button.
- [ ] **3.2 Main Dashboard**:
  - [ ] Grid layout for schedules, news, and recent grades.
- [ ] **3.3 Mock Data Integration**:
  - [ ] Create TypeScript interfaces for User, Grade, and Schedule.
  - [ ] Use local JSON or constants to populate the UI.

### Phase 4: Backend Infrastructure (Dummy Mode)

_Goal: Prepare the Rust environment._

- [ ] **4.1 Rust Setup**:
  - [ ] Create `Dockerfile.backend` using `rust-slim:1.92`.
  - [ ] Scaffold Axum 0.8.8 project with Tokio/Tower.
- [ ] **4.2 API Skeleton**:
  - [ ] Define basic health check routes and `/api/auth` stubs.

### Phase 5: State & Session Management

_Goal: Integrate JWT logic._

- [ ] **5.1 JWT Handler**:
  - [ ] Implement client-side session context in Next.js.
  - [ ] Configure interceptors to handle token expiration/refresh.

## 5. Development Guidelines

- **Localhost Only**: All services must communicate via internal Docker network or `localhost`.
- **Secrets**: No hardcoded keys. Use `.env`.
- **Responsiveness**: Every component must be tested on a simulated mobile view (375px to 425px width) before desktop testing.
