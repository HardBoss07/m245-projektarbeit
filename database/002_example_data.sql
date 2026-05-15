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
-- 3. USERS
-- ==========================================
INSERT INTO users (id, role_id, email, first_name, last_name, gender, birth_date, language, publish_details) VALUES 
('c73531eb-10e4-49d0-b033-b4dfb73f7777', '5d9c0ea2-8517-43bb-90c7-22321d04cb27', 'matteo.bosshard@wiss-edu.ch', 'Matteo', 'Bosshard', 'Männlich', '2007-02-27', 'de', false),
('6b50af82-b736-487c-9391-9e76a2f2abd5', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'drini.morina@wiss.ch', 'Drini', 'Morina', 'Männlich', NULL, 'de', true),
('cca4e715-bec8-4c85-92a6-dcd4bd66c4de', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'narcissa.knott@wiss.ch', 'Narcissa', 'Knott', 'Weiblich', NULL, 'de', true),
('48f5f19b-ea2d-43de-9532-8211da6709b1', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'ali.kazemi@wiss.ch', 'Ali', 'Kazemi', 'Männlich', NULL, 'de', true),
('aefe7149-7659-4c32-b846-2e4977cb4236', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'john.donaldson@wiss.ch', 'John', 'Donaldson', 'Männlich', NULL, 'de', true),
('3da98ba2-c026-44f4-8348-1b7bc89be387', '8b7bfb89-2aed-40fb-a623-79cf63691d56', 'emre.gursu@wiss.ch', 'Emre', 'Gürsu', 'Männlich', NULL, 'de', true);

-- ==========================================
-- 4. DOCUMENTS
-- ==========================================
INSERT INTO documents (id, designation, file_path, document_type, target_user_id, modified_by, modified_at) VALUES 
('e5969079-1efd-45c4-8ecd-21b0805f6d7d', 'Anmeldung', '/documents/personal/anmeldung.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-07-09 14:12:00+02'),
('3fff3d30-30bb-4c64-b19e-1880091f2a51', 'Arztzeugnis', '/documents/personal/arztzeugnis.pdf', 'PERSONAL', 'c73531eb-10e4-49d0-b033-b4dfb73f7777', '6b50af82-b736-487c-9391-9e76a2f2abd5', '2026-04-08 09:11:00+02'),
('9ca66a3a-0e46-4592-b518-9e2bc5136333', 'Daten Grundbildung', '/documents/general/daten_grundbildung.pdf', 'GENERAL', NULL, '3da98ba2-c026-44f4-8348-1b7bc89be387', '2025-08-15 15:57:00+02');

COMMIT;
