BEGIN;

-- ==========================================
-- 1. ROLES
-- ==========================================
INSERT INTO roles (id, name) VALUES 
('5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'Lernende'),
('8b7bfb89-2aed-40fb-a623-79cf63691d56', 'Dozent'),
('90285527-fca9-4869-88d0-ba3610d6e8e9', 'Administrator');

-- ==========================================
-- 2. ROOMS
-- ==========================================
INSERT INTO rooms (id, name) VALUES 
('9bf6def9-c0b7-4206-9f84-410bbe4259c0', 'ZH 404'),
('3e499c74-911a-441c-9de0-77e9e49bc5e5', 'ZH 409'),
('986843c8-a8eb-4edb-9223-59bd63e7acbf', 'ZH 403'),
('851b52be-39a8-4d81-9a9a-10110e1e2769', 'ZH 402'),
('97e9ed34-e814-47ba-82cb-75b5424d7d22', 'ZH 401'),
('87f6aa43-a42a-473d-81b9-62d7c3dc6e6c', 'ZH 405'),
('59eafba4-7f64-479f-b6a4-8d314073039f', 'ZH 406'),
('acd8f321-3841-4b7e-b05a-9a9d63689191', 'ZH 407'),
('28310b1e-d92a-493d-917a-5b844ecb8a5d', 'ZH 408'),
('e6cf61fb-c616-4c35-8740-a65ac4b44b45', 'Extern Extern'),
('6a4ee233-ef2c-403d-86b5-0ba782223bcc', 'ZH 201'),
('22deceb1-38b6-42bc-81d7-26636cf4fb28', 'ZH 206'),
('5b58d559-6b17-48c9-a10a-60133aa51c7d', 'ZH 208'),
('1037783a-f959-4caa-9373-dc5c59e48a47', 'ZH 205'),
('39b0b836-bf1f-4907-8a9a-38ac245558ef', 'online Online'),
('ee2c4141-98ae-4fa8-8d1d-8d8ce59bbfdd', 'ZH 203');

-- ==========================================
-- 3. CLASSES
-- ==========================================
INSERT INTO classes (id, designation, short_name, class_type) VALUES 
('0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017', 'IFZK-2524', 'Semester');

-- ==========================================
-- 4. SUBJECTS
-- ==========================================
INSERT INTO subjects (id, code, name) VALUES 
('bbf23ed0-e35e-40c5-a7bd-6caaa569fcd3', 'M231', 'Datenschutz und Datensicherheit anwenden'),
('14a70bb2-1059-4fe3-9e53-d8b2fbeaabe1', 'M117', 'Informatik- und Netzinfrastruktur für ein kleines Unternehmen realisieren'),
('d7913b96-8959-4d6f-8fe4-ecf499b73dbc', 'M431', 'Aufträge im eigenen Berufsumfeld selbstständig abwickeln'),
('c0623338-ceaa-485a-88ee-a541298095a0', 'M162', 'Daten analysieren und modellieren'),
('0c010260-0190-460b-b146-d67bd0d65270', 'M122', 'Abläufe mit einer Scriptsprache automatisieren'),
('75f1d838-2259-40d5-ac3e-3bf702b20d30', 'M187', 'ICT-Arbeitsplatz mit Betriebssystem in Betrieb nehmen'),
('16d9b60f-e8b2-4c7b-874b-dacd5c94b5b9', 'M319', 'Applikationen entwerfen und implementieren'),
('b0ad1b27-cf4c-4156-84db-becfd2fe6444', 'M346', 'Cloud-Lösungen konzipieren und realisieren'),
('47f11c9b-82f4-4315-85fb-512c3fd8ad3d', 'M254', 'Geschäftsprozesse im eigenen Berufsumfeld beschreiben'),
('fde32150-c6e6-4c6c-84da-de3776557bc0', 'M241', 'Innovative ICT-Lösungen realisieren'),
('72a83a99-e2b6-4480-b600-6ddcf2b3fa4c', 'M245', 'Innovative ICT-Lösungen umsetzen'),
('a17ffc67-e50b-4da5-b7f1-7c22a3693ace', 'M306', 'IT-Projekt managen'),
('6c0d18df-bc0d-4148-a7f4-cf04ac104b46', 'MAT', 'Mathematik'),
('c9dacc33-bfad-452d-a841-fb77b74122ad', 'ENG', 'Englisch');

-- ==========================================
-- 5. USERS
-- ==========================================
INSERT INTO users (id, role_id, email, first_name, last_name, gender, birth_date, language, publish_details) VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'matteo.bosshard@wiss-edu.ch', 'Matteo', 'Bosshard', 'Männlich', '2007-02-27', 'de', false),
('6b50af82-b736-487c-9391-9e76a2f2abd5', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'drini.morina@wiss.ch', 'Drini', 'Morina', 'Männlich', NULL, 'de', true),
('cca4e715-bec8-4c85-92a6-dcd4bd66c4de', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'narcissa.knott@wiss.ch', 'Narcissa', 'Knott', 'Weiblich', NULL, 'de', true),
('48f5f19b-ea2d-43de-9532-8211da6709b1', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'ali.kazemi@wiss.ch', 'Ali', 'Kazemi', 'Männlich', NULL, 'de', true),
('aefe7149-7659-4c32-b846-2e4977cb4236', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'john.donaldson@wiss.ch', 'John', 'Donaldson', 'Männlich', NULL, 'de', true),
('3da98ba2-c026-44f4-8348-1b7bc89be387', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'emre.gursu@wiss.ch', 'Emre', 'Gürsu', 'Männlich', NULL, 'de', true);

