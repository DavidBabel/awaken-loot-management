 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active", "cdnImage", "cdnIconImage")
VALUES
('Gruul Magtheridon', 'gm25', true, 'https://i.imgur.com/PgqM0T0.jpg', 'https://i.imgur.com/PgqM0T0.jpg');

INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage")
VALUES
(1,'Haut Roi Maulgar', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/taQaw2j.jpg'),
(2,'Gruul le Tue-dragon', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/gcLF8qu.jpg'),

(3,'Magtheridon', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/yvq678n.jpg');
