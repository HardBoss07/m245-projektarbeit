-- Attendance Seed Data
-- Extracted from reference screenshots

-- 1. Update Enum with missing values
ALTER TYPE attendance_status_enum ADD VALUE IF NOT EXISTS 'Abwesend 100%';
ALTER TYPE attendance_status_enum ADD VALUE IF NOT EXISTS 'Nicht teilgenommen unentschuldigt';

BEGIN;

-- 2. Ensure classes exist
INSERT INTO classes (id, designation, short_name, class_type) VALUES
(gen_random_uuid(), '114 - Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen', 'M114', 'Modul'),
(gen_random_uuid(), '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren', 'M117', 'Modul'),
(gen_random_uuid(), '122 - Abläufe mit einer Scriptsprache automatisieren', 'M122', 'Modul'),
(gen_random_uuid(), '162 - Daten analysieren und modellieren', 'M162', 'Modul'),
(gen_random_uuid(), '164 - Datenbanken erstellen und Daten einfügen', 'M164', 'Modul'),
(gen_random_uuid(), '187 - ICT-Arbeitsplatz mit Betriebssystem in Betrieb nehmen', 'M187', 'GE Modul'),
(gen_random_uuid(), '231 - Datenschutz und Datensicherheit anwenden', 'M231', 'Modul'),
(gen_random_uuid(), '241 - Innovative ICT-Lösungen initialisieren', 'M241', 'Modul'),
(gen_random_uuid(), '245 - Innovative ICT-Lösungen umsetzen', 'M245', 'Modul'),
(gen_random_uuid(), '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben', 'M254', 'Modul'),
(gen_random_uuid(), '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln', 'M306', 'Modul'),
(gen_random_uuid(), '319 - Applikationen entwerfen und implementieren', 'M319', 'Modul'),
(gen_random_uuid(), '346 - Cloud Lösungen konzipieren und realisieren', 'M346', 'Modul'),
(gen_random_uuid(), '431 - Aufträge im eigenen Berufsumfeld selbstständig durchführen', 'M431', 'Modul'),
(gen_random_uuid(), 'Sport Semester 1', 'Sport S1', 'Semester'),
(gen_random_uuid(), 'Allgemeinbildung Semester 1', 'ABU S1', 'Semester'),
(gen_random_uuid(), 'Allgemeinbildung Semester 2', 'ABU S2', 'Semester'),
(gen_random_uuid(), 'Office Werkzeuge anwenden', 'Office', 'GE Modul'),
(gen_random_uuid(), '106 - Datenbanken abfragen, bearbeiten und warten', 'M106', 'Modul'),
(gen_random_uuid(), 'Englisch Niveau 3 Semester 1', 'ENG S1', 'Semester'),
(gen_random_uuid(), 'Englisch Niveau 3 Semester 2', 'ENG S2', 'Semester'),
(gen_random_uuid(), 'Mathematik Semester 2', 'MAT S2', 'Semester')
ON CONFLICT (designation) DO NOTHING;

-- 3. Student ID subquery helper
-- We'll use (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch')

-- 4. Attendance Records

-- Batch 1: 114 - Codierungs- ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '114 - Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-11-12'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-11-12'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
END $$;

-- Batch 2: 117 - Informatik- ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..10 LOOP
        IF d != 7 THEN -- Skip one week (Autumn break?)
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-21'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 3: 122 - Abläufe ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '122 - Abläufe mit einer Scriptsprache automatisieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    -- 2025 dates
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-12-17 08:30:00+01', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-12-17 13:00:00+01', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    -- 2026 dates
    FOR d IN 0..3 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-01-07'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-01-07'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
END $$;

-- Batch 4: 162 - Daten analysieren ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '162 - Daten analysieren und modellieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..10 LOOP
        IF d != 10 THEN -- 2025
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-10-27'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        ELSE -- 2026
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-01-05 13:00:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-01-12 13:00:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 5: 164 - Datenbanken erstellen ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '164 - Datenbanken erstellen und Daten einfügen');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..10 LOOP
        sess_id := gen_random_uuid();
        INSERT INTO class_sessions (id, class_id, session_date, required_lessons) 
        VALUES (sess_id, cid, '2025-11-13'::date + (d * 7) + '13:00:00'::time, 4.0);
        
        IF d = 1 OR d = 4 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 6: 187 - ICT-Arbeitsplatz ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '187 - ICT-Arbeitsplatz mit Betriebssystem in Betrieb nehmen');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        -- Morning
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-20'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        -- Afternoon
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-20'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
END $$;

-- Batch 7: 231 - Datenschutz ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '231 - Datenschutz und Datensicherheit anwenden');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..10 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-10-28'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        IF d = 3 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 8: 254 - Geschäftsprozesse ...
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-04-13 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-05-04 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-05-11 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Abwesend 100%');
END $$;

