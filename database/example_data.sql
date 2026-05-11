-- ==========================================
-- SEED DATA FOR WISS TOCCO REDESIGN
-- Extracted from @reference_images
-- ==========================================

BEGIN;

-- 1. ROLES
INSERT INTO roles (id, name) VALUES 
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Lernende'), -- From Profile.png (MKT-Funktion)
('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Dozent');

-- 2. ROOMS (Extracted from Calendar.ics and TimetableDetail1.png)
INSERT INTO rooms (id, name) VALUES 
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'ZH 404'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'ZH 409'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'ZH 403'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a24', 'Extern Extern'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a25', 'ZH 201'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'ZH 206'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a27', 'ZH 208'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a28', 'ZH 205'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a29', 'ZH 402'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a30', 'online Online'),
('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a31', 'ZH 203');

-- 3. CLASSES (Extracted from Calendar.ics and GradesOverview.png)
INSERT INTO classes (id, designation) VALUES 
('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'IFZK-2524-017');

-- 4. SUBJECTS (Extracted from GradesOverview.png)
INSERT INTO subjects (id, code, name) VALUES 
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', 'GB-ZH-IFZK-M-B21-03-IK-GE-231', 'Datenschutz und Datensicherheit anwenden'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a52', 'GB-ZH-IFZK-M-B21-03-IK-GE-117', 'Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', 'GB-ZH-IFZK-M-B21-03-IK-GE-431', 'Aufträge im eigenen Berufsumfeld selbstständig abwickeln'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a54', 'GB-ZH-IFZK-M-B21-03-IK-GE-162', 'Daten analysieren und modellieren'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'GB-ZH-IFZK-M-B21-03-IK-GE-122', 'Abläufe mit einer Scriptsprache automatisieren'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a56', 'GB-ZH-IFZK-M-B21-03-UEK-GE-187', 'ICT-Arbeitsplatz mit Betriebssystem in Betrieb nehmen'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a57', 'GB-ZH-IFZK-M-B21-03-IK-GE-319', 'Applikationen entwerfen und implementieren'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a58', 'GB-ZH-IFZK-M-B21-03-IK-GE-346', 'Cloud Lösungen konzipieren und realisieren'),
('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a59', 'GB-ZH-IFZK-M-B21-03-IK-GE-254', 'Geschäftsprozesse im eigenen Berufsumfeld beschreiben');

-- 5. USERS (Extracted from Profile.png, DocumentsPersonal.png, DocumetnsGeneral.png)
-- Passwords are set to 'password' (bcrypt hash placeholder)
INSERT INTO users (id, role_id, email, first_name, last_name, gender, birth_date, language, publish_details) VALUES 
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'matteo.bosshard@wiss-edu.ch', 'Matteo', 'Bosshard', 'Männlich', '2007-02-27', 'de', false),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'roman.stuenzi@wiss.ch', 'Roman', 'Stünzi', 'Männlich', NULL, 'de', true),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'manuela.meier@wiss.ch', 'Manuela', 'Meier', 'Weiblich', NULL, 'de', true),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a64', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'adrian.garabito@wiss.ch', 'Adrian', 'Garabito', 'Männlich', NULL, 'de', true),
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'christoph.martin@wiss.ch', 'Christoph', 'Martin', 'Männlich', NULL, 'de', true);

-- 6. ENROLLMENT
INSERT INTO class_enrollments (user_id, class_id) VALUES 
('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41');

-- 7. EVENTS (Extracted from GradesOverview.png)
INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES 
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a71', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '32325 / IFZK-2524-017-S1-231'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '32326 / IFZK-2524-017-S1-431'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a73', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a56', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '32324 / IFZK-2524-017-S1-UEK-187'),
('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a74', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a59', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', 'IFZK-2524-017-S2-254');

