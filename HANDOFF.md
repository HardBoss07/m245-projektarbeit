# Handoff: Absences (Absenzen) 500 Error Fix

## Goal
The primary goal is to stabilize the **Absences (Absenzen)** module of the Wiss Tocco Redesign. Specifically, ensuring that both the overview and detail endpoints (`/api/v1/absenzen` and `/api/v1/absenzen/{id}`) return correct data to the frontend without Internal Server Errors.

## Current State
- **Fixed**: A 500 Internal Server Error was occurring due to a mismatch between Rust enums and PostgreSQL enum types.
  - The database uses **PascalCase** strings (e.g., `"Teilgenommen"`).
  - The Rust models were using `#[sqlx(rename_all = "snake_case")]`, causing them to search for `"teilgenommen"`.
- **Backend**: Compiles and passes `cargo check` in offline mode.
- **Frontend**: The `AbsenceDetailPage` is configured to fetch both summary and detail data.
- **Git**: Two incremental commits have been made:
  1. `fix: correct enum mapping to match database PascalCase values`
  2. `chore: remove unused SocketAddr import`

## Files Actively Involved
- `backend/src/models/absenzen.rs`: Contains the `AttendanceStatus` enum.
- `backend/src/models/mod.rs`: Contains the `ClassType` enum.
- `backend/src/handlers/absenzen.rs`: Handles the database queries for absences.
- `frontend/app/absences/[id]/page.tsx`: The UI component displaying the details.

## Investigation History & Learnings
- **Initial Report**: `GET /api/v1/absenzen/{id}` returned a 500 error.
- **Theory 1 (Internal Error Handling)**: Checked `errors.rs` to see how SQLx errors are mapped. Confirmed SQLx errors return 500.
- **Theory 2 (Schema Mismatch)**: Examined `schema.sql` and `absenzen.rs`. Noticed the database uses PascalCase for enums while Rust was forced to `snake_case`.
- **Action**: Removed `rename_all = "snake_case"` from `AttendanceStatus` and `ClassType`.
- **Validation**: Attempted a live integration test, but local environment constraints (missing live DB connection in the CLI environment) required switching to `SQLX_OFFLINE=true` for compilation verification.

## Next Steps
1. **Live Validation**: Verify the fix in the browser or via `curl` against the actual running Docker container to ensure the PascalCase mapping correctly handles the DB records.
2. **Types Consistency**: Check if `DocumentType` in `backend/src/models/mod.rs` also needs adjustment (it is currently mapped to `varchar` but uses uppercase in the database).
3. **Frontend Refresh**: If the UI still shows "Lade...", investigate the `useAttendanceDetails` hook in `frontend/hooks/useAttendance.ts` to ensure the response parsing matches the new backend JSON structure.
4. **Offline Data**: Re-generate SQLx data using `cargo sqlx prepare` once the database is reachable to update the `.sqlx/` metadata files.