-- Batch 9: Sport Semester 1
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Sport Semester 1');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..12 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-26'::date + (d * 14) + '08:20:00'::time, 2.0) RETURNING id INTO sess_id;
        IF d = 4 OR d = 6 OR d = 11 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 2.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 10: 431 - Aufträge im eigenen Berufsumfeld selbstständig durchführen
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '431 - Aufträge im eigenen Berufsumfeld selbstständig durchführen');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..5 LOOP
        -- Morning
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-25'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        -- Afternoon
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-25'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
    -- Extra session Oct 1
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-10-01 08:30:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-10-01 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
END $$;

-- Batch 11: Allgemeinbildung Semester 1
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Allgemeinbildung Semester 1');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..20 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-22'::date + (d * 7) + '10:30:00'::time, 2.0) RETURNING id INTO sess_id;
        IF d = 2 OR d = 9 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSIF d = 21 THEN
             INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 2.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 12: Office Werkzeuge anwenden
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Office Werkzeuge anwenden');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..6 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-21'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
END $$;

-- Batch 13: 106 - Datenbanken abfragen, bearbeiten und warten
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '106 - Datenbanken abfragen, bearbeiten und warten');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        -- Morning
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-02'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        -- Afternoon
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-02'::date + (d * 7) + '13:00:00'::time, 5.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 5.0, 'Teilgenommen');
    END LOOP;
END $$;

-- Batch 14: 241 - Innovative ICT-Lösungen initialisieren
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '241 - Innovative ICT-Lösungen initialisieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..8 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-19'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
    -- Extra 16. April sessions
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-04-16 08:30:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-04-16 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
END $$;

-- Batch 15: 245 - Innovative ICT-Lösungen umsetzen
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '245 - Innovative ICT-Lösungen umsetzen');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-05-07 13:00:00+02', 4.0) RETURNING id INTO sess_id;
    INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    FOR d IN 1..10 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-05-07'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 16: 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-31'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
    FOR d IN 5..9 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-31'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 17: 319 - Applikationen entwerfen und implementieren
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '319 - Applikationen entwerfen und implementieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        IF d = 2 THEN -- March 4th
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-04 08:30:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-04 13:00:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSIF d = 3 THEN -- March 11th
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-11 08:30:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-03-11 13:00:00+01', 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-18'::date + (d * 7) + '08:30:00'::time, 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
            INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-18'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- Batch 18: 346 - Cloud Lösungen konzipieren und realisieren
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = '346 - Cloud Lösungen konzipieren und realisieren');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..4 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-04-01'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
    END LOOP;
    FOR d IN 5..10 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-04-01'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 19: Allgemeinbildung Semester 2
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Allgemeinbildung Semester 2');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..8 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '10:30:00'::time, 2.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 2.0, 'Teilgenommen');
    END LOOP;
    FOR d IN 9..20 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '10:30:00'::time, 2.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 20: Mathematik Semester 2
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Mathematik Semester 2');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..8 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '13:00:00'::time, 2.0) RETURNING id INTO sess_id;
        IF d = 3 OR d = 5 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 2.0, 'Teilgenommen');
        END IF;
    END LOOP;
    FOR d IN 9..20 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '13:00:00'::time, 2.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 21: Englisch Niveau 3 Semester 2
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Englisch Niveau 3 Semester 2');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..8 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '15:00:00'::time, 2.0) RETURNING id INTO sess_id;
        IF d = 3 OR d = 4 OR d = 5 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 2.0, 'Teilgenommen');
        END IF;
    END LOOP;
    FOR d IN 9..20 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2026-02-20'::date + (d * 7) + '15:00:00'::time, 2.0) RETURNING id INTO sess_id;
        INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Offen');
    END LOOP;
END $$;

-- Batch 22: Englisch Niveau 3 Semester 1
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'Englisch Niveau 3 Semester 1');
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    sess_id UUID;
BEGIN
    FOR d IN 0..22 LOOP
        INSERT INTO class_sessions (class_id, session_date, required_lessons) VALUES (cid, '2025-08-22'::date + (d * 7) + '13:00:00'::time, 4.0) RETURNING id INTO sess_id;
        IF d = 2 OR d = 4 OR d = 11 OR d = 19 OR d = 21 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen entschuldigt');
        ELSIF d = 17 OR d = 20 THEN
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 0.0, 'Nicht teilgenommen unentschuldigt');
        ELSE
            INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES (sess_id, sid, 4.0, 'Teilgenommen');
        END IF;
    END LOOP;
END $$;

-- 5. Enroll Student in all classes (CRITICAL FIX)
DO $$
DECLARE
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
BEGIN
    IF sid IS NULL THEN
        RAISE EXCEPTION 'User matteo.bosshard@wiss-edu.ch not found. Base data cleanup might have failed.';
    END IF;

    INSERT INTO class_enrollments (user_id, class_id)
    SELECT sid, id FROM classes
    ON CONFLICT DO NOTHING;
END $$;

COMMIT;
