# Frontend Technical Documentation

## Overview

The frontend is built with **Next.js 16.2.5** (App Router) and **TypeScript**. It follows an Atomic Design methodology, focusing on performance and mobile-first responsiveness.

## Design System

The UI adheres to a Slate & Indigo minimalist theme, utilizing a strict grid and typographic scale to ensure professional consistency.

## Component Architecture

- **Atoms**: Fundamental UI elements (`Button`, `Input`, `Typography`, `Badge`).
- **Molecules**: Compound elements combining atoms (`BentoCard`, `SearchBar`, `BottomNav`).
- **Organisms**: High-level structural components (`MobileShell`, `Header`).

## State Management

- Authentication state is managed via `useAuth` hook, leveraging `localStorage` for JWT tokens.
- API interactions are centralized in the `services/` directory, using a custom `fetchClient`.
