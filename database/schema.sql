-- Enable UUIDs
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ==========================================
-- 1. CORE LOOKUP TABLES
-- ==========================================

CREATE TABLE roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) UNIQUE NOT NULL -- e.g., 'Lernende', 'Dozent', 'Admin'
);

CREATE TABLE rooms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) UNIQUE NOT NULL -- e.g., 'ZH 208', 'Extern Extern'
);

CREATE TABLE classes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    designation VARCHAR(100) UNIQUE NOT NULL -- e.g., 'IFZK-2524-017'
);

CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    code VARCHAR(255) UNIQUE NOT NULL, -- e.g., 'GB-ZH-IFZK-M-B21-03-IK-GE-231'
    name VARCHAR(255) NOT NULL -- e.g., 'Datenschutz und Datensicherheit anwenden'
);

-- ==========================================
-- 2. USERS & ENROLLMENT
-- ==========================================

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_id UUID REFERENCES roles(id),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    gender VARCHAR(50),
    birth_date DATE,
    language VARCHAR(10) DEFAULT 'de',
    publish_details BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE class_enrollments (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    class_id UUID REFERENCES classes(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, class_id)
);

-- ==========================================
-- 3. CURRICULUM & TIMETABLE
-- ==========================================

CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_id UUID REFERENCES subjects(id),
    class_id UUID REFERENCES classes(id),
    event_shortcut VARCHAR(255) UNIQUE NOT NULL -- e.g., '32325 / IFZK-2524-017-S1-231'
);

CREATE TABLE timetable_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id UUID REFERENCES events(id) ON DELETE CASCADE,
    room_id UUID REFERENCES rooms(id),
    lecturer_id UUID REFERENCES users(id), -- Must be a user with a 'Dozent' role
    start_time TIMESTAMP WITH TIME ZONE NOT NULL,
    end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    remarks TEXT
);

-- ==========================================
-- 4. GRADING SYSTEM
-- ==========================================

-- Defines the tests for a specific course and their weights (e.g., 70%, 15%, 15%)
CREATE TABLE exams (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    event_id UUID REFERENCES events(id) ON DELETE CASCADE,
    description VARCHAR(100) NOT NULL, -- e.g., 'ZP', 'LB'
    weight_percentage NUMERIC(5, 2) NOT NULL CHECK (weight_percentage > 0 AND weight_percentage <= 100)
);

-- Stores the actual grade a student received on a specific exam
CREATE TABLE exam_results (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    exam_id UUID REFERENCES exams(id) ON DELETE CASCADE,
    student_id UUID REFERENCES users(id) ON DELETE CASCADE,
    grade NUMERIC(4, 3) NOT NULL, -- e.g., 5.100
    UNIQUE(exam_id, student_id) -- A student can only have one final result per specific exam
);

-- ==========================================
-- 5. DOCUMENTS
-- ==========================================

CREATE TABLE documents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    designation VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    document_type VARCHAR(50) NOT NULL CHECK (document_type IN ('GENERAL', 'PERSONAL')),
    target_user_id UUID REFERENCES users(id) ON DELETE CASCADE, -- NULL for GENERAL docs
    modified_by UUID REFERENCES users(id), -- The admin/teacher who uploaded or updated it
    modified_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);