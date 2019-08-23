 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Classes" ("name", "color")
VALUES
('Prêtre',    '#FFFFFF'),
('Mage',      '#69CCF0'),
('Démoniste', '#9482C9'),
('Voleur',    '#FFF569'),
('Druide',    '#FF7D0A'),
('Chasseur',  '#ABD473'),
('Chaman',    '#0070DE'),
('Guerrier',  '#C79C6E'),
('Paladin',   '#F58CBA');

INSERT INTO
  "Slots" ( "name")
VALUES
  ('Main droite'),
  ('Main gauche'),
  ('Tête'),
  ('Cou'),
  ('Épaules'),
  ('Dos'),
  ('Torse'),
  ('Poignets'),
  ('Mains'),
  ('Ceinture'),
  ('Jambes'),
  ('Pieds'),
  ('Doigt'),
  ('Trinket'),
  ('Idole');


INSERT INTO "Players" ("name", "classId", "isAdmin", "password")
VALUES
('Devilhunter', 6, true, 'anything');
