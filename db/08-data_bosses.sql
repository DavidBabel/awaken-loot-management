 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active", "cdnImage")
VALUES
('Molten Core', 'MC', true, 'https://i.imgur.com/FKs4REK.jpg'),
('Onyxia Lair', 'Ony', true, 'https://i.imgur.com/qAm8tn5.jpg');
INSERT INTO "Donjons" ("name", "shortName", "active")
VALUES
('Blackwing Lair', 'BWL', false),
('Ahn‘Qiraj Temple', 'AQ40', false),
('Naxxramas', 'Naxx', false),
('Ahn‘Qiraj Ruins', 'AQ20', false),
('Zul‘Gurub', 'ZG', false);

INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage" )
VALUES
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/PPjBWCy.jpg');
INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='ZG'));
INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage" )
VALUES
(2,'Lucifron', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/3DEpshw.jpg'),
(3,'Magmadar', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/14R3H0O.jpg'),
(4,'Gehennas', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/7VIxHRl.jpg'),
(5,'Garr', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/ZHzPNmb.jpg'),
(7,'Shazzrah', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/OaKwnjX.jpg'),
(6,'Baron Geddon', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/n9hMWSq.jpg'),
(8,'Sulfuron Harbinger', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/rUbFvRR.jpg'),
(9,'Golemagg the Incinerator', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/Nix8hZT.jpg'),
(10,'Majordomo Executus', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/0ZJ2fES.jpg'),
(11,'Ragnaros', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/506Pznv.jpg'),
(1,'Onyxia', (SELECT id FROM "Donjons" WHERE "shortName"='Ony'), 'https://i.imgur.com/Ux2zdP0.jpg');
INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES
(2,'Razorgore', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(3,'Vaelastrasz', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(4,'Broodlord Lashlayer', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(5,'Firemaw', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(6,'Ebonroc', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(7,'Flamegor', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(8,'Chromaggus', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(9,'Nefarian', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
(2,'The Prophet Skeram', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(3,'Battleguard Sartura', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(4,'Fankriss the Unyielding', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(5,'Princess Huhuran', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(6,'Silithid Royalty', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(7,'Viscidus', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(8,'The Twin Emperors', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(9,'Ouro', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(10,'C‘thun', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
(2,'Anub‘Rekhan', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(3,'Grand Widow Faerlina', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(4,'Maexxna', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(5,'Noth the Plaguebringer', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(6,'Heigan the Unclean', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(7,'Loatheb', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(8,'Instructor Razuvious', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(9,'Gothik the Harvester', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(10,'The Four Horsemen', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(11,'Patchwerk', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(12,'Grobbulus', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(13,'Gluth', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(14,'Thaddius', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(15,'Sapphiron', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(16,'Kel‘Thuzad', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(2,'Kurinnaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(3,'General Rajaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(4,'Moam', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(5,'Buru the Gorger', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(6,'Ayamiss the Hunter', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(7,'Ossirian the Unscarred', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20'));
-- REDO ZG