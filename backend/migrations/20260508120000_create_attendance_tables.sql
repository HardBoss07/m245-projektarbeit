-- Create ENUM for Class Type
CREATE TYPE class_type_enum AS ENUM (
    'GE Modul', 
    'Modul', 
    'Semester', 
    'Parallelmodul', 
    'GE Überbetrieblicher Kurs'
);

-- Create ENUM for Attendance Status
CREATE TYPE attendance_status_enum AS ENUM (
    'Teilgenommen', 
    'Nicht teilgenommen entschuldigt', 
    'Offen'
);

-- Update classes table
ALTER TABLE classes 
ADD COLUMN short_name VARCHAR(100),
ADD COLUMN class_type class_type_enum,
ADD COLUMN description TEXT,
ADD COLUMN min_attendance_pct NUMERIC(5, 2) DEFAULT 90.00;

-- Create class_sessions table
CREATE TABLE class_sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    class_id UUID NOT NULL REFERENCES classes(id) ON DELETE CASCADE,
    session_date TIMESTAMP WITH TIME ZONE NOT NULL,
    required_lessons NUMERIC(5, 2) NOT NULL
);

-- Create attendance_records table
CREATE TABLE attendance_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID NOT NULL REFERENCES class_sessions(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    attended_lessons NUMERIC(5, 2) NOT NULL,
    status attendance_status_enum NOT NULL DEFAULT 'Offen',
    UNIQUE(session_id, student_id)
);
