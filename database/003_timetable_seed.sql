-- Timetable Seed Data generated from ICS
BEGIN;

-- Ensure main class exists
INSERT INTO classes (id, designation, short_name, class_type) VALUES
('0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017', 'IFZK-2524', 'Semester')
ON CONFLICT (designation) DO NOTHING;

-- Process events and sessions
DO $$
DECLARE
    cid UUID := (SELECT id FROM classes WHERE designation = 'IFZK-2524-017');
    sid UUID;
    eid UUID;
    rid UUID;
    lec_id UUID;
BEGIN
    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-21 06:20:00+00', '2025-10-21 07:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-21 08:30:00+00', '2025-10-21 10:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-21 11:00:00+00', '2025-10-21 12:30:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-117 / 117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-117', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-117');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-117') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-117');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-23 11:00:00+00', '2025-10-23 14:30:00+00', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-24 08:30:00+00', '2025-10-24 10:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-24 11:00:00+00', '2025-10-24 14:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-27 12:00:00+00', '2025-10-27 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-28 07:30:00+00', '2025-10-28 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-28 12:00:00+00', '2025-10-28 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-117 / 117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-117', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-117');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-117') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-117');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-30 12:00:00+00', '2025-10-30 15:30:00+00', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-31 09:30:00+00', '2025-10-31 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-10-31 12:00:00+00', '2025-10-31 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-03 12:00:00+00', '2025-11-03 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-04 07:20:00+00', '2025-11-04 08:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-04 09:30:00+00', '2025-11-04 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-04 12:00:00+00', '2025-11-04 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-117 / 117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-117', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-117');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-117') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-117');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-06 12:00:00+00', '2025-11-06 15:30:00+00', '117 - Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-07 09:30:00+00', '2025-11-07 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-07 12:00:00+00', '2025-11-07 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-10 12:00:00+00', '2025-11-10 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-11 07:30:00+00', '2025-11-11 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-11 12:00:00+00', '2025-11-11 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-12 07:30:00+00', '2025-11-12 11:00:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-12 12:00:00+00', '2025-11-12 15:30:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-13 12:00:00+00', '2025-11-13 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-14 09:30:00+00', '2025-11-14 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-14 12:00:00+00', '2025-11-14 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-17 12:00:00+00', '2025-11-17 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-18 07:20:00+00', '2025-11-18 08:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-18 09:30:00+00', '2025-11-18 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-18 12:00:00+00', '2025-11-18 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-19 07:30:00+00', '2025-11-19 11:00:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-19 12:00:00+00', '2025-11-19 15:30:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-20 12:00:00+00', '2025-11-20 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-21 09:30:00+00', '2025-11-21 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-21 12:00:00+00', '2025-11-21 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-24 12:00:00+00', '2025-11-24 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-25 07:30:00+00', '2025-11-25 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-25 12:00:00+00', '2025-11-25 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-26 07:30:00+00', '2025-11-26 11:00:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-26 12:00:00+00', '2025-11-26 15:30:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-27 12:00:00+00', '2025-11-27 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-28 09:30:00+00', '2025-11-28 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-11-28 12:00:00+00', '2025-11-28 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-01 12:00:00+00', '2025-12-01 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-02 07:20:00+00', '2025-12-02 08:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-02 09:30:00+00', '2025-12-02 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-02 12:00:00+00', '2025-12-02 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-03 07:30:00+00', '2025-12-03 11:00:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-03 12:00:00+00', '2025-12-03 15:30:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-04 12:00:00+00', '2025-12-04 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-05 09:30:00+00', '2025-12-05 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-05 12:00:00+00', '2025-12-05 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-08 12:00:00+00', '2025-12-08 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-09 07:30:00+00', '2025-12-09 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-09 12:00:00+00', '2025-12-09 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-10 07:30:00+00', '2025-12-10 11:00:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-114 / 114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-114', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-114');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-114') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-114');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-10 12:00:00+00', '2025-12-10 15:30:00+00', '114 - Codierungs-\\, Kompressions- und Verschlüsselungsverfahren einsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-11 12:00:00+00', '2025-12-11 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-12 09:30:00+00', '2025-12-12 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-12 12:00:00+00', '2025-12-12 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-15 12:00:00+00', '2025-12-15 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-16 08:00:00+00', '2025-12-16 10:30:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-16 12:00:00+00', '2025-12-16 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-17 07:30:00+00', '2025-12-17 11:00:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-17 12:00:00+00', '2025-12-17 15:30:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-18 12:00:00+00', '2025-12-18 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-19 09:30:00+00', '2025-12-19 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 411');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 411') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2025-12-19 12:00:00+00', '2025-12-19 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-05 12:00:00+00', '2026-01-05 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-06 07:30:00+00', '2026-01-06 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-06 12:00:00+00', '2026-01-06 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-07 07:30:00+00', '2026-01-07 11:00:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-07 12:00:00+00', '2026-01-07 15:30:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-08 12:00:00+00', '2026-01-08 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-09 09:30:00+00', '2026-01-09 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 411');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 411') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-09 12:00:00+00', '2026-01-09 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-162 / 162 - Daten analysieren und modellieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-162', '162 - Daten analysieren und modellieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-162');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-162') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-162');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-12 12:00:00+00', '2026-01-12 15:30:00+00', '162 - Daten analysieren und modellieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-13 07:20:00+00', '2026-01-13 08:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-13 09:30:00+00', '2026-01-13 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-231 / 231 - Datenschutz und Datensicherheit anwenden
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-231', '231 - Datenschutz und Datensicherheit anwenden') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-231');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-231') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-231');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-13 12:00:00+00', '2026-01-13 15:30:00+00', '231 - Datenschutz und Datensicherheit anwenden')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-14 07:30:00+00', '2026-01-14 11:00:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-14 12:00:00+00', '2026-01-14 15:30:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-15 12:00:00+00', '2026-01-15 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-16 09:30:00+00', '2026-01-16 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-16 12:00:00+00', '2026-01-16 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SEST / Selbststudium Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SEST', 'Selbststudium Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SEST');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SEST') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SEST');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-20 07:30:00+00', '2026-01-20 11:00:00+00', 'Selbststudium Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-21 07:30:00+00', '2026-01-21 11:00:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-21 12:00:00+00', '2026-01-21 15:30:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-22 12:00:00+00', '2026-01-22 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-23 09:30:00+00', '2026-01-23 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 411');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 411') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-23 12:00:00+00', '2026-01-23 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-SPOR / Sport Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-SPOR', 'Sport Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-27 07:20:00+00', '2026-01-27 08:50:00+00', 'Sport Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-28 07:30:00+00', '2026-01-28 11:00:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-122 / 122 - Abläufe mit einer Scriptsprache automatisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-122', '122 - Abläufe mit einer Scriptsprache automatisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-122');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-122') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-122');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-28 12:00:00+00', '2026-01-28 15:30:00+00', '122 - Abläufe mit einer Scriptsprache automatisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-164 / 164 - Datenbanken erstellen und Daten einfügen
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-164', '164 - Datenbanken erstellen und Daten einfügen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-164');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-164') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-164');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 202');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 202') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-29 12:00:00+00', '2026-01-29 15:30:00+00', '164 - Datenbanken erstellen und Daten einfügen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ABU / Allgemeinbildung  Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ABU', 'Allgemeinbildung  Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-30 09:30:00+00', '2026-01-30 11:00:00+00', 'Allgemeinbildung  Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S1-ENG-N3 / Englisch Niveau 3 Semester 1
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S1-ENG-N3', 'Englisch Niveau 3 Semester 1') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S1-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S1-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S1-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 411');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 411') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-01-30 12:00:00+00', '2026-01-30 15:30:00+00', 'Englisch Niveau 3 Semester 1')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-02-26 12:00:00+00', '2026-02-26 15:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-02-27 09:30:00+00', '2026-02-27 11:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-02-27 12:00:00+00', '2026-02-27 13:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-02-27 14:00:00+00', '2026-02-27 15:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-02 07:30:00+00', '2026-03-02 11:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-02 12:00:00+00', '2026-03-02 16:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-03 07:20:00+00', '2026-03-03 08:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-04 07:30:00+00', '2026-03-04 11:00:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-04 12:00:00+00', '2026-03-04 15:30:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-05 12:00:00+00', '2026-03-05 15:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-06 09:30:00+00', '2026-03-06 11:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-06 12:00:00+00', '2026-03-06 13:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 201');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 201') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-06 14:00:00+00', '2026-03-06 15:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-09 07:30:00+00', '2026-03-09 11:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-09 12:00:00+00', '2026-03-09 16:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-11 07:30:00+00', '2026-03-11 11:00:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-11 12:00:00+00', '2026-03-11 15:30:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-12 12:00:00+00', '2026-03-12 15:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 205');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 205') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-13 09:30:00+00', '2026-03-13 11:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 205');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 205') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-13 12:00:00+00', '2026-03-13 13:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 205');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 205') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-13 14:00:00+00', '2026-03-13 15:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-16 07:30:00+00', '2026-03-16 11:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-16 12:00:00+00', '2026-03-16 16:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-17 07:20:00+00', '2026-03-17 08:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-18 07:30:00+00', '2026-03-18 11:00:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-319 / 319 - Applikationen entwerfen und implementieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-319', '319 - Applikationen entwerfen und implementieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-319');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-319') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-319');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-18 12:00:00+00', '2026-03-18 15:30:00+00', '319 - Applikationen entwerfen und implementieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-19 12:00:00+00', '2026-03-19 15:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-20 09:30:00+00', '2026-03-20 11:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-20 12:00:00+00', '2026-03-20 13:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 402');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 402') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-20 14:00:00+00', '2026-03-20 15:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-23 07:30:00+00', '2026-03-23 11:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-23 12:00:00+00', '2026-03-23 16:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-26 12:00:00+00', '2026-03-26 15:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-27 09:30:00+00', '2026-03-27 11:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-27 12:00:00+00', '2026-03-27 13:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-27 14:00:00+00', '2026-03-27 15:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-30 06:30:00+00', '2026-03-30 10:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-UEK-106 / 106 - Datenbanken abfragen\, bearbeiten und warten
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-UEK-106', '106 - Datenbanken abfragen\, bearbeiten und warten') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-UEK-106');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-UEK-106') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-UEK-106');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-30 11:00:00+00', '2026-03-30 15:00:00+00', '106 - Datenbanken abfragen\, bearbeiten und warten')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-31 06:20:00+00', '2026-03-31 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 403');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 403') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-03-31 11:00:00+00', '2026-03-31 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-01 08:30:00+00', '2026-04-01 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-01 11:00:00+00', '2026-04-01 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-02 11:00:00+00', '2026-04-02 14:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'online Online');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'online Online') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-07 07:00:00+00', '2026-04-07 09:30:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-07 11:00:00+00', '2026-04-07 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-08 11:00:00+00', '2026-04-08 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-09 11:00:00+00', '2026-04-09 14:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-10 08:30:00+00', '2026-04-10 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-10 11:00:00+00', '2026-04-10 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-10 13:00:00+00', '2026-04-10 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-13 11:00:00+00', '2026-04-13 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-14 11:00:00+00', '2026-04-14 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-15 11:00:00+00', '2026-04-15 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-16 06:30:00+00', '2026-04-16 10:00:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-241 / 241 - Innovative ICT-Lösungen initialisieren
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-241', '241 - Innovative ICT-Lösungen initialisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-241');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-241') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-241');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-16 11:00:00+00', '2026-04-16 14:30:00+00', '241 - Innovative ICT-Lösungen initialisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-17 08:30:00+00', '2026-04-17 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-17 11:00:00+00', '2026-04-17 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-04-17 13:00:00+00', '2026-04-17 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-04 11:00:00+00', '2026-05-04 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-05 06:20:00+00', '2026-05-05 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-05 11:00:00+00', '2026-05-05 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-06 08:30:00+00', '2026-05-06 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-06 11:00:00+00', '2026-05-06 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-07 11:00:00+00', '2026-05-07 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-08 08:30:00+00', '2026-05-08 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-08 11:00:00+00', '2026-05-08 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-08 13:00:00+00', '2026-05-08 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-11 11:00:00+00', '2026-05-11 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-12 11:00:00+00', '2026-05-12 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-13 11:00:00+00', '2026-05-13 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-15 11:00:00+00', '2026-05-15 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-15 13:00:00+00', '2026-05-15 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-18 11:00:00+00', '2026-05-18 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-19 06:20:00+00', '2026-05-19 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-19 11:00:00+00', '2026-05-19 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-20 11:00:00+00', '2026-05-20 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-21 11:00:00+00', '2026-05-21 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-22 08:30:00+00', '2026-05-22 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-22 11:00:00+00', '2026-05-22 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-22 13:00:00+00', '2026-05-22 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-26 11:00:00+00', '2026-05-26 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-27 11:00:00+00', '2026-05-27 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-28 11:00:00+00', '2026-05-28 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-29 08:30:00+00', '2026-05-29 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-29 11:00:00+00', '2026-05-29 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-05-29 13:00:00+00', '2026-05-29 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-01 11:00:00+00', '2026-06-01 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-02 06:20:00+00', '2026-06-02 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-02 11:00:00+00', '2026-06-02 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-03 11:00:00+00', '2026-06-03 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-04 11:00:00+00', '2026-06-04 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-05 08:30:00+00', '2026-06-05 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-05 11:00:00+00', '2026-06-05 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-05 13:00:00+00', '2026-06-05 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-08 11:00:00+00', '2026-06-08 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-09 11:00:00+00', '2026-06-09 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-10 11:00:00+00', '2026-06-10 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-11 11:00:00+00', '2026-06-11 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-12 08:30:00+00', '2026-06-12 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-12 11:00:00+00', '2026-06-12 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-12 13:00:00+00', '2026-06-12 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-15 11:00:00+00', '2026-06-15 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-16 06:20:00+00', '2026-06-16 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-306 / 306 - Kleinprojekte im eigenen Berufsumfeld abwickeln
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-306', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-306');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-306') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-306');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-16 11:00:00+00', '2026-06-16 14:30:00+00', '306 - Kleinprojekte im eigenen Berufsumfeld abwickeln')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-346 / 346 - Cloud Lösungen konzipieren und realisieren
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-346', '346 - Cloud Lösungen konzipieren und realisieren') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-346');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-346') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-346');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-17 11:00:00+00', '2026-06-17 14:30:00+00', '346 - Cloud Lösungen konzipieren und realisieren')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-18 11:00:00+00', '2026-06-18 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-19 08:30:00+00', '2026-06-19 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-19 11:00:00+00', '2026-06-19 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-19 13:00:00+00', '2026-06-19 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-22 11:00:00+00', '2026-06-22 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-25 11:00:00+00', '2026-06-25 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-26 08:30:00+00', '2026-06-26 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-26 11:00:00+00', '2026-06-26 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-26 13:00:00+00', '2026-06-26 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-29 11:00:00+00', '2026-06-29 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'online Online');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'online Online') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-06-30 07:00:00+00', '2026-06-30 09:30:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 203');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 203') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-02 11:00:00+00', '2026-07-02 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-03 08:30:00+00', '2026-07-03 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-03 11:00:00+00', '2026-07-03 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-03 13:00:00+00', '2026-07-03 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-254 / 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-254', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-254');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-254') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-254');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 206');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 206') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-06 11:00:00+00', '2026-07-06 14:30:00+00', '254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-SPOR / Sport Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-SPOR', 'Sport Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-SPOR');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-SPOR') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-SPOR');
    rid := (SELECT id FROM rooms WHERE name = 'Extern Extern');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'Extern Extern') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-07 06:20:00+00', '2026-07-07 07:50:00+00', 'Sport Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-09 06:30:00+00', '2026-07-09 10:00:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-245 / 245 - Innovative ICT-Lösungen umsetzen
    lec_id := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-245', '245 - Innovative ICT-Lösungen umsetzen') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-245');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-245') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-245');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 208');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 208') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-09 11:00:00+00', '2026-07-09 14:30:00+00', '245 - Innovative ICT-Lösungen umsetzen')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ABU / Allgemeinbildung  Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ABU', 'Allgemeinbildung  Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ABU');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ABU') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ABU');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-10 08:30:00+00', '2026-07-10 10:00:00+00', 'Allgemeinbildung  Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-MAT / Mathematik Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-MAT', 'Mathematik Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-MAT');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-MAT') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-MAT');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 404');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 404') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-10 11:00:00+00', '2026-07-10 12:30:00+00', 'Mathematik Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- Session: IFZK-2524-017-S2-ENG-N3 / Englisch Niveau 3 Semester 2
    lec_id := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    INSERT INTO subjects (id, code, name) VALUES (gen_random_uuid(), 'IFZK-2524-017-S2-ENG-N3', 'Englisch Niveau 3 Semester 2') ON CONFLICT (code) DO NOTHING;
    sid := (SELECT id FROM subjects WHERE code = 'IFZK-2524-017-S2-ENG-N3');
    INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES (gen_random_uuid(), sid, cid, 'IFZK-2524-017-S2-ENG-N3') ON CONFLICT (event_shortcut) DO NOTHING;
    eid := (SELECT id FROM events WHERE event_shortcut = 'IFZK-2524-017-S2-ENG-N3');
    rid := (SELECT id FROM rooms WHERE name = 'ZH 409');
    IF rid IS NULL THEN
        INSERT INTO rooms (id, name) VALUES (gen_random_uuid(), 'ZH 409') RETURNING id INTO rid;
    END IF;
    INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
    VALUES (eid, rid, lec_id, '2026-07-10 13:00:00+00', '2026-07-10 14:30:00+00', 'Englisch Niveau 3 Semester 2')
    ON CONFLICT (event_id, start_time, end_time) DO NOTHING;

    -- CRITICAL: Enroll student in the main class
    INSERT INTO class_enrollments (user_id, class_id)
    VALUES ((SELECT id FROM users WHERE email = 'matteo.bosshard@wiss-edu.ch'), cid)
    ON CONFLICT DO NOTHING;

END $$;
COMMIT;