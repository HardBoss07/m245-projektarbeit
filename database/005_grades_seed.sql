-- Grades Seed Data
-- Extracted from reference screenshots

-- ========================================================================
-- PHASE A: Ensure Subjects exist for all classes
-- ========================================================================
INSERT INTO subjects (id, code, name)
SELECT gen_random_uuid(), short_name, designation
FROM classes
ON CONFLICT (code) DO NOTHING;

-- Special subjects for ABU components
INSERT INTO subjects (id, code, name) VALUES
(gen_random_uuid(), 'ABU-SK', 'Sprache und Kommunikation'),
(gen_random_uuid(), 'ABU-GES', 'Gesellschaft')
ON CONFLICT (code) DO NOTHING;

-- ========================================================================
-- PHASE B: Ensure Events exist for all classes
-- ========================================================================
INSERT INTO events (id, subject_id, class_id, event_shortcut)
SELECT gen_random_uuid(), s.id, c.id, c.short_name || '-EV'
FROM classes c
JOIN subjects s ON s.code = c.short_name
WHERE NOT EXISTS (
    SELECT 1 FROM events e2 WHERE e2.subject_id = s.id AND e2.class_id = c.id
)
ON CONFLICT (event_shortcut) DO NOTHING;

-- Special events for ABU and English components
DO $$
BEGIN
    -- ABU Semester 1 - Sprache und Kommunikation
    INSERT INTO events (id, subject_id, class_id, event_shortcut)
    SELECT gen_random_uuid(), (SELECT id FROM subjects WHERE code = 'ABU-SK'), (SELECT id FROM classes WHERE designation = 'Allgemeinbildung Semester 1'), 'ABU-S1-SK'
    WHERE NOT EXISTS (SELECT 1 FROM events WHERE event_shortcut = 'ABU-S1-SK')
    ON CONFLICT (event_shortcut) DO NOTHING;

    -- ABU Semester 1 - Gesellschaft
    INSERT INTO events (id, subject_id, class_id, event_shortcut)
    SELECT gen_random_uuid(), (SELECT id FROM subjects WHERE code = 'ABU-GES'), (SELECT id FROM classes WHERE designation = 'Allgemeinbildung Semester 1'), 'ABU-S1-GES'
    WHERE NOT EXISTS (SELECT 1 FROM events WHERE event_shortcut = 'ABU-S1-GES')
    ON CONFLICT (event_shortcut) DO NOTHING;

    -- ABU Semester 2 - Sprache und Kommunikation
    INSERT INTO events (id, subject_id, class_id, event_shortcut)
    SELECT gen_random_uuid(), (SELECT id FROM subjects WHERE code = 'ABU-SK'), (SELECT id FROM classes WHERE designation = 'Allgemeinbildung Semester 2'), 'ABU-S2-SK'
    WHERE NOT EXISTS (SELECT 1 FROM events WHERE event_shortcut = 'ABU-S2-SK')
    ON CONFLICT (event_shortcut) DO NOTHING;

    -- Note: English and others are already handled by the generic JOIN above if their code matches short_name.
END $$;

-- ========================================================================
-- PHASE C: Insert Exams and Exam Results (Preserving Extracted Data)
-- ========================================================================

-- Transaction block for grades
BEGIN;

DO $$
DECLARE
    sid UUID := (SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch');
    eid UUID;
    exam_id UUID;
    class_name TEXT;
BEGIN
    IF sid IS NULL THEN RAISE EXCEPTION 'User Matteo Bosshard not found.'; END IF;

    -- ========================================================================
    -- Image 1: Allgemeinbildung Semester 2 (Sprache und Kommunikation)
    -- ========================================================================
    class_name := 'Allgemeinbildung Semester 2';
    eid := (SELECT id FROM events WHERE event_shortcut = 'ABU-S2-SK' LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 1', 33.00);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 2', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 3', 34.00);

    -- ========================================================================
    -- Image 2: 187 - ICT-Arbeitsplatz ...
    -- ========================================================================
    class_name := '187 - ICT-Arbeitsplatz mit Betriebssystem in Betrieb nehmen';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.900);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);

    -- ========================================================================
    -- Image 3: 164 - Datenbanken erstellen ...
    -- ========================================================================
    class_name := '164 - Datenbanken erstellen und Daten einfügen';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.820);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.900);

    -- ========================================================================
    -- Image 4: 114 - Codierungs- ...
    -- ========================================================================
    class_name := '114 - Codierungs-, Kompressions- und Verschlüsselungsverfahren einsetzen';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.900);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.700);

    -- ========================================================================
    -- Image 5: Allgemeinbildung Semester 1 (Sprache und Kommunikation)
    -- ========================================================================
    class_name := 'Allgemeinbildung Semester 1';
    eid := (SELECT id FROM events WHERE event_shortcut = 'ABU-S1-SK' LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for % (SK)', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 1', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 2', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 3', 34.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);

    -- ========================================================================
    -- Image 6: 122 - Ablaufe mit einer Scriptsprache ...
    -- ========================================================================
    class_name := '122 - Ablaufe mit einer Scriptsprache automatisieren';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.900);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.700);

    -- ========================================================================
    -- Image 7: Englisch Niveau 3 Semester 2
    -- ========================================================================
    class_name := 'Englisch Niveau 3 Semester 2';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 1', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.400);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 2', 33.00);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 3', 34.00);

    -- ========================================================================
    -- Image 8: 162 - Daten analysieren ...
    -- ========================================================================
    class_name := '162 - Daten analysieren und modellieren';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 20.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.300);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'SQ4A', 7.50) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'SQ5D', 7.50) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'SQ6C', 7.50) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.500);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'SQ7C', 7.50) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB Projekt', 50.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.700);

    -- ========================================================================
    -- Image 9: 431 - Aufträge im eigenen Berufsumfeld ...
    -- ========================================================================
    class_name := '431 - Aufträge im eigenen Berufsumfeld selbstständig durchführen';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.500);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.500);

    -- ========================================================================
    -- Image 10: Allgemeinbildung Semester 1 (Gesellschaft)
    -- ========================================================================
    class_name := 'Allgemeinbildung Semester 1';
    eid := (SELECT id FROM events WHERE event_shortcut = 'ABU-S1-GES' LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for % (GES)', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 1', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 2', 33.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 6.000);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 3', 34.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.100);

    -- ========================================================================
    -- Image 11: Englisch Niveau 3 Semester 1
    -- ========================================================================
    class_name := 'Englisch Niveau 3 Semester 1';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 1', 25.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.500);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 2', 25.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.610);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 3', 25.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.830);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB 4', 25.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.440);

    -- ========================================================================
    -- Image 12: 117 - Informatik- und Netzinfrastruktur ...
    -- ========================================================================
    class_name := '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.400);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 4.600);

    -- ========================================================================
    -- Image 13: 231 - Datenschutz und Datensicherheit anwenden
    -- ========================================================================
    class_name := '231 - Datenschutz und Datensicherheit anwenden';
    eid := (SELECT id FROM events WHERE class_id = (SELECT id FROM classes WHERE designation = class_name) LIMIT 1);
    IF eid IS NULL THEN RAISE EXCEPTION 'Event not found for %', class_name; END IF;
    
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'ZP', 30.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 5.100);
    INSERT INTO exams (event_id, description, weight_percentage) VALUES (eid, 'LB', 70.00) RETURNING id INTO exam_id;
    INSERT INTO exam_results (exam_id, student_id, grade) VALUES (exam_id, sid, 4.700);

END $$;

COMMIT;
