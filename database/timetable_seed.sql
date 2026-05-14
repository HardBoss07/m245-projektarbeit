-- Timetable Seed Data
-- Generating sessions for May 2026 to match the current system date

BEGIN;

DO $$
DECLARE
    rid_404 UUID := (SELECT id FROM rooms WHERE name = 'ZH 404');
    rid_409 UUID := (SELECT id FROM rooms WHERE name = 'ZH 409');
    rid_208 UUID := (SELECT id FROM rooms WHERE name = 'ZH 208');
    
    lid_drini UUID := (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch');
    lid_narcissa UUID := (SELECT id FROM users WHERE email = 'narcissa.knott@wiss.ch');
    lid_ali UUID := (SELECT id FROM users WHERE email = 'ali.kazemi@wiss.ch');
    lid_john UUID := (SELECT id FROM users WHERE email = 'john.donaldson@wiss.ch');
    lid_emre UUID := (SELECT id FROM users WHERE email = 'emre.gursu@wiss.ch');
    
    eid_m245 UUID := (SELECT id FROM events WHERE event_shortcut = 'M245-EV');
    eid_m254 UUID := (SELECT id FROM events WHERE event_shortcut = 'M254-EV');
    eid_abu_s2 UUID := (SELECT id FROM events WHERE event_shortcut = 'ABU-S2-SK');
    eid_mat_s2 UUID := (SELECT id FROM events WHERE event_shortcut = 'MAT S2-EV');
    eid_eng_s2 UUID := (SELECT id FROM events WHERE event_shortcut = 'ENG S2-EV');
BEGIN
    -- Monday, May 11, 2026
    IF eid_m254 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_m254, rid_409, lid_drini, '2026-05-11 13:00:00+02', '2026-05-11 16:30:00+02', 'Geschäftsprozesse Analyse');
    END IF;

    -- Thursday, May 14, 2026 (Today)
    IF eid_m245 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_m245, rid_404, lid_emre, '2026-05-14 13:00:00+02', '2026-05-14 16:30:00+02', 'Projektumsetzung');
    END IF;

    -- Friday, May 15, 2026
    IF eid_abu_s2 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_abu_s2, rid_208, lid_narcissa, '2026-05-15 10:30:00+02', '2026-05-15 12:00:00+02', 'Sprache & Kommunikation');
    END IF;

    IF eid_mat_s2 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_mat_s2, rid_208, lid_ali, '2026-05-15 13:00:00+02', '2026-05-15 14:30:00+02', 'Mathematik Übungen');
    END IF;

    IF eid_eng_s2 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_eng_s2, rid_208, lid_john, '2026-05-15 15:00:00+02', '2026-05-15 16:30:00+02', 'English Proficiency');
    END IF;

    -- Monday, May 18, 2026
    IF eid_m254 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_m254, rid_409, lid_drini, '2026-05-18 13:00:00+02', '2026-05-18 16:30:00+02', 'Prozessoptimierung');
    END IF;

    -- Thursday, May 21, 2026
    IF eid_m245 IS NOT NULL THEN
        INSERT INTO timetable_sessions (event_id, room_id, lecturer_id, start_time, end_time, remarks)
        VALUES (eid_m245, rid_404, lid_emre, '2026-05-21 13:00:00+02', '2026-05-21 16:30:00+02', 'Final Testing');
    END IF;

END $$;

COMMIT;