-- 8. TIMETABLE SESSIONS (Extracted from Calendar.ics and TimetableDetail1.png)
INSERT INTO timetable_sessions (id, event_id, room_id, lecturer_id, start_time, end_time, remarks) VALUES 
-- 254 - Geschäftsprozesse im eigenen Berufsumfeld beschreiben (TimetableDetail1.png)
('01eebc99-9c0b-4ef8-bb6d-6bb9bd380a81', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a74', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a26', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', '2026-05-11 13:00:00+02', '2026-05-11 16:30:00+02', 'Bestehender Geschäftsprozess, der alle Grundformen von Folgebeziehungen und 10-20 Prozessschritte umfasst.'),
-- 241 - Innovative ICT-Lösungen initialisieren (Calendar.ics)
('01eebc99-9c0b-4ef8-bb6d-6bb9bd380a82', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', '2026-02-26 12:00:00+00', '2026-02-26 15:30:00+00', NULL);

-- 9. EXAMS (Extracted from GradesDetail1.png, GradesDetail2.png, GradesDetail3.png)
INSERT INTO exams (id, event_id, description, weight_percentage) VALUES 
-- Event 431
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a91', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'ZP', 30.00),
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a92', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a72', 'LB', 70.00),
-- Event 231
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a93', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a71', 'ZP', 30.00),
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a94', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a71', 'LB', 70.00),
-- Event 187
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a95', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a73', 'ZP', 30.00),
('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a96', 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a73', 'LB', 70.00);

-- 10. EXAM RESULTS (Extracted from GradesDetail1.png, GradesDetail2.png, GradesDetail3.png)
INSERT INTO exam_results (id, exam_id, student_id, grade) VALUES 
-- Event 431 Results (GradesDetail1.png)
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b01', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a91', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 5.500),
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b02', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a92', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 5.500),
-- Event 231 Results (GradesDetail2.png)
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b03', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a93', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 5.100),
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b04', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a94', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 4.700),
-- Event 187 Results (GradesDetail3.png)
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b05', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a95', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 5.900),
('21eebc99-9c0b-4ef8-bb6d-6bb9bd380b06', '11eebc99-9c0b-4ef8-bb6d-6bb9bd380a96', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 6.000);

-- 11. DOCUMENTS (Extracted from DocumentsPersonal.png and DocumetnsGeneral.png)
INSERT INTO documents (id, designation, file_path, document_type, target_user_id, modified_by, modified_at) VALUES 
('31eebc99-9c0b-4ef8-bb6d-6bb9bd380c01', 'Anmeldung', '/documents/personal/anmeldung.pdf', 'PERSONAL', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', '2025-07-09 14:12:00+02'),
('31eebc99-9c0b-4ef8-bb6d-6bb9bd380c02', 'Arztzeugnis', '/documents/personal/arztzeugnis.pdf', 'PERSONAL', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a62', '2026-04-08 09:11:00+02'),
('31eebc99-9c0b-4ef8-bb6d-6bb9bd380c03', 'Notenberechnung', '/documents/personal/notenberechnung.pdf', 'PERSONAL', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a63', '2026-03-05 12:11:00+02'),
('31eebc99-9c0b-4ef8-bb6d-6bb9bd380c04', 'Daten Grundbildung', '/documents/general/daten_grundbildung.pdf', 'GENERAL', NULL, 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a65', '2025-08-15 15:57:00+02');

-- 12. CLASS SESSIONS (For Attendance)
INSERT INTO class_sessions (id, class_id, session_date, required_lessons) VALUES 
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d01', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '2026-05-11 13:00:00+02', 4.0),
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d02', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '2026-05-04 13:00:00+02', 4.0),
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d03', 'c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a41', '2026-04-27 13:00:00+02', 4.0);

-- 13. ATTENDANCE RECORDS (For Matteo Bosshard)
INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES 
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d01', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 4.0, 'Teilgenommen'),
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d02', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 0.0, 'Offen'),
('41eebc99-9c0b-4ef8-bb6d-6bb9bd380d03', 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a61', 0.0, 'Nicht teilgenommen entschuldigt');

COMMIT;
