# Handoff: Authentication & Routing Stability Fix

## Goal

The primary goal was to resolve a **401 Unauthorized** error on the `dummy-oauth` endpoint and establish a robust, scalable routing architecture that separates public and protected API endpoints.

## Current State

- **Fixed**: The `dummy-oauth` endpoint was failing because it was either trapped behind an implicit auth check or because the database transaction for seed data rolled back.
- **Routing**: Refactored `api_versioning.rs` to use a clear `public_routes` vs `protected_routes` split.
- **Middleware**: Implemented a dedicated `auth_middleware` in `backend/src/middleware/auth.rs` that leverages the `Claims` extractor.
- **Database**: Corrected `database/example_data.sql`.
  - Removed duplicate room names (ZH 404, ZH 402) that violated `UNIQUE` constraints.
  - Synchronized `subject_id` UUIDs in the `events` table with the `subjects` table to prevent foreign key violations.
- **Types**: Derived `Clone` for the `Claims` struct in `backend/src/services/auth.rs` to allow it to be inserted into request extensions by the middleware.
- **Backend**: Compiles successfully and passes `cargo check`.

## Files Actively Involved

- `backend/src/routes/api_versioning.rs`: Defines the router hierarchy and middleware application.
- `backend/src/middleware/auth.rs`: Contains the `auth_middleware` logic.
- `backend/src/handlers/auth.rs`: Contains the `dummy_oauth` and `refresh` handlers.
- `database/example_data.sql`: The seed data script.
- `backend/src/services/auth.rs`: Definition of the `Claims` struct.

## Investigation History & Learnings

- **Initial Report**: `POST /api/v1/auth/dummy-oauth` returned a 401 error.
- **Theory 1 (Routing)**: Suspected the route was accidentally protected by an auth layer.
- **Theory 2 (Data Mismatch)**: Audited the seed data and found that the transaction was failing and rolling back, leaving the `users` table empty.
- **Theory 3 (Compilation)**: Encounted a `Clone` trait bound error when trying to use `Claims` in the middleware, resolved via `#[derive(Clone)]`.
- **Action**: Corrected the SQL seed data, refactored the router, and enhanced auth handler logging.

## Next Steps

1. **Live Login Test**: Perform a login attempt in the browser to verify that the `refresh_token` cookie is correctly set and the JWT is returned.
2. **SQLx Preparation**: Once the database is running and accessible, execute `cargo sqlx prepare` in the `backend` directory to refresh the `.sqlx/` metadata.
3. **Frontend Interceptor Check**: Ensure the frontend `fetchClient.ts` is correctly handling the transition from 401 to the `/refresh` endpoint now that routing is strictly separated.
4. **Environment Variables**: Verify that `JWT_SECRET` and `DATABASE_URL` are consistent across the Docker environment and local `.env` files.
