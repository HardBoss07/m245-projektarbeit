BEGIN;

-- 1. ROLES
INSERT INTO roles (id, name) VALUES 
('5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'Lernende'),
('8b7bfb89-2aed-40fb-a623-79cf63691d56', 'Dozent'),
('90285527-fca9-4869-88d0-ba3610d6e8e9', 'Administrator');

-- 2. ROOMS
INSERT INTO rooms (id, name) VALUES 
('9bf6def9-c0b7-4206-9f84-410bbe4259c0', 'ZH 404'),
('3e499c74-911a-441c-9de0-77e9e49bc5e5', 'ZH 409'),
('986843c8-a8eb-4edb-9223-59bd63e7acbf', 'ZH 403'),
('851b52be-39a8-4d81-9a9a-10110e1e2769', 'ZH 402'),
('97e9ed34-e814-47ba-82cb-75b5424d7d22', 'ZH 401'),
('c3dc3890-d5d2-4090-9fe2-e9a3e4f4d8c1', 'ZH 404'),
('87f6aa43-a42a-473d-81b9-62d7c3dc6e6c', 'ZH 405'),
('59eafba4-7f64-479f-b6a4-8d314073039f', 'ZH 406'),
('acd8f321-3841-4b7e-b05a-9a9d63689191', 'ZH 407'),
('28310b1e-d92a-493d-917a-5b844ecb8a5d', 'ZH 408'),
('e6cf61fb-c616-4c35-8740-a65ac4b44b45', 'Extern Extern'),
('6a4ee233-ef2c-403d-86b5-0ba782223bcc', 'ZH 201'),
('22deceb1-38b6-42bc-81d7-26636cf4fb28', 'ZH 206'),
('5b58d559-6b17-48c9-a10a-60133aa51c7d', 'ZH 208'),
('1037783a-f959-4caa-9373-dc5c59e48a47', 'ZH 205'),
('b64fe99f-3406-4800-8941-cacdb6494422', 'ZH 402'),
('39b0b836-bf1f-4907-8a9a-38ac245558ef', 'online Online'),
('ee2c4141-98ae-4fa8-8d1d-8d8ce59bbfdd', 'ZH 203');

-- 3. CLASSES
INSERT INTO classes (id, designation) VALUES 
('0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017');

-- 4. SUBJECTS
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

-- 5. USERS
INSERT INTO users (id, role_id, email, first_name, last_name, gender, birth_date, language, publish_details) VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'matteo.bosshard@wiss-edu.ch', 'Matteo', 'Bosshard', 'Männlich', '2007-02-27', 'de', false),
('6b50af82-b736-487c-9391-9e76a2f2abd5', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'drini.morina@wiss.ch', 'Drini', 'Morina', 'Männlich', NULL, 'de', true),
('cca4e715-bec8-4c85-92a6-dcd4bd66c4de', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'narcissa.knott@wiss.ch', 'Narcissa', 'Knott', 'Weiblich', NULL, 'de', true),
('48f5f19b-ea2d-43de-9532-8211da6709b1', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'ali.kazemi@wiss.ch', 'Ali', 'Kazemi', 'Männlich', NULL, 'de', true),
('aefe7149-7659-4c32-b846-2e4977cb4236', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'john.donaldson@wiss.ch', 'John', 'Donaldson', 'Männlich', NULL, 'de', true),
('3da98ba2-c026-44f4-8348-1b7bc89be387', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'emre.gursu@wiss.ch', 'Emre', 'Gürsu', 'Männlich', NULL, 'de', true);

-- 6. ENROLLMENTS
INSERT INTO class_enrollments (user_id, class_id) VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '0e2b8f63-3ba9-4963-af25-33a31a6431b8');