-- ==========================================
-- 6. ENROLLMENTS
-- ==========================================
INSERT INTO class_enrollments (user_id, class_id) VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '0e2b8f63-3ba9-4963-af25-33a31a6431b8');

-- ==========================================
-- 7. EVENTS
-- ==========================================
INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES 
-- IT Modules
('77543c50-e110-437b-8ade-0d3b9c8210d3', 'bbf23ed0-e35e-40c5-a7bd-6caaa569fcd3', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S1-231'),
('9687c414-2c1b-4aaf-a955-1406c925d7cb', 'd7913b96-8959-4d6f-8fe4-ecf499b73dbc', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S1-431'),
('c09cb553-b309-4a83-8deb-ea6826374983', '75f1d838-2259-40d5-ac3e-3bf702b20d30', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S1-UEK-187'),
('8d9808fb-92f9-4668-9fe5-509bda7d4b3c', '47f11c9b-82f4-4315-85fb-512c3fd8ad3d', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-254'),
('59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', 'fde32150-c6e6-4c6c-84da-de3776557bc0', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-241'),
('7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', '72a83a99-e2b6-4480-b600-6ddcf2b3fa4c', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-245'),
('8cc371ae-62b6-4a40-b8a5-0f8b783273c0', 'a17ffc67-e50b-4da5-b7f1-7c22a3693ace', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-306'),
('6bf3b23b-db85-405b-8621-951032cc0d2d', 'b0ad1b27-cf4c-4156-84db-becfd2fe6444', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-346'),
-- Normal Classes
('f1111111-1111-4111-8111-111111111111', '6c0d18df-bc0d-4148-a7f4-cf04ac104b46', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-MAT'),
('f2222222-2222-4222-8222-222222222222', 'c9dacc33-bfad-452d-a841-fb77b74122ad', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-ENG');

-- ==========================================
-- 8. TIMETABLE SESSIONS 
-- Note: 10 sessions total. Each is 4 hours (Half-day) to equal 40 lessons total.
-- ==========================================
INSERT INTO timetable_sessions (id, event_id, room_id, lecturer_id, start_time, end_time, remarks) VALUES 
('bcda4619-8396-4ade-9303-2df3df48f693', '77543c50-e110-437b-8ade-0d3b9c8210d3', '22deceb1-38b6-42bc-81d7-26636cf4fb28', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-05-11 13:00:00+02', '2026-05-11 17:00:00+02', 'M231 Start'),
('7acd37e8-a1b4-4183-9fc9-004a2d132588', '9687c414-2c1b-4aaf-a955-1406c925d7cb', '5b58d559-6b17-48c9-a10a-60133aa51c7d', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-05-12 08:00:00+02', '2026-05-12 12:00:00+02', 'M431'),
('1de32d01-5e0b-4717-8c44-0b8605242f04', 'c09cb553-b309-4a83-8deb-ea6826374983', '5b58d559-6b17-48c9-a10a-60133aa51c7d', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-05-13 13:00:00+02', '2026-05-13 17:00:00+02', 'M187'),
('75ab1604-4747-4720-be82-17e7e37be192', '8d9808fb-92f9-4668-9fe5-509bda7d4b3c', '9bf6def9-c0b7-4206-9f84-410bbe4259c0', 'cca4e715-bec8-4c85-92a6-dcd4bd66c4de', '2026-05-14 08:00:00+02', '2026-05-14 12:00:00+02', 'M254'),
('fb1a76b9-753c-4632-b47d-862502d3a6ca', '59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', '9bf6def9-c0b7-4206-9f84-410bbe4259c0', '48f5f19b-ea2d-43de-9532-8211da6709b1', '2026-05-15 13:00:00+02', '2026-05-15 17:00:00+02', 'M241'),
('b36cff7f-08a4-4adc-9f6e-8f0bdca15e99', '7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', '3e499c74-911a-441c-9de0-77e9e49bc5e5', 'aefe7149-7659-4c32-b846-2e4977cb4236', '2026-05-18 08:00:00+02', '2026-05-18 12:00:00+02', 'M245'),
('53718e07-3491-4eda-b7ad-5125b83ede57', '8cc371ae-62b6-4a40-b8a5-0f8b783273c0', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-05-19 13:00:00+02', '2026-05-19 17:00:00+02', 'M306'),
('3f11e899-b7fb-4d6d-b103-bb0fa41bf1cd', '6bf3b23b-db85-405b-8621-951032cc0d2d', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-05-20 08:00:00+02', '2026-05-20 12:00:00+02', 'M346'),
('d9999999-b7fb-4d6d-b103-bb0fa41bf1cd', 'f1111111-1111-4111-8111-111111111111', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-05-21 13:00:00+02', '2026-05-21 17:00:00+02', 'MAT Normal'),
('d1010101-b7fb-4d6d-b103-bb0fa41bf1cd', 'f2222222-2222-4222-8222-222222222222', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-05-22 08:00:00+02', '2026-05-22 12:00:00+02', 'ENG Normal');

-- ==========================================
-- 9. EXAMS
-- ==========================================
-- IT Classes: 1 ZP (30%), 1 LB (70%) per module
INSERT INTO exams (id, event_id, description, weight_percentage) VALUES 
-- M231
(gen_random_uuid(), '77543c50-e110-437b-8ade-0d3b9c8210d3', 'ZP', 30.00), (gen_random_uuid(), '77543c50-e110-437b-8ade-0d3b9c8210d3', 'LB', 70.00),
-- M431
(gen_random_uuid(), '9687c414-2c1b-4aaf-a955-1406c925d7cb', 'ZP', 30.00), (gen_random_uuid(), '9687c414-2c1b-4aaf-a955-1406c925d7cb', 'LB', 70.00),
-- M187
(gen_random_uuid(), 'c09cb553-b309-4a83-8deb-ea6826374983', 'ZP', 30.00), (gen_random_uuid(), 'c09cb553-b309-4a83-8deb-ea6826374983', 'LB', 70.00),
-- M254
(gen_random_uuid(), '8d9808fb-92f9-4668-9fe5-509bda7d4b3c', 'ZP', 30.00), (gen_random_uuid(), '8d9808fb-92f9-4668-9fe5-509bda7d4b3c', 'LB', 70.00),
-- M241
(gen_random_uuid(), '59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', 'ZP', 30.00), (gen_random_uuid(), '59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', 'LB', 70.00),
-- M245
(gen_random_uuid(), '7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', 'ZP', 30.00), (gen_random_uuid(), '7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', 'LB', 70.00),
-- M306
(gen_random_uuid(), '8cc371ae-62b6-4a40-b8a5-0f8b783273c0', 'ZP', 30.00), (gen_random_uuid(), '8cc371ae-62b6-4a40-b8a5-0f8b783273c0', 'LB', 70.00),
-- M346
(gen_random_uuid(), '6bf3b23b-db85-405b-8621-951032cc0d2d', 'ZP', 30.00), (gen_random_uuid(), '6bf3b23b-db85-405b-8621-951032cc0d2d', 'LB', 70.00),

-- Normal Classes: 3 LBs per subject
-- Math (40/30/30)
(gen_random_uuid(), 'f1111111-1111-4111-8111-111111111111', 'LB', 40.00), 
(gen_random_uuid(), 'f1111111-1111-4111-8111-111111111111', 'LB', 30.00), 
(gen_random_uuid(), 'f1111111-1111-4111-8111-111111111111', 'LB', 30.00),
-- English (50/25/25)
(gen_random_uuid(), 'f2222222-2222-4222-8222-222222222222', 'LB', 50.00), 
(gen_random_uuid(), 'f2222222-2222-4222-8222-222222222222', 'LB', 25.00), 
(gen_random_uuid(), 'f2222222-2222-4222-8222-222222222222', 'LB', 25.00);

-- ==========================================
-- 10. EXAM RESULTS 
-- Note: Simplified mapping using subqueries to grab the exact exam IDs generated above
-- ==========================================
INSERT INTO exam_results (exam_id, student_id, grade)
SELECT id, 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.500 
FROM exams WHERE description = 'ZP' AND event_id = '77543c50-e110-437b-8ade-0d3b9c8210d3';

INSERT INTO exam_results (exam_id, student_id, grade)
SELECT id, 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.500 
FROM exams WHERE description = 'LB' AND event_id = '77543c50-e110-437b-8ade-0d3b9c8210d3';

INSERT INTO exam_results (exam_id, student_id, grade)
SELECT id, 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 6.000 
FROM exams WHERE description = 'LB' AND weight_percentage = 40.00 AND event_id = 'f1111111-1111-4111-8111-111111111111';

-- ==========================================
-- 11. DOCUMENTS
-- ==========================================
INSERT INTO documents (id, designation, file_path, document_type, target_user_id, modified_by, modified_at) VALUES 
('e5969079-1efd-45c4-8ecd-21b0805f6d7d', 'Anmeldung', '/documents/personal/anmeldung.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-07-09 14:12:00+02'),
('3fff3d30-30bb-4c64-b19e-1880091f2a51', 'Arztzeugnis', '/documents/personal/arztzeugnis.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-04-08 09:11:00+02'),
('9ca66a3a-0e46-4592-b518-9e2bc5136333', 'Daten Grundbildung', '/documents/general/daten_grundbildung.pdf', 'GENERAL', NULL, '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-08-15 15:57:00+02');

-- ==========================================
-- 12. CLASS SESSIONS 
-- ==========================================
INSERT INTO class_sessions (id, class_id, session_date, required_lessons) VALUES 
('c5111111-3ad9-49a7-aee3-9c160cb40b6f', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-11 13:00:00+02', 4.0),
('c5222222-46c2-480d-99fd-1ac89d5bf26d', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-12 08:00:00+02', 4.0),
('c5333333-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-13 13:00:00+02', 4.0),
('c5444444-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-14 08:00:00+02', 4.0),
('c5555555-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-15 13:00:00+02', 4.0),
('c5666666-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-18 08:00:00+02', 4.0),
('c5777777-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-19 13:00:00+02', 4.0),
('c5888888-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-20 08:00:00+02', 4.0),
('c5999999-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-21 13:00:00+02', 4.0),
('c5101010-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-22 08:00:00+02', 4.0);

-- ==========================================
-- 13. ATTENDANCE RECORDS 
-- ==========================================
INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES 
('c5111111-3ad9-49a7-aee3-9c160cb40b6f', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5222222-46c2-480d-99fd-1ac89d5bf26d', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5333333-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 0.0, 'Nicht teilgenommen entschuldigt'),
('c5444444-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5555555-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5666666-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5777777-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5888888-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('c5999999-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 0.0, 'Offen'),
('c5101010-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 0.0, 'Offen');

COMMIT;