# Wiss Estudio API Documentation

This document describes the REST API for the Wiss Estudio Redesign project.

**Base URL:** `/api/v1`

**Authentication:**
Most endpoints require a JWT Bearer token in the `Authorization` header:
`Authorization: Bearer <your_token>`

The API also uses a secure, HTTP-only `refresh_token` cookie for session renewal.

---

## 1. Health & System

### `GET /health`

Returns the status of the API.

- **Auth:** Public
- **Response:** `200 OK`
  ```json
  { "status": "ok" }
  ```

---

## 2. Authentication

### `POST /auth/register`

Creates a new student account.

- **Auth:** Public
- **Body:**
  ```json
  {
    "email": "student@example.com",
    "password": "securepassword",
    "first_name": "John",
    "last_name": "Doe"
  }
  ```
- **Response:** `201 Created`

### `POST /auth/dummy-oauth`

Performs a dummy OAuth login for local development and returns an access token. Sets a `refresh_token` cookie.

- **Auth:** Public
- **Response:** `200 OK`
  ```json
  { "token": "jwt_access_token_here" }
  ```

### `POST /auth/refresh`

Refreshes the access token using the `refresh_token` cookie.

- **Auth:** Public (requires `refresh_token` cookie)
- **Response:** `200 OK`
  ```json
  { "token": "new_jwt_access_token_here" }
  ```

---

## 3. User Profile

### `GET /users/me`

Retrieves the profile of the currently logged-in user.

- **Auth:** Required
- **Response:** `200 OK`
  ```json
  {
    "id": "uuid",
    "email": "student@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "roleName": "Lernende",
    "language": "de",
    "publishDetails": false
  }
  ```

### `PATCH /users/me`

Updates user preferences.

- **Auth:** Required
- **Body:**
  ```json
  {
    "language": "en",
    "publish_details": true
  }
  ```
- **Response:** `200 OK` (returns updated user object)

---

## 4. Timetable

### `GET /timetable`

Retrieves timetable sessions within a date range.

- **Auth:** Required
- **Query Parameters:**
  - `from`: ISO8601 Timestamp (optional, defaults to 7 days ago)
  - `to`: ISO8601 Timestamp (optional, defaults to 7 days from now)
  - `limit`: Integer (optional)
  - `offset`: Integer (optional)
- **Response:** `200 OK`
  ```json
  [
    {
      "id": "uuid",
      "startTime": "2024-05-10T08:00:00Z",
      "endTime": "2024-05-10T11:30:00Z",
      "remarks": "Bring your laptop",
      "subjectName": "Datenschutz",
      "subjectCode": "M231",
      "roomName": "ZH 208",
      "lecturerName": "Prof. Smith",
      "classDesignation": "IFZK-2524-017"
    }
  ]
  ```

---

## 5. Grades

### `GET /grades`

Retrieves all grades for the authenticated student.

- **Auth:** Required
- **Response:** `200 OK`
  ```json
  [
    {
      "id": "uuid",
      "subject": "Datenbanken",
      "grade": 5.2,
      "weight": 100.0,
      "description": "Modulprüfung"
    }
  ]
  ```

### `PATCH /grades/:id`

Updates a specific exam grade.

- **Auth:** Required (Role: `Dozent`)
- **Body:**
  ```json
  {
    "grade": 5.25
  }
  ```
- **Response:** `200 OK`

---

## 6. Documents

### `GET /documents`

Lists documents accessible to the user (GENERAL documents + PERSONAL ones targeting the user).

- **Auth:** Required
- **Query Parameters:**
  - `limit`: Integer (optional)
  - `offset`: Integer (optional)
- **Response:** `200 OK`
  ```json
  [
    {
      "id": "uuid",
      "designation": "Semester Plan",
      "documentType": "GENERAL",
      "modifiedAt": "2024-05-01T10:00:00Z"
    }
  ]
  ```

### `GET /documents/:id`

Streams a document file for download.

- **Auth:** Required
- **Response:** File Stream

### `POST /documents`

Uploads a new document.

- **Auth:** Required (Role: `Dozent`)
- **Body:** `multipart/form-data`
  - `designation`: String
  - `documentType`: "GENERAL" | "PERSONAL"
  - `targetUserId`: UUID (optional, required if PERSONAL)
  - `file`: Binary Data
- **Response:** `201 Created`

---

## 7. Attendance (Absenzen)

### `GET /absenzen`

Aggregated overview of attendance for all enrolled classes.

- **Auth:** Required
- **Response:** `200 OK`
  ```json
  [
    {
      "classId": "uuid",
      "className": "IFZK-2524",
      "sessionDate": "2024-05-08T08:00:00Z",
      "requiredLessons": 4.0,
      "attendedLessons": 4.0,
      "status": "Teilgenommen"
    }
  ]
  ```

### `GET /absenzen/:class_id`

Detailed attendance record for a specific class.

- **Auth:** Required
- **Response:** `200 OK`
  ```json
  [
    {
      "id": "uuid",
      "sessionId": "uuid",
      "studentId": "uuid",
      "attendedLessons": 4.0,
      "status": "Teilgenommen"
    }
  ]
  ```
