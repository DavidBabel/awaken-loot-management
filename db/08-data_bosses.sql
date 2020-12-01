 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active", "cdnImage", "cdnIconImage")
VALUES
('Molten Core', 'MC', true,        'https://i.imgur.com/FKs4REK.jpg', 'https://i.imgur.com/u8n2Xe9.png'),
('Onyxia Lair', 'Ony', true,       'https://i.imgur.com/qAm8tn5.jpg', 'https://i.imgur.com/8C2ngSe.png'),
('Blackwing Lair', 'BWL', true,    'https://i.imgur.com/WxgXIlO.jpg', 'https://i.imgur.com/eX3t188.png'),
('Ahn‘Qiraj Temple', 'AQ40', true, 'https://i.imgur.com/zxsE1Xe.jpg', 'https://i.imgur.com/sOyUNjB.png'),
('Naxxramas', 'Naxx', true,        'https://i.imgur.com/fm2yASp.jpg', 'https://i.imgur.com/VfxRbsm.png');
INSERT INTO "Donjons" ("name", "shortName", "active")
VALUES
('Ahn‘Qiraj Ruins', 'AQ20', false),
('Zul‘Gurub', 'ZG', false);

INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage" )
VALUES
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/PPjBWCy.jpg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/IYtebGa.jpg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/HhvJE6P.jpg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/K4w9lj2.jpg');
INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES
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

(1,'Onyxia', (SELECT id FROM "Donjons" WHERE "shortName"='Ony'), 'https://i.imgur.com/Ux2zdP0.jpg'),

(2,'Razorgore', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/NBARXNz.jpg'),
(3,'Vaelastrasz', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/6j7ZiWI.jpg'),
(4,'Broodlord Lashlayer', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/sVOCSBZ.jpg'),
(5,'Firemaw', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/qhpVr40.jpg'),
(6,'Ebonroc', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'),'https://i.imgur.com/90eRZ3w.jpg'),
(7,'Flamegor', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/YBrkObW.jpg'),
(8,'Chromaggus', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'),'https://i.imgur.com/YOBr2D3.jpg'),
(9,'Nefarian', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/WxgXIlO.jpg'),

(2,'The Prophet Skeram', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/J2C9cJM.jpg'),
(4,'Battleguard Sartura', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/qCE6QBQ.jpg'),
(5,'Fankriss the Unyielding', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/07EBkOh.jpg'),
(6,'Princess Huhuran', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/vcIPKgn.jpg'),
(3,'Silithid Royalty', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/UX2f2V9.jpg'),
(10,'Viscidus', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/25pnUSe.jpg'),
(7,'The Twin Emperors', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/1QK2elV.jpg'),
(9,'Ouro', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/dYTaWQM.jpg'),
(8,'C‘thun', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/o1odWVE.jpg'),

(2,'Anub‘Rekhan', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/uSONoYx.jpg'),
(3,'Grande veuve Faerlina', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/p2oYHDB.jpg'),
(4,'Maexxna', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/Ni9MCsE.jpg'),
(5,'Noth le Porte-peste', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/JiZvV0a.jpg'),
(6,'Heigan l‘Impur', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/5rFaEOa.jpg'),
(7,'Horreb', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/oTp67Az.jpg'),
(12,'Instructeur Razuvious', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/Yekbtki.jpg'),
(13,'Gothik le Moissonneur', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/EQMGuPS.jpg'),
(14,'Les quatre cavaliers', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/ClokqBE.jpg'),
(8,'Le Recousu', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/L3O0K6d.jpg'),
(9,'Grobbulus', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/jhNaT5P.jpg'),
(10,'Gluth', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/fQQF00D.jpg'),
(11,'Thaddius', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/luOh8Ny.jpg'),
(15,'Saphiron', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/BLg5fI2.jpg'),
(16,'Kel‘Thuzad', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/8dPF3mx.jpg');

INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES
(2,'Kurinnaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(3,'General Rajaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(4,'Moam', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(5,'Buru the Gorger', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(6,'Ayamiss the Hunter', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(7,'Ossirian the Unscarred', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20'));
-- REDO ZG