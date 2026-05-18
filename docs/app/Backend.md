# Backend Technical Documentation

## Overview

The backend is a high-performance, asynchronous REST API built with **Rust (Axum)**, **Tokio**, and **SQLx**. It is structured into modular domains to ensure type-safety and maintainability.

## API Endpoints

| Method | Endpoint             | Request Payload      | Response              | Description             |
| :----- | :------------------- | :------------------- | :-------------------- | :---------------------- |
| GET    | `/api/v1/health`     | N/A                  | `{"status": "ok"}`    | Service health check    |
| GET    | `/api/v1/grades`     | N/A                  | `List<GradeResponse>` | Retrieve student grades |
| POST   | `/api/v1/grades/:id` | `UpdateGradeRequest` | 200 OK                | Update exam grade       |

## Design Rationale

- **Axum**: Chosen for its type-safe request handling and middleware ecosystem.
- **SQLx**: Utilized for compile-time verified SQL queries, providing essential protection against injection while ensuring performance.
- **Argon2**: Password hashing standard for secure user management.
- **JWT**: Dual-token pattern with short-lived access and long-lived refresh tokens for secure, seamless user sessions.
