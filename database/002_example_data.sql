BEGIN;

-- ==========================================
-- 1. ROLES
-- ==========================================
INSERT INTO roles (id, name) VALUES 
('5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'Lernende'),
('8b7bfb89-2aed-40fb-a623-79cf63691d56', 'Dozent'),
('90285527-fca9-4869-88d0-ba3610d6e8e9', 'Administrator')
ON CONFLICT (id) DO NOTHING;

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
('ee2c4141-98ae-4fa8-8d1d-8d8ce59bbfdd', 'ZH 203'),
(gen_random_uuid(), 'ZH 202'),
(gen_random_uuid(), 'ZH 411')
ON CONFLICT (name) DO NOTHING;

-- ==========================================
-- 3. USERS (Teachers & Students)
-- ==========================================

-- Teachers extracted from AttendenceRecords.md
INSERT INTO users (role_id, email, first_name, last_name, gender, publish_details) VALUES
((SELECT id FROM roles WHERE name = 'Dozent'), 'rolf.baumann@wiss.ch', 'Rolf', 'Baumann', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'pascal.peret@wiss.ch', 'Pascal', 'Péret', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'marc.bahnmueller@wiss.ch', 'Marc', 'Bahnmüller', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'alban.jasari@wiss.ch', 'Alban', 'Jasari', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'thomas.waelti@wiss.ch', 'Thomas', 'Waelti', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'linus.ziltener@wiss.ch', 'Linus', 'Ziltener', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'sport.modus@wiss.ch', 'Sport', 'Modus', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'narcisa.knott@wiss.ch', 'Narcisa', 'Knott', 'Female', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'stefan.jost@wiss.ch', 'Stefan', 'Jost', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'emre.guersu@wiss.ch', 'Emre', 'Gürsu', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'john.donaldson@wiss.ch', 'John', 'Donaldson', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'drini.morina@wiss.ch', 'Drini', 'Morina', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'aleksandar.travanov@wiss.ch', 'Aleksandar', 'Travanov', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'ali.kazemi@wiss.ch', 'Ali', 'Kazemi', 'Male', true),
((SELECT id FROM roles WHERE name = 'Dozent'), 'neera.mallick@wiss.ch', 'Neera', 'Mallick', 'Female', true)
ON CONFLICT (email) DO NOTHING;

-- Placeholder Students
WITH new_user AS (
INSERT INTO users (id, role_id, email, first_name, last_name, gender, birth_date, language, publish_details)
VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'matteo.bosshard@wiss-edu.ch', 'Matteo', 'Bosshard', 'Male', '2007-02-27', 'de', false),
(gen_random_uuid(), '5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'student@example.com', 'Max', 'Mustermann', 'Male', NULL, 'de', false)
ON CONFLICT (email) DO UPDATE SET first_name = EXCLUDED.first_name
RETURNING id
),
target_class AS (
SELECT id FROM classes WHERE designation = 'IFZK-2524-017' LIMIT 1
)
INSERT INTO class_enrollments (user_id, class_id)
SELECT new_user.id, target_class.id FROM new_user, target_class;

-- ==========================================
-- 4. DOCUMENTS
-- ==========================================
INSERT INTO documents (id, designation, file_path, document_type, target_user_id, modified_by, modified_at) VALUES 
('e5969079-1efd-45c4-8ecd-21b0805f6d7d', 'Anmeldung', '/documents/personal/anmeldung.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', (SELECT id FROM users WHERE email = 'emre.guersu@wiss.ch'), '2025-07-09 14:12:00+02'),
('3fff3d30-30bb-4c64-b19e-1880091f2a51', 'Arztzeugnis', '/documents/personal/arztzeugnis.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', (SELECT id FROM users WHERE email = 'drini.morina@wiss.ch'), '2026-04-08 09:11:00+02'),
('9ca66a3a-0e46-4592-b518-9e2bc5136333', 'Daten Grundbildung', '/documents/general/daten_grundbildung.pdf', 'GENERAL', NULL, (SELECT id FROM users WHERE email = 'emre.guersu@wiss.ch'), '2025-08-15 15:57:00+02')
ON CONFLICT (id) DO NOTHING;

COMMIT;