-- 7. EVENTS
INSERT INTO events (id, subject_id, class_id, event_shortcut) VALUES 
('77543c50-e110-437b-8ade-0d3b9c8210d3', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a51', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '32325 / IFZK-2524-017-S1-231'),
('9687c414-2c1b-4aaf-a955-1406c925d7cb', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a53', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '32326 / IFZK-2524-017-S1-431'),
('c09cb553-b309-4a83-8deb-ea6826374983', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a56', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '32324 / IFZK-2524-017-S1-UEK-187'),
('8d9808fb-92f9-4668-9fe5-509bda7d4b3c', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a59', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'IFZK-2524-017-S2-254'),
('59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380011', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'M241-EVENT'),
('7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380012', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'M245-EVENT'),
('8cc371ae-62b6-4a40-b8a5-0f8b783273c0', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380014', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'M306-EVENT'),
('6bf3b23b-db85-405b-8621-951032cc0d2d', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380015', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'M346-EVENT'),
('c623987c-c86c-4876-a348-a61216926bd2', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380016', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'MAT-EVENT'),
('1872c87a-eeaf-42ba-91dd-8088f7f83444', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380017', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', 'ENG-EVENT');

-- 8. TIMETABLE SESSIONS
INSERT INTO timetable_sessions (id, event_id, room_id, lecturer_id, start_time, end_time, remarks) VALUES 
('bcda4619-8396-4ade-9303-2df3df48f693', '8d9808fb-92f9-4668-9fe5-509bda7d4b3c', '22deceb1-38b6-42bc-81d7-26636cf4fb28', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-05-11 13:00:00+02', '2026-05-11 16:30:00+02', 'Bestehender Geschäftsprozess.'),
('7acd37e8-a1b4-4183-9fc9-004a2d132588', '6bf3b23b-db85-405b-8621-951032cc0d2d', '5b58d559-6b17-48c9-a10a-60133aa51c7d', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-06-03 08:00:00+02', '2026-06-03 12:00:00+02', NULL),
('1de32d01-5e0b-4717-8c44-0b8605242f04', 'c09cb553-b309-4a83-8deb-ea6826374983', '5b58d559-6b17-48c9-a10a-60133aa51c7d', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-06-08 08:00:00+02', '2026-06-08 12:00:00+02', NULL),
('75ab1604-4747-4720-be82-17e7e37be192', '8cc371ae-62b6-4a40-b8a5-0f8b783273c0', '9bf6def9-c0b7-4206-9f84-410bbe4259c0', 'cca4e715-bec8-4c85-92a6-dcd4bd66c4de', '2026-06-09 08:00:00+02', '2026-06-09 12:00:00+02', NULL),
('fb1a76b9-753c-4632-b47d-862502d3a6ca', 'c623987c-c86c-4876-a348-a61216926bd2', '9bf6def9-c0b7-4206-9f84-410bbe4259c0', '48f5f19b-ea2d-43de-9532-8211da6709b1', '2026-06-12 11:00:00+02', '2026-06-12 13:00:00+02', NULL),
('b36cff7f-08a4-4adc-9f6e-8f0bdca15e99', '1872c87a-eeaf-42ba-91dd-8088f7f83444', '3e499c74-911a-441c-9de0-77e9e49bc5e5', 'aefe7149-7659-4c32-b846-2e4977cb4236', '2026-06-12 13:00:00+02', '2026-06-12 15:00:00+02', NULL),
('53718e07-3491-4eda-b7ad-5125b83ede57', '59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-06-16 08:00:00+02', '2026-06-16 12:00:00+02', NULL),
('3f11e899-b7fb-4d6d-b103-bb0fa41bf1cd', '7b5d498b-321e-46b6-b0b4-f5043ccf2dc9', '1037783a-f959-4caa-9373-dc5c59e48a47', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2026-06-18 08:00:00+02', '2026-06-18 12:00:00+02', NULL);

-- 9. EXAMS
INSERT INTO exams (id, event_id, description, weight_percentage) VALUES 
('37490ac0-08b6-458e-8b04-a3b43618e654', '9687c414-2c1b-4aaf-a955-1406c925d7cb', 'ZP', 30.00),
('8efcf9fb-5de3-4c1c-ab23-6f61f0053dcc', '9687c414-2c1b-4aaf-a955-1406c925d7cb', 'LB', 70.00),
('bdf213a2-013f-429b-902e-1fd7acc9880b', 'c09cb553-b309-4a83-8deb-ea6826374983', 'ZP', 30.00),
('aa6090de-24fe-468d-924f-932a2ef23316', 'c09cb553-b309-4a83-8deb-ea6826374983', 'LB', 70.00),
('a77e7767-ddbd-4e1e-b5fb-c7fdf36c3782', '59c2e4cb-e2d5-460d-a2e5-0fbddabf94aa', 'Written Exam', 50.00),
('1b570f38-f311-46d9-b1d6-ba4c1338f0e5', '8cc371ae-62b6-4a40-b8a5-0f8b783273c0', 'Project Defense', 100.00);

-- 10. EXAM RESULTS
INSERT INTO exam_results (id, exam_id, student_id, grade) VALUES 
('26799fd2-0413-46da-b8ff-f44a864431e0', '37490ac0-08b6-458e-8b04-a3b43618e654', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.500),
('10af1d04-a5b5-4b13-b1f5-08e4dde9479f', '8efcf9fb-5de3-4c1c-ab23-6f61f0053dcc', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.500),
('1b789c86-d5a0-4b34-8869-ee21f31498dd', 'bdf213a2-013f-429b-902e-1fd7acc9880b', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.900),
('8eec60e4-178b-4528-817c-d8127d368dba', 'aa6090de-24fe-468d-924f-932a2ef23316', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 6.000),
('dbcd8613-66bc-4a3e-879f-6d8dd2b5a8c6', 'a77e7767-ddbd-4e1e-b5fb-c7fdf36c3782', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.200),
('75624bb6-ab65-44c6-a0c6-463ea10ad38c', '1b570f38-f311-46d9-b1d6-ba4c1338f0e5', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 5.800);

-- 11. DOCUMENTS
INSERT INTO documents (id, designation, file_path, document_type, target_user_id, modified_by, modified_at) VALUES 
('e5969079-1efd-45c4-8ecd-21b0805f6d7d', 'Anmeldung', '/documents/personal/anmeldung.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-07-09 14:12:00+02'),
('3fff3d30-30bb-4c64-b19e-1880091f2a51', 'Arztzeugnis', '/documents/personal/arztzeugnis.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-04-08 09:11:00+02'),
('9ca66a3a-0e46-4592-b518-9e2bc5136333', 'Daten Grundbildung', '/documents/general/daten_grundbildung.pdf', 'GENERAL', NULL, '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-08-15 15:57:00+02');

-- 12. CLASS SESSIONS
INSERT INTO class_sessions (id, class_id, session_date, required_lessons) VALUES 
('5eff3cd0-3ad9-49a7-aee3-9c160cb40b6f', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-05-11 13:00:00+02', 4.0),
('d820e283-46c2-480d-99fd-1ac89d5bf26d', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-06-03 08:00:00+02', 4.0),
('7eb074d3-5959-4b85-bd27-bc693c375b90', '0e2b8f63-3ba9-4963-af25-33a31a6431b8', '2026-06-09 08:00:00+02', 4.0);

-- 13. ATTENDANCE RECORDS
INSERT INTO attendance_records (session_id, student_id, attended_lessons, status) VALUES 
('5eff3cd0-3ad9-49a7-aee3-9c160cb40b6f', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('d820e283-46c2-480d-99fd-1ac89d5bf26d', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 4.0, 'Teilgenommen'),
('7eb074d3-5959-4b85-bd27-bc693c375b90', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', 0.0, 'Offen');

COMMIT;