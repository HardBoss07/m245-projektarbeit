# Wiss Tocco Backend: Technical Specification

## 1. Project Overview

A high-performance, asynchronous REST API designed to replicate and optimize the WISS school portal. Built with **Rust (2024 Edition)**, **Axum**, and **SQLx**, prioritizing sub-millisecond internal processing and type-safe database interactions.

## 2. Core Architecture Principles

### 📂 Layered Directory Structure

To maintain 3rd Normal Form (3NF) logic and keep the codebase clean, the project follows this modular structure:

- `src/models/`: Rust structs & Enums (as generated for SQLx).
- `src/routes/`: Submodules for each domain (e.g., `user.rs`, `grades.rs`, `timetable.rs`).
- `src/handlers/`: Business logic and database interaction code.
- `src/middleware/`: Custom Tower layers (auth, logging, rate limiting).
- `src/services/`: Reusable logic (e.g., grade calculation, PDF processing).
- `src/errors.rs`: Centralized error handling using `thiserror`.

### ⚡ Performance Optimization

- **SQLx Query Binding:** Direct usage of `sqlx::query!()` macros for compile-time SQL verification and protection against SQL injection.
- **Request Caching:** Implementation of an in-memory cache (using `dashmap` or `moka`) for static data like `rooms`, `subjects`, and `roles`.
- **Compression:** Using `tower-http`'s `CompressionLayer` with Gzip/Zstd to reduce payload size for large timetable JSONs.
- **Paging:** Mandatory `limit` and `offset` parameters for all list endpoints (Grades, Documents) to prevent memory spikes.

## 3. Implementation Roadmap

### 🛣️ Routing & Scoping

Routes are nested to ensure the `main.rs` remains readable. Example:

```rust
let app = Router::new()
    .nest("/api/v1/users", routes::user::router())
    .nest("/api/v1/grades", routes::grades::router())
    .layer(TraceLayer::new_for_http()) // Professional tracing
    .layer(TimeoutLayer::new(Duration::from_secs(30)));
```

### 🔐 Security & Middleware

- **Auth:** Argon2 for password hashing; JWT (JSON Web Tokens) for session management.
- **Refresh Token Pattern**: To balance security and UX, we implement a dual-token system:
  - **Access Token**: Short-lived (5-15 min), sent in `Authorization` header, stored in-memory.
  - **Refresh Token**: Long-lived (7-30 days), stored in `HttpOnly`, `Secure`, `SameSite=Strict` cookies.
- **Token Rotation**: Every refresh request invalidates the old refresh token and issues a new pair. Reuse detection triggers immediate session revocation.
- **CORS:** Strict `CorsLayer` configuration to allow only the specific frontend origin.
- **Tracing:** Structured logging using `tracing-subscriber` with `JSON` output for production observability.

### 📊 Real-Time Updates (SSE)

To notify students of newly published grades without page refreshes, the backend implements **Server-Sent Events (SSE)**.

- Endpoint: `GET /api/v1/notifications/stream`
- Technology: `tokio::sync::broadcast` channels to push updates from database triggers to connected clients.

## 4. Error Handling Strategy

We use a unified `AppError` enum to ensure consistent API responses:

```rust
#[derive(thiserror::Error, Debug)]
pub enum AppError {
    #[error("Database error")]
    Sqlx(#[from] sqlx::Error),
    #[error("Unauthorized access")]
    Unauthorized,
    #[error("Conflict: {0}")]
    Conflict(String),
}
// Implements IntoResponse to map errors to HTTP status codes
```

## 6. Detailed Implementation Roadmap

### Phase 1: Authentication & Security (Priority: High)

- [x] **JWT Foundation**: Implement `AuthService` with `jsonwebtoken` for token signing and validation.
- [x] **Refresh Token Logic & Rotation**:
- [x] **Storage**: Create a `refresh_tokens` table in PostgreSQL.
- [x] **Rotation with Grace Periods**: Implement `POST /api/v1/auth/refresh` with rotation and 30s grace period.
- [x] **Reuse Detection**: Family-based revocation on reuse of rotated tokens.
- [x] **Secure Cookie handling**: `HttpOnly`, `Secure`, and `SameSite=Strict` refresh token cookies.

- [x] **Password Hashing**: Integrate `argon2` for secure user registration and login.
- [x] **Auth Middleware**: Create a Tower layer (extractor) to protect private routes and extract `Claims` into request extensions.
- [x] **CORS & Rate Limiting**: Fine-tune `tower-http` layers for production security.

### Phase 2: User & Profile Management

- [ ] **User Retrieval**: `GET /api/v1/users/me` for profile details.
- [ ] **Role-Based Access (RBAC)**: Implement logic to distinguish between students ('Lernende') and teachers ('Dozenten').
- [ ] **Profile Updates**: `PATCH /api/v1/users/me` for language and notification preferences.

### Phase 3: Academic Data (Core Logic)

- [ ] **Timetable Engine**:
  - [ ] `GET /api/v1/timetable` with date-range filtering.
  - [ ] Implementation of room and lecturer conflict detection logic.
- [ ] **Grading System**:
  - [ ] `GET /api/v1/grades` with calculated semester averages (using `rust_decimal`).
  - [ ] `POST /api/v1/grades` (Teacher only) for publishing new exam results.
- [ ] **Subject & Class Lookups**: Optimized caching for static curriculum data.

### Phase 4: Document & File Handling

- [ ] **Multipart Upload**: `POST /api/v1/documents` for personal school files.
- [ ] **Secure Serving**: Implement streaming responses for document downloads with permission checks.

### Phase 5: Real-Time & Performance

- [ ] **SSE Notifications**: `GET /api/v1/notifications/stream` for live grade/schedule updates.
- [ ] **In-Memory Caching**: Integrate `moka` or `dashmap` for high-frequency database queries.
- [ ] **Zstd Compression**: Enable advanced compression for large JSON payloads.

### Phase 6: Validation & Observability

- [ ] **Integration Testing**: Implement a test suite using `axum::test_helpers` and a test database.
- [ ] **OpenTelemetry**: Enhance tracing with distributed spans for database query performance monitoring.
- [ ] **Automated Migrations**: Ensure `sqlx-cli` migrations run automatically on container startup.
