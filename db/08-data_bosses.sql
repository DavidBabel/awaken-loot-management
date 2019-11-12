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

INSERT INTO "Bosses" ("name", "donjonId", "cdnImage" )
VALUES
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/PPjBWCy.jpg');
INSERT INTO "Bosses" ("name", "donjonId" )
VALUES
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='ZG'));
INSERT INTO "Bosses" ("name", "donjonId", "cdnImage" )
VALUES
('Lucifron', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/3DEpshw.jpg'),
('Magmadar', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/14R3H0O.jpg'),
('Gehennas', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/7VIxHRl.jpg'),
('Garr', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/ZHzPNmb.jpg'),
('Shazzrah', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/OaKwnjX.jpg'),
('Baron Geddon', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/n9hMWSq.jpg'),
('Sulfuron Harbinger', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/rUbFvRR.jpg'),
('Golemagg the Incinerator', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/Nix8hZT.jpg'),
('Majordomo Executus', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/0ZJ2fES.jpg'),
('Ragnaros', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/506Pznv.jpg'),
('Onyxia', (SELECT id FROM "Donjons" WHERE "shortName"='Ony'), 'https://i.imgur.com/Ux2zdP0.jpg');
INSERT INTO "Bosses" ("name", "donjonId" )
VALUES
('Razorgore the Untamed', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Vaelastrasz the Corrupt', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Broodlord Lashlayer', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Firemaw', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Ebonroc', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Flamegor', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Chromaggus', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Nefarian', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('The Prophet Skeram', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Battleguard Sartura', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Fankriss the Unyielding', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Princess Huhuran', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Silithid Royalty', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Viscidus', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('The Twin Emperors', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Ouro', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('C‘thun', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Anub‘Rekhan', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Grand Widow Faerlina', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Maexxna', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Noth the Plaguebringer', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Heigan the Unclean', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Loatheb', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Instructor Razuvious', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Gothik the Harvester', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('The Four Horsemen', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Patchwerk', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Grobbulus', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Gluth', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Thaddius', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Sapphiron', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Kel‘Thuzad', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Kurinnaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('General Rajaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Moam', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Buru the Gorger', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Ayamiss the Hunter', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Ossirian the Unscarred', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20'));
-- REDO ZG