---
name: Academic Clarity
colors:
  surface: '#fcf8fa'
  surface-dim: '#dcd9db'
  surface-bright: '#fcf8fa'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f5'
  surface-container: '#f0edef'
  surface-container-high: '#eae7e9'
  surface-container-highest: '#e4e2e4'
  on-surface: '#1b1b1d'
  on-surface-variant: '#45464d'
  inverse-surface: '#303032'
  inverse-on-surface: '#f3f0f2'
  outline: '#76777d'
  outline-variant: '#c6c6cd'
  surface-tint: '#565e74'
  primary: '#000000'
  on-primary: '#ffffff'
  primary-container: '#131b2e'
  on-primary-container: '#7c839b'
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
  primary-fixed: '#dae2fd'
  primary-fixed-dim: '#bec6e0'
  on-primary-fixed: '#131b2e'
  on-primary-fixed-variant: '#3f465c'
  secondary-fixed: '#e2e2e2'
  secondary-fixed-dim: '#c6c6c7'
  on-secondary-fixed: '#1a1c1c'
  on-secondary-fixed-variant: '#454747'
  tertiary-fixed: '#fcdeb5'
  tertiary-fixed-dim: '#dec29a'
  on-tertiary-fixed: '#271901'
  on-tertiary-fixed-variant: '#574425'
  background: '#fcf8fa'
  on-background: '#1b1b1d'
  surface-variant: '#e4e2e4'
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

The personality of this design system is rooted in **Academic Excellence and Digital Fluidity**. It is designed to feel authoritative and institutional yet remains highly accessible and friction-free for a student-led demographic. 

The aesthetic follows a **Corporate / Modern** movement, prioritizing functional clarity and structural integrity. It utilizes generous white space and a rigid grid to evoke a sense of organization and calm. By blending traditional educational color palettes with modern interface patterns, the system creates a bridge between formal institutionality and contemporary mobile-first lifestyles.

## Colors

The palette is anchored by **Deep Navy (#0F172A)**, providing a sophisticated and stable foundation for headers and key branding elements. This is balanced by a **Pure White (#FFFFFF)** background to maintain a "clean-sheet" feel that reduces cognitive load during study or navigation.

The action layer uses **Vibrant Cyan (#00BAFF)** as the primary accent. This color is reserved strictly for interactive elements—buttons, active states, and progress indicators—to create a clear mental model for the user. A functional **Emerald Green (#10B981)** is utilized for success states and completion markers, reinforcing a positive feedback loop for student achievements.

## Typography

This design system utilizes **Lexend** as the sole typeface. Chosen for its specific design intent to reduce visual stress and improve reading speed, Lexend aligns perfectly with an educational context.

Headlines use semi-bold and bold weights with tighter tracking to create a strong visual hierarchy. Body text is set with generous line height to ensure legibility during long reading sessions. Labels and micro-copy utilize a medium weight and increased letter spacing to remain legible at small scales on mobile displays.

## Layout & Spacing

The layout utilizes a **4-column fluid grid** tailored for mobile screens. A standard 20px outer margin ensures content does not feel cramped against the device edges, while a 12px gutter provides breathing room between columns.

The spacing rhythm is based on a **4px baseline unit**. All padding and margins between elements should be increments of this unit (8px, 16px, 24px). Horizontal spacing between related items (like icons and labels) should typically be 8px (sm), while vertical spacing between distinct sections should be 24px (lg) or 32px (xl) to maintain clear content grouping.

## Elevation & Depth

Depth is conveyed through **Tonal Layering and Ambient Shadows**. The system avoids heavy drop shadows in favor of subtle, diffused "soft-glow" shadows to indicate interactivity and hierarchy.

- **Level 0 (Base):** White background (#FFFFFF).
- **Level 1 (Cards):** Subsurface gray or white with a 1px border (#E2E8F0) or a very soft shadow (0px 2px 8px rgba(15, 23, 42, 0.05)).
- **Level 2 (Active/Floating):** Raised elements like primary buttons or active cards use a more pronounced shadow (0px 4px 12px rgba(15, 23, 42, 0.1)) to suggest they are "above" the content.

This approach ensures the UI feels light and airy rather than cluttered with heavy skeuomorphic effects.

## Shapes

The shape language is defined by **Rounded (Level 2)** containers. This curvature softens the professional "Deep Navy" palette, making the app feel more approachable and modern for a younger student audience.

- **Standard Elements (Buttons, Inputs):** 8px (0.5rem) radius.
- **Large Containers (Cards, Modals):** 16px (1rem) radius.
- **Small Elements (Chips, Tags):** Full pill-shape (typically 24px+) for high distinction.

All icons should follow a consistent "Rounded" style, avoiding sharp corners in the glyphs to match the container logic.

## Components

### Buttons
Primary actions use a solid **Vibrant Cyan** fill with white text. Secondary actions use the **Deep Navy** in an outlined style (Ghost Button). All buttons have a minimum height of 48px to ensure easy "tocco" (touch) targets.

### Cards
Cards are the primary content vessel. They feature a 16px corner radius, a subtle 1px border (#E2E8F0), and an optional soft shadow if the content is high-priority. Padding inside cards is strictly 16px (md) or 20px.

### Input Fields
Fields use a light gray background (#F8FAFC) with an 8px radius. On focus, the border transitions to a 2px Vibrant Cyan stroke. Placeholder text is set in `body-md` using the neutral base color.

### Chips
Used for filters or categories, chips are pill-shaped. Active chips use a light tint of the accent color (Cyan at 10% opacity) with a solid Cyan text color to indicate selection without over-powering the primary buttons.

### Navigation
The bottom navigation bar uses a blur effect (Backdrop Filter) with a subtle top border. Icons are 24x24px, with active states highlighted in the primary accent color.