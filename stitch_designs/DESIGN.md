---
name: Academic Clarity
colors:
  surface: '#ffffff'
  surface-dim: '#f6f3f5'
  surface-bright: '#ffffff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f5'
  surface-container: '#f0edef'
  surface-container-high: '#eae7e9'
  surface-container-highest: '#e4e2e4'
  on-surface: '#020617'
  on-surface-variant: '#45464d'
  inverse-surface: '#020617'
  inverse-on-surface: '#ffffff'
  outline: '#76777d'
  outline-variant: '#e2e8f0'
  surface-tint: '#4f46e5'
  primary: '#4f46e5'
  on-primary: '#ffffff'
  primary-container: '#4f46e5'
  on-primary-container: '#ffffff'
  inverse-primary: '#bec6e0'
  secondary: '#5d5f5f'
  on-secondary: '#ffffff'
  secondary-container: '#dfe0e0'
  on-secondary-container: '#616363'
  tertiary: '#000000'
  on-tertiary: '#ffffff'
  tertiary-container: '#271901'
  on-tertiary-container: '#98805d'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  background: '#ffffff'
  on-background: '#020617'
  accent: '#4f46e5'
typography:
  display:
    fontFamily: Lexend
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
    letterSpacing: -0.02em
  h1:
    fontFamily: Lexend
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
    letterSpacing: -0.01em
  h2:
    fontFamily: Lexend
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
    letterSpacing: 0em
  body-lg:
    fontFamily: Lexend
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0em
  body-md:
    fontFamily: Lexend
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  label-sm:
    fontFamily: Lexend
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  unit: 4px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  margin: 20px
  gutter: 12px
---

## Brand & Style

The personality of this design system is rooted in **Academic Clarity and Modern Fluidity**. It is designed to feel authoritative yet accessible, providing a streamlined experience for students and faculty.

The aesthetic prioritizes functional clarity. It utilizes a minimalist palette, generous white space, and a rigid, reliable grid. By blending formal institutional needs with modern interface patterns, the system creates a seamless bridge between academic formality and daily digital utility.

## Colors

The palette is anchored by a high-contrast **Slate (#020617)** for typography and key UI borders, ensuring maximum legibility. The background is **Pure White (#FFFFFF)** to maintain a clean "open book" feel that reduces cognitive load.

The primary accent is **Indigo-600 (#4f46e5)**. This color defines the interactive layer—buttons, active links, and focus indicators. Success states and completion indicators utilize soft greens consistent with the primary design language, reinforcing positive feedback loops without clashing with the primary palette.

## Typography

This design system utilizes **Lexend**. Chosen for its design intent to reduce visual stress and improve reading speed, Lexend is the sole typeface, ensuring cohesive branding.

Headlines use semi-bold and bold weights to establish hierarchy, while body text uses a normal weight with calibrated line heights for comfortable, extended reading. Labels utilize an uppercase, medium-weight style to add clear structural distinctions at small scales.

## Layout & Spacing

The layout is optimized for mobile-first usage. It utilizes a fluid grid with a standard 20px outer margin, ensuring touch-friendly interaction zones.

The spacing rhythm is based on a **4px baseline unit**. All padding and margins are increments of this unit (8px, 16px, 24px, 32px), creating a consistent vertical and horizontal cadence across all components.

## Elevation & Depth

Depth is conveyed through **Subtle Tonal Boundaries** rather than heavy shadows.

- **Level 0 (Base):** White background (#FFFFFF).
- **Level 1 (Cards):** Subsurface containers with a 1px border (#E2E8F0) and extremely light, diffused shadows (0px 2px 8px rgba(15, 23, 42, 0.05)) only when elevation is explicitly required.
- **Level 2 (Active):** Interactive elements such as primary buttons use scale transforms (`active:scale-[0.98]`) to provide immediate physical feedback.

## Shapes

The shape language uses **Standard Rounded (Level 2)** containers. This curvature balances the formal nature of the academic context with a modern, approachable feel.

- **Standard Elements (Buttons, Inputs):** 8px (0.5rem) radius.
- **Large Containers (Cards, Modals):** 12px (0.75rem) or 16px (1rem) radius.
- **Small Elements (Badges, Pills):** Pill-shape (9999px) for distinct status indicators.

## Components

### Buttons
Primary actions are solid **Indigo-600** fills. Secondary actions (Ghost) use transparent backgrounds with colored text and borders to maintain a lightweight presence. Minimum touch target height is 48px.

### Cards
Cards are the foundational content containers. They feature a defined corner radius (12px), a 1px `outline-variant` border, and consistent internal padding (16px).

### Input Fields
Inputs use a `surface-container-low` background, an 8px corner radius, and a 1px `outline-variant` border. On focus, the border transitions to a 2px Indigo-600 stroke with a subtle ring effect.

### Badges
Pill-shaped status markers using specific color variants (e.g., success, error, neutral) on a light, tinted background, following the design system's atomic structure.

### Navigation
The navigation utilizes bottom-bar patterns for mobile, emphasizing high-accessibility touch targets with clear, legible labeling.