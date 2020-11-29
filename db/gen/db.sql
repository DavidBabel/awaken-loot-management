 -- SAFE BEGIN FOR CONCAT
DROP SCHEMA public cascade;
CREATE SCHEMA public;

SET search_path TO public;

CREATE TABLE "Classes" (
  "id" SERIAL PRIMARY KEY,
  "color" varchar,
  "name" varchar
);
comment on table "Classes" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Classes" ("id");
-- CREATE RULE classes_del_protect AS ON DELETE TO "Classes" DO INSTEAD NOTHING;


CREATE TABLE "Players" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "classId" int NOT NULL,
  "role" varchar DEFAULT 'player',
  "password" varchar,
  "active" boolean DEFAULT true,
  "inRoster" boolean DEFAULT false,
  "specialisation" varchar,
  "rerollOf" varchar
);
comment on table "Players" is E'@omit delete';
CREATE UNIQUE INDEX ON "Players" ("id");


CREATE TABLE "Merit" (
  "id" SERIAL PRIMARY KEY,
  "categorie" varchar,
  "name" varchar,
  "comment" varchar DEFAULT '',
  "value" int,
  "active" boolean DEFAULT true,
  "classId" int DEFAULT NULL,
  "order" int,
  "delay" int
);
comment on table "Merit" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Merit" ("id");


CREATE TABLE "PlayerMerit" (
  "id" SERIAL PRIMARY KEY,
  "meritId" int NOT NULL,
  "playerId" int NOT NULL,
  "date" varchar,
  "validated" boolean DEFAULT false
);
-- comment on table "PlayerMerit" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerMerit" ("id");


CREATE TABLE "Loots" (
  "id" SERIAL PRIMARY KEY,
  "playerId" int NOT NULL,
  "itemId" int NOT NULL,
  "raidId" int NOT NULL,
  "bossId" int,
  "active" boolean DEFAULT true,
  "lastActionBy" varchar,
  "lastActionType" varchar,
  "lastActionDate" varchar
);
comment on table "Loots" is E'@omit delete';
CREATE UNIQUE INDEX ON "Loots" ("id");


CREATE TABLE "Items" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "wowheadId" int,
  "classId" int,
  "lootLevel" int
);
comment on table "Items" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");


CREATE TABLE "ClassItem" (
  "id" SERIAL PRIMARY KEY,
  "classId" int NOT NULL,
  "itemId" int NOT NULL,
  "prio" boolean NOT NULL,
  "comment" varchar
);
comment on table "ClassItem" is E'@omit delete';
CREATE UNIQUE INDEX ON "ClassItem" ("id");


CREATE TABLE "BossItem" (
  "id" SERIAL PRIMARY KEY,
  "itemId" int NOT NULL,
  "bossId" int NOT NULL
);
comment on table "BossItem" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "BossItem" ("id");


CREATE TABLE "Bosses" (
  "id" SERIAL PRIMARY KEY,
  "order" int NOT NULL,
  "donjonId" int NOT NULL,
  "name" varchar,
  "cdnImage" varchar
);
comment on table "Bosses" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Bosses" ("id");


CREATE TABLE "Donjons" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "shortName" varchar,
  "active" boolean DEFAULT false,
  "cdnImage" varchar
);
comment on table "Donjons" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Donjons" ("id");


CREATE TABLE "Raids" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "donjonId" int NOT NULL,
  "date" varchar,
  "linkBetweenRaids" varchar,
  "active" boolean DEFAULT true
);
comment on table "Raids" is E'@omit delete';
CREATE UNIQUE INDEX ON "Raids" ("id");


CREATE TABLE "RaidPlayers" (
    "id" SERIAL PRIMARY KEY,
    "playerId" int NOT NULL,
    "raidId" int NOT NULL,
    "passed" boolean DEFAULT false, -- deprecated, do not use anymore
    "status" int
  );
-- comment on table "RaidPlayers" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");


ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Raids" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "PlayerMerit" ADD FOREIGN KEY ("meritId") REFERENCES "Merit" ("id");
ALTER TABLE "PlayerMerit" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Merit" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Items" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id"); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Classes" ("name", "color")
VALUES
('Prêtre',        '#FFFFFF'), -- 1
('Mage',          '#69CCF0'), -- 2
('Démoniste',     '#9482C9'), -- 3
('Voleur',        '#FFF569'), -- 4
('Druide',        '#FF7D0A'), -- 5
('Chasseur',      '#ABD473'), -- 6
('Chaman',        '#0070DE'), -- 7
('Guerrier Tank', '#C79C6E'), -- 8
('Guerrier DPS',  '#C41F3B'), -- 9
('Paladin',       '#F58CBA'), -- 10
('Prêtre Ombre',  '#FFFFFF'), -- 11
('Druide Feral',  '#FF7D0A'), -- 12
('Chaman Amélio', '#0070DE')  -- 13
;

-- INSERT INTO
--   "Slots" ( "name")
-- VALUES
--   ('Main droite'),
--   ('Main gauche'),
--   ('Tête'),
--   ('Cou'),
--   ('Épaules'),
--   ('Dos'),
--   ('Torse'),
--   ('Poignets'),
--   ('Mains'),
--   ('Ceinture'),
--   ('Jambes'),
--   ('Pieds'),
--   ('Doigt'),
--   ('Trinket'),
--   ('Idole');


 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active", "cdnImage")
VALUES
('Molten Core', 'MC', true, 'https://i.imgur.com/FKs4REK.jpg'),
('Onyxia Lair', 'Ony', true, 'https://i.imgur.com/qAm8tn5.jpg'),
('Blackwing Lair', 'BWL', true, 'https://i.imgur.com/WxgXIlO.jpg'),
('Ahn‘Qiraj Temple', 'AQ40', true, 'https://i.imgur.com/xcxosZp.jpg'),
('Naxxramas', 'Naxx', true, 'https://i.imgur.com/Q3eYYuY.jpg');
INSERT INTO "Donjons" ("name", "shortName", "active")
VALUES
('Ahn‘Qiraj Ruins', 'AQ20', false),
('Zul‘Gurub', 'ZG', false);

INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage" )
VALUES
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC'), 'https://i.imgur.com/PPjBWCy.jpg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL'), 'https://i.imgur.com/IYtebGa.jpg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/qUIqnbw.jpeg'),
(1, 'Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'), 'https://i.imgur.com/XTZRDLJ.jpg');
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

(2,'The Prophet Skeram', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/gSwLuy2.jpeg'),
(4,'Battleguard Sartura', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/se6Qgrb.jpeg'),
(5,'Fankriss the Unyielding', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/gM8ib24.jpeg'),
(6,'Princess Huhuran', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/vHRzlkt.jpeg'),
(3,'Silithid Royalty', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/2knCdlO.jpeg'),
(10,'Viscidus', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/j1KT7Gz.jpeg'),
(7,'The Twin Emperors', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/JGfdjNS.jpeg'),
(9,'Ouro', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/sdZ0S62.jpeg'),
(8,'C‘thun', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40'), 'https://i.imgur.com/EI9VfWi.jpeg');

INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES

(2,'Anub‘Rekhan', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(3,'Grande veuve Faerlina', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(4,'Maexxna', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(5,'Noth le Porte-peste', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(6,'Heigan l‘Impur', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(7,'Horreb', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(8,'Instructeur Razuvious', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(9,'Gothik le Moissonneur', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(10,'Les quatre cavaliers', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(11,'Le Recousu', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(12,'Grobbulus', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(13,'Gluth', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(14,'Thaddius', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(15,'Saphiron', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
(16,'Kel‘Thuzad', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx'));

INSERT INTO "Bosses" ("order", "name", "donjonId" )
VALUES
(2,'Kurinnaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(3,'General Rajaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(4,'Moam', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(5,'Buru the Gorger', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(6,'Ayamiss the Hunter', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
(7,'Ossirian the Unscarred', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20'));
-- REDO ZG -- SAFE BEGIN FOR CONCAT


-- ===========================
-- ======== MC ===============
-- ===========================

-- SELECT 1 AS "Trash";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinture de traqueur de géant',16851,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Brassards de traqueur de géant',16850,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Protège-bras de prophétie',16819,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Ceinturon de prophétie',16817,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Brassards Rageterre',16840,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Ceinture Rageterre',16838,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Brassards cénariens',16830,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Ceinture cénarienne',16828,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Ceinture de puissance',16864,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Brassards de puissance',16861,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Ceinture d‘arcaniste',16802,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Manchettes d‘arcaniste',16799,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Brassards de Gangrecoeur',16804,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Ceinture de Gangrecoeur',16806,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Brassards judiciaires',16857,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Ceinture judiciaire',16858,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Bracelets du tueur de la nuit',16825,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Ceinture du tueur de la nuit',16827,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2);


INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16851)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16850)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16819)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16817)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16840)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16838)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16830)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16828)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16864)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16861)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16802)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16799)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16804)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16806)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16857)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16858)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16825)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16827));

-- SELECT 1 AS "Lucifron";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gantelets de puissance',16863,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Gants de Gangrecoeur',16805,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Bottes cénariennes',16829,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Collier d‘illumination',17109,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Bottes d‘arcaniste',16800,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Bottes judiciaires',16859,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Bottes Rageterre',16837,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16863)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16805)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16829)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=17109)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16800)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16859)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16837)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18861));

-- SELECT 1 AS "Magmadar";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Trembleterre',17073,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières cénariennes',16835,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Pantalon de Gangrecoeur',16810,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Pantalon de prophétie',16814,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Marque du Frappeur',17069,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières d‘arcaniste',16796,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Jambières de puissance',16867,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Médaillon de Puissance inébranlable',17065,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Pantalon du tueur de la nuit',16822,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Jambières de traqueur de géant',16847,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Griffe droite d‘Eskhandar',18203,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières judiciaires',16855,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières Rageterre',16843,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Solerets du Marcheflammes',19144,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17073)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16835)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16810)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16814)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17069)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16796)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16867)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17065)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16847)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18203)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16855)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16843)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18829)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19144));

-- SELECT 1 AS "Gehennas";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants de prophétie',16812,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Bottes de traqueur de géant',16849,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Gants du tueur de la nuit',16826,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Sandales de puissance',16862,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Gantelets judiciaires',16860,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Gantelets Rageterre',16839,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''), 3);
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16812)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16849)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16826)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16862)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16860)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16839)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Garr";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Marteau d‘Aurastone',17105,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Casque cénarien',16834,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Casque de traqueur de géant',16846,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Déchireur de Gutgore',17071,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Disque Drillborer',17066,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Lame de brutalité',18832,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Casque de puissance',16866,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Collerette de prophétie',16813,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Cornes de Gangrecoeur',16808,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Couronne d‘arcaniste',16795,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Couvre-chef du tueur de la nuit',16821,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Heaume judiciaire',16854,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Casque Rageterre',16842,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17105)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16834)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16846)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17071)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17066)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18832)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16866)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16813)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16808)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16795)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16854)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16842)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18829));

-- SELECT 1 AS "Shazzrah";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants cénariens',16831,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Gants d‘arcaniste',16801,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Gants de traqueur de géant',16852,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Bottes de prophétie',16811,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Bottes du tueur de la nuit',16824,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Mules de Gangrecoeur',16803,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2);
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16831)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16801)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16852)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16811)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16824)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16803)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Baron Geddon";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Mantelet d‘arcaniste',16797,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Spallières cénariennes',16836,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Protège-épaules de Gangrecoeur',16807,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Sceau de l‘archimagus',17110,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Spallières judiciaires',16856,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Epaulettes Rageterre',16844,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16797)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16836)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16807)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=17110)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16856)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16844)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19143));

-- SELECT 1 AS "Sulfuron Harbinger";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Frappe-ténèbres',17074,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Epaulettes de traqueur de géant',16848,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Espauliers de puissance',16868,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Mantelet de prophétie',16816,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Protège-épaules du tueur de la nuit',16823,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2);
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17074)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16848)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16868)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16816)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16823)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18878));

-- SELECT 1 AS "Golemagg the Incinerator";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Bâton de domination',18842,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Magelame de Chante-azur',17103,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Robe d‘arcaniste',16798,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Cuirasse de traqueur de géant',16845,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Plastron du tueur de la nuit',16820,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Robe de Gangrecoeur',16809,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Robe de prophétie',16815,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Cuirasse de puissance',16865,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Lance-grenaille explosif',17072,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Lingot de sulfuron',17203,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Corselet judiciaire',16853,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Habit cénarien',16833,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Habit Rageterre',16841,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18842)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17103)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16798)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16845)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16820)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16809)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16815)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16865)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17072)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17203)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16853)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16833)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16841)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18820));

-- SELECT 1 AS "Majordomo Executus";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau de cautérisation',19140,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Drague-lave de Finkle',18803,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Epaulières de garde du feu',19139,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Gants de la flamme hypnotique',18808,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Grèves du Coeur du Magma',18806,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=19140)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18811)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18805)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18803)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18809)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=19139)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18703)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18808)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18812)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18806)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18646)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18810));

-- SELECT 1 AS "Ragnaros";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Jambières de Stormrage',16901,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Pantalon de Vent du néant',16915,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Lame de la perdition',18816,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau de Sulfuras',19138,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières de traqueur de dragon',16938,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Couronne de destruction',18817,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Pantalon Rougecroc',16909,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Anneau de Précisia',17063,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape sang-de-dragon',17107,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Essence de la Flamme pure',18815,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières de Némésis',16930,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Jambières de transcendance',16922,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Jambières de courroux',16962,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Cape du Voile de brume',17102,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Ceinturon d‘assaut',19137,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Collier du Seigneur du Feu',18814,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières du jugement',16954,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Arrache-moelle',17104,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Fragment de la Flamme',17082,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Fléau de Bonereaver',17076,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières des dix tempêtes',16946,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
-- manually added
('Défenseur de Malistar',17106,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Oeil de Sulfuras',17204,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16901)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16915)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18816)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19138)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16938)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18817)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16909)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17063)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17107)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18815)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16930)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16922)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16962)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17102)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19137)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18814)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16954)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17104)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17082)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17076)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16946)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17106));

-- SELECT 1 AS "Onyxia";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Tête d‘Onyxia',18422,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Tendon de dragon noir adulte',18705,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 1),
('Ancien Grimoire de Cornerstone',17067,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Anneau de lien',18813,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Couvre-chef de Stormrage',16900,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Crâne de Némésis',16929,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Casque de traqueur de dragon',16939,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Couronne de Vent du néant',16914,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Drapé de Saphiron',17078,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Auréole de transcendance',16921,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Cagoule Rougecroc',16908,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Heaume de courroux',16963,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Collier d‘Eskhandar',18205,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Couronne du jugement',16955,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Casque des dix tempêtes',16947,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Eclat de l‘Ecaille',17064,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Porte-mort',17068,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Sac à dos en cuir d‘Onyxia',17966,(SELECT id FROM "Classes" WHERE "name"=''), 1),
-- ('Tête d‘Onyxia',18423,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Vis‘kag le Saigneur',17075,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18422)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18705)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17067)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18813)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16900)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16929)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16939)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16914)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17078)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16921)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16908)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16963)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18205)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16955)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16947)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17064)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17068)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18423)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17075)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17966));


-- added after crawl
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Casque du donneur de vie',18870,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Liens du Cherchevent',18564,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Liens du Cherchevent',18563,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18564)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18563)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17204)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18875));


-- ===========================
-- ======== BWL ==============
-- ===========================


-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Maillet draconique',19358,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Cape de puissance draconique',19436,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes de la pensée pure',19437,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Vengeresse draconique',19354,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Bottes de blizzard de Ringo',19438,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Pourpoint d‘ombre entrelacé',19439,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Trancheuse du destin',19362,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Récolteur d‘essence',19435,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau de sombre domination',19434,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19358)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19436)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19437)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19354)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19438)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19439)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19362)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19435)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19434));



-- SELECT 1 AS "Razorgore";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Manchettes de transcendance',16926,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Brassards de traqueur de dragon',16935,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Brassards Rougecroc',16911,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Bracelets de courroux',16959,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Gants de l‘évolution rapide',19369,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Gemme imprégnée d‘arcanes',19336,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 1),
('Le Livre noir',19337,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Manchettes de Vent du néant',16918,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Mantelet de la cabale de l‘Aile noire',19370,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Brassards de Némésis',16934,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Brassards de Stormrage',16904,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Manchettes du jugement',16951,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Brise-échine',19335,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Brassards des dix tempêtes',16943,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('La lame indomptée',19334,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16926)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16935)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16911)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16959)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19369)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19336)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19337)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16918)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19370)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16934)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16904)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16951)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19335)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16943)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19334));


-- SELECT 1 AS "Vaelastrasz";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Baudrier de courroux',16960,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Ceinture de Stormrage',16903,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Ceinture Rougecroc',16910,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Ceinture de Némésis',16933,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Ceinture de Vent du néant',16818,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Pendentif du dragon déchu',19371,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gemme de vivacité d‘esprit',19339,(SELECT id FROM "Classes" WHERE "name"='Mage'), 4),
('Ceinture de transcendance',16925,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Ceinture de traqueur de dragon',16936,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Heaume de la rage infinie',19372,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Rune de transformation',19340,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Lame croc-de-dragon',19346,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Ceinture du jugement',16952,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Ceinture des dix tempêtes',16944,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Protecteur en écailles de dragon rouge',19348,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16960)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16903)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16910)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16933)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16818)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19371)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19339)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16925)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16936)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19372)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19340)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19346)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16952)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16944)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19348));


-- SELECT 1 AS "Broodlord Lashlayer";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Bottes de Vent du néant',16912,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Espauliers de rejeton noir',19373,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Sandales de courroux',16965,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Bottes de Némésis',16927,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Bottes de transcendance',16919,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Bottes de traqueur de dragon',16941,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Totem venimeux',19342,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Bottes Rougecroc',16906,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Gemme donneuse de vie',19341,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 4),
('Sandales du jugement',16957,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Bottes de Stormrage',16898,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Brassards de précision des arcanes',19374,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Frappe-coeur',19350,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Maladath, lame runique du Vol noir',19351,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bottes des dix tempêtes',16949,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16912)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19373)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16965)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16927)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16919)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16941)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19342)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16906)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19341)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16957)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16898)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19374)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19350)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19351)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16949));


-- SELECT 1 AS "Firemaw";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Robe de cendre noire',19399,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Etreinte Gueule-de-feu',19400,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Griffe du drake noir',19365,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Cape gueule-de-feu',19398,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Parchemin de lumière aveuglante',19343,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Cuissards du croisé déchu',19402,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Cristal d‘alignement sur la nature',19344,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Cuissards rivetés de Primaliste',19401,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets des dix tempêtes',16948,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19399)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19400)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19365)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19398)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19343)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19402)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19344)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19401)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));

-- SELECT 1 AS "Ebonroc";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Egide de préservation',19345,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Anneau de Concentration forcée',19403,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gants de la flamme d‘ébène',19407,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Talisman croc-de-drake',19406,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Rempart béni de Malfurion',19405,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Canon à main Souffle-de-dragon',19368,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 0),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 0),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 0),
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 0),
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 0),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0);
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 0),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 0),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19345)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19403)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19407)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19406)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19405)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19368)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));


-- SELECT 1 AS "Flamegor";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Voile de la pensée pure',19430,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cercle de la force appliquée',19432,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Jambières en tisse-braise',19433,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Scarabée d‘obstruction de Styleen',19431,(SELECT id FROM "Classes" WHERE "name"=''), 4),
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Toucher du dragon',19367,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Prophète de malheur',19357,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 0),
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 0),
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 0),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 0),
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 0),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 0),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 0),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets des dix tempêtes',16948,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19430)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19432)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19433)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19431)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19367)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19357)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));


-- SELECT 1 AS "Chromaggus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Mantelet de Vent du néant',16917,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Protège-épaules en cuir de dragon tendu',19389,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Spallières de traqueur de dragon',16937,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Torsade d‘Angelista',19388,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Espauliers de courroux',16961,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Bottes chromatiques',19387,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Espauliers de Stormrage',16902,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Espauliers de transcendance',16924,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Gants en cuir de dragon tendu',19390,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Spallières de Némésis',16932,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Spallières Rougecroc',16832,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Geta chatoyantes',19391,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape brochée d‘élémentium',19386,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Ceinturon du croisé déchu',19392,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières surpuissantes',19385,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Spallières du jugement',16953,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Epée trempée chromatiquement',19352,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Griffe de Chromaggus',19347,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Sangle rivetée de Primaliste',19393,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Ashjre‘thul, arbalète de châtiment',19361,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bouclier en élémentium renforcé',19349,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Epaulettes des dix tempêtes',16945,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16917)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19389)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16937)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19388)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16961)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19387)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16902)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16924)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19390)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16932)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16832)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19391)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19386)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19392)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19385)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16953)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19352)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19347)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19393)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19361)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19349)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16945));


-- SELECT 1 AS "Nefarian";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Tête de Nefarian',19002,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cape du seigneur des couvées',19378,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bottes de la Flamme d‘ombre',19381,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Chaîne de Therazane',19380,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuirasse de traqueur de dragon',16942,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Robe de Vent du néant',16916,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Bague de rétorsion d‘Archimtiros',19376,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuirasse de courroux',16966,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Plastron Rougecroc',16905,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Robe de Némésis',16931,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Robe de transcendance',16923,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Anneau d‘élémentium pur',19382,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Larme de Neltharion',19379,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Robe de Stormrage',16897,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Mish‘undare, coiffure du flagelleur mental',19375,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Talisman de perfidie de Prestor',19377,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bâton de la Flamme d‘ombre',19356,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cuirasse du jugement',16958,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Ashkandi, Grande épée de la Confrérie',19364,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Crul‘shorukh, Trancheuse du chaos',19363,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Lok‘amir il Romathis',19360,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cuirasse des dix tempêtes',16950,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19002)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19378)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19381)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19380)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16942)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16916)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19376)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16966)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16905)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16931)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16923)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19382)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19379)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16897)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19375)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19377)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19356)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16958)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19364)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19363)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19360)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16950));

-- SELECT 1 AS "=======================";

-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau du chaos de Rytssin',21836,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Atours d‘ascension royale',21838,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gants de l‘immortel',21888,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Marteau de guerre d‘anubisath',21837,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Neretzek, le Buveur de sang',21856,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Fragment de l‘étoile tombée',21891,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gants de la prophétie rachetée',21889,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Gants du prophète déchu',21890,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Plans : Lame feuille-de-saule',22389,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21836)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21838)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21888)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21837)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21856)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21891)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21889)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21890));



-- SELECT 1 AS "The Prophet Skeram";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Bottes de la volonté inexorable',21706,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Garde-poignets en écailles de hanneton',21708,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières d‘immersion',21698,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape de concentré de haine',21701,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Epaulières du barrage',21699,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Plastron d‘annihilation',21814,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Anneau de pensée foisonnante',21707,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Pendentif du gardien qiraji',21700,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Amulette de vile sauvegarde',21702,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes de la prophétie rédemptrice',21704,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bâton des prophètes qiraji',21128,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Marteau de Ji‘zhi',21703,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Bottes du prophète déchu',21705,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21706)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21708)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21698)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21701)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21699)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21814)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21707)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21700)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21702)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21704)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21128)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21703)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21705));

-- SELECT 1 AS "Battleguard Sartura";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinture qiraji en peau épaisse',21675,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Robe du garde de guerre',21671,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes recomposées',21648,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Collier de pureté',21678,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gants de coercition',21672,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Casque des lianes rampantes',21669,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets de détermination inébranlable',21674,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Jambières de l‘essaim purulent',21676,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Insigne de garde-essaim',21670,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Pouvoir de Sartura',21666,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Cuissards de lumière flamboyante',21667,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Griffe de silithide',21673,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Jambières de fureur qiraji en écailles',21668,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 5);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21675)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21671)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21648)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21678)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21672)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21669)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21674)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21676)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21670)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21666)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21667)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21673)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21668)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "Fankriss the Unyielding";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Robe du saint gardien',21663,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Corselet en carapace de silithide',21652,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes de tunnelière de la ruche',21645,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cape des secrets inexprimables',21627,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Collier barbelé',21664,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Espauliers de l‘Implacable',21639,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Fétiche du ravageur des sables',21647,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Mantelet de vengeance cruelle',21665,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Jambières de ravageur des sables en écailles',21651,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Guisarme du ravageur des sables',21635,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Libram de grâce',22402,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ancien éventreur qiraji',21650,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Totem de vie',22396,(SELECT id FROM "Classes" WHERE "name"=''), 4);
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21663)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21652)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21645)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21627)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21664)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21639)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21647)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21665)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21651)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21635)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=22402)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21650)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=22396)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "Princess Huhuran";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Manchettes de domination qiraji',20932,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Manchettes de commandement qiraji',20928,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Anneau du martyr',21620,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Gantelets en peau de guêpe',21617,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Garde-poignets de profanateur de ruche',21618,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Cape de la Ruche d‘or',21621,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gants du messie',21619,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Aiguillon d‘Huhuran',21616,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=20932)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=20928)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21620)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21617)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21618)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21621)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21619)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21616)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "Silithid Royalty";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gilet d‘exécution rapide',21680,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Anneau du dévoré',21681,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Scarabée pétrifié',21685,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Baguette de noblesse qiraji',21603,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de la puissance phrénique',21686,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau de ténèbres d‘Ukko',21687,(SELECT id FROM "Classes" WHERE "name"=''), 3),
-- ('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets couverts de bile',21682,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Mantelet de la croisade du désert',21683,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de la fureur du désert',21684,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes du héros déchu',21688,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Charme d‘Angelista',21690,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gants d‘Ebru',21689,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Gantelets éclaboussés de vase',21691,(SELECT id FROM "Classes" WHERE "name"=''), 3);
-- ('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21680)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21681)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21685)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21603)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21686)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21687)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21682)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21683)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21684)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21688)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21690)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21689)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21691));
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));


-- SELECT 1 AS "Viscidus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Manchettes de commandement qiraji',20928,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Manchettes de domination qiraji',20932,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets de Kalimdor',21624,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Anneau de fureur qiraji',21677,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Idole de santé',22399,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Fémur de silithide aiguisé',21622,(SELECT id FROM "Classes" WHERE "name"=''), 5),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jambières couvertes de vase',21626,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Broche scarabée',21625,(SELECT id FROM "Classes" WHERE "name"=''), 4);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=20928)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=20932)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21624)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21677)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=22399)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21622)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21626)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21625)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "The Twin Emperors";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Diadème de Vek‘lor',20930,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Bottes de l‘épiphanie',21600,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gants de dévastation de Vek‘lor',21599,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Ceinture royale qiraji',21598,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Brassards d‘exécution quiraji',21602,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Sceptre royal de Vek‘lor',21597,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Anneau de l‘empereur Vek‘lor',21601,(SELECT id FROM "Classes" WHERE "name"=''), 4),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Diadème de Vek‘nilash',20926,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Gants du temple caché',21605,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Ceinture régénérante de Vek‘nilash',21609,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Amulette de Vek‘nilash',21608,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Bracelets de rédemption royale',21604,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Ceinture de l‘empereur déchu',21606,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Vengeance de Kalimdor',21679,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Torsade de l‘empereur déchu',21607,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=20930)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21600)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21599)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21598)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21602)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21597)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21601)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=20926)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21605)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21609)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21608)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21604)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21606)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21679)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21607)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "Ouro";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Peau du Grand ver des sables',20931,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Peau intacte d‘Ouro',20927,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Larve du Grand ver',23557,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Chapeau égaré de Don Rigoberto',21615,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('La Carapace du fouisseur',23558,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Brassards de fouisseur',21611,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bouclier en écailles de ver',21610,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Jom Gabbar',23570,(SELECT id FROM "Classes" WHERE "name"=''), 5);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=20931)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=20927)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23557)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21615)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23558)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21611)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21610)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23570)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "C‘thun";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Oeil de C‘Thun',21221,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Carcasse du Dieu très ancien',20933,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Carapace du Dieu très ancien',20929,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Corde de pédoncule cintrée',22730,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Cape de clarté',21583,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Anneau du tueur de dieu',21596,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gantelets d‘annihilation',21581,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Gantelets du sombre orage',21585,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Marque de C‘Thun',22732,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Cape du Dévoré',22731,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Tentacule de C‘Thun vaincu',21579,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Torsade du Dieu très ancien',21582,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Ceinture d‘agonie sans fin',21586,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Sceptre du faux prophète',21839,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Sombre doloire de la démence',21134,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Aiguillon de la mort',21126,(SELECT id FROM "Classes" WHERE "name"=''), 5);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21221)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=20933)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=20929)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22730)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21583)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21596)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21581)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21585)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22732)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22731)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21579)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21582)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21586)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21839)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21134)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21126));


-- ======================= NAXX =======================

-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau de la flamme éternelle',23237,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Atours de nécrochevalier',23069,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 3),
('Ceinture du Grand croisé',23666,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Ceinturon de furie élémentaire',23663,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Espauliers de furie élémentaire',23664,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Jambières de furie élémentaire',23665,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Jambières du Grand croisé',23668,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Présage funeste',23044,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Servobras égaré',23221,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Spallières du Grand croisé',23667,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Targe stygienne',23238,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Tunique en peau de goule',23226,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23237)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23069)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23666)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23663)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23664)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23665)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23668)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23044)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23221)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23667)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23238)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23226));


-- SELECT 1 AS "Anub‘Rekhan";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Bague des prières inexaucées',22939,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Larme de givre',22935,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gemme de Nérubis',22937,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape en soie de démon des cryptes',22938,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Garde-poignets de vengeance',22936,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22939)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22935)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22937)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22938)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22936));


-- SELECT 1 AS "Grande veuve Faerlina";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
-- ('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('L‘Etreinte de la veuve',22942,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Protège-épaules polaires',22941,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Remords de la veuve',22806,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Espauliers plaie-de-glace',22940,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Pendentif de la pierre pernicieuse',22943,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22942)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22941)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22806)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22940)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22943));


-- SELECT 1 AS "Maexxna";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants désacralisés',22371,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Garde-mains désacralisés',22364,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Gantelets désacralisés',22357,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Baiser de l‘araignée',22954,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Lame en peine',22807,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Pendentif des noms oubliés',22947,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Croc de Maexxna',22804,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Robe de toile cristalline',23220,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22371)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22364)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22357)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22954)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22807)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22947)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22804)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=23220));


-- SELECT 1 AS "Noth le Porte-peste";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Cape du Fléau',23030,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Coeur frigide de Noth',23029,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Bague de l‘inévitable',23031,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Bague du grêlon',23028,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Hachette de l‘os brisé',22816,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Libram de lumière',23006,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Totem de l‘eau courante',23005,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22356)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23030)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23029)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23031)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23028)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22816)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23006)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23005));


-- SELECT 1 AS "Heigan l‘Impur";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
-- ('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Cuissots de carnage',23068,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Camail glacécaille',23033,(SELECT id FROM "Classes" WHERE "name"=''), 4),
-- ('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Chapeau de précepteur',23035,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Heaume plaie-de-glace',23019,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Collier de nécropsie',23036,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23068)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23033)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22356)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23035)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23019)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23036));


-- SELECT 1 AS "Horreb";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Cuissards désacralisés',22359,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Cuissots désacralisés',22352,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Jambières désacralisées',22366,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Bague des forces contre-nature',23038,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('L‘oeil de Nérub',23039,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Anneau de ferveur spirituelle',23037,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bâton de soufre',22800,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Reflet d‘Horreb',23042,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22359)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22352)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22366)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23038)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23039)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23037)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22800)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23042));


-- SELECT 1 AS "Le Recousu";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Cape de suture',22960,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Bague de réanimation',22961,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Baguette des Parques',22820,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Cisailleuse',22815,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Le Porte-peste',22818,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22960)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22961)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22820)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22815)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22818));


-- SELECT 1 AS "Grobbulus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
-- ('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
-- ('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Spallières glacécaille',22967,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Injecteur de toxines',22810,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('La fin des rêves',22988,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Rosée du crépuscule',22803,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Mantelet glacial',22968,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22967)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22810)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22988)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22803)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22968));


-- SELECT 1 AS "Gluth";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Claymore de puissance impie',22813,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Collier perdu de Gluth',22981,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Main de pouvoir digérée',22994,(SELECT id FROM "Classes" WHERE "name"=''), 3),
-- ('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Pacte de la mort',23075,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Mantelet couvert de gel',22983,(SELECT id FROM "Classes" WHERE "name"=''), 6),
-- ('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
-- ('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
-- ('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5);
-- ('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
-- ('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22813)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22981)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22994)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=23075)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22983)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22356));


-- SELECT 1 AS "Thaddius";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Heaume désacralisé',22353,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Couvre-chef désacralisé',22360,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Diadème désacralisé',22367,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Jambières de polarité',23070,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Pic du crépuscule',22801,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Oeil de diminution',23001,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Fustigatrice',22808,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Thorax d‘abomination blindé',23000,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22353)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22360)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22367)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23070)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22801)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23001)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22808)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23000));


-- SELECT 1 AS "Instructeur Razuvious";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
-- ('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Baguette de la mort murmurante',23009,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Chevalière du défenseur déchu',23018,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Idole de longévité',23004,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Ceinturon du mentor',23219,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Voile de l‘éclipse',23017,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Iblis, lame du Séraphin déchu',23014,(SELECT id FROM "Classes" WHERE "name"=''), 5);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23009)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23018)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23004)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23219)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23017)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23014));


-- SELECT 1 AS "Gothik le Moissonneur";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
-- ('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5),
('Coiffure glaciale',23032,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Manchettes du moissonneur d‘âmes',23021,(SELECT id FROM "Classes" WHERE "name"=''), 6),
-- ('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Torque de sadique',23023,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bottes de déplacement',23073,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Casque polaire',23020,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23032)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23021)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23023)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23073)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23020));


-- SELECT 1 AS "Les quatre cavaliers";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Cordâme',22811,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cordialité du pardon',23027,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuirasse désacralisée',22349,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 5),
('Jambières de l‘Apocalypse',23071,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Maillet du croisé racheté',22809,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Porte-cendres corrompue',22691,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Robe désacralisée',22351,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 5),
('Sceau des damnés',23025,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Tunique désacralisée',22350,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 5);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22811)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23027)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22349)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23071)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22809)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22691)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22351)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23025)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22350));


-- SELECT 1 AS "Saphiron";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Pouvoir du Fléau',23548,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Puissance du Fléau',23545,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Résistance du Fléau',23547,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Robustesse du Fléau',23549,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Oeil du mort',23047,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Voile d‘assujettissement',23045,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Griffe du wyrm de givre',23242,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Le Visage de la mort',23043,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Blason de tueur',23041,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Oeil droit de Saphiron',23048,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Glyphe de déviation',23040,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('L‘essence contenue de Saphiron',23046,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Cape de la nécropole',23050,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Oeil gauche de Saphiron',23049,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23548)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23545)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23047)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23045)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23242)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23043)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23041)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23048)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23040)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23046)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23050)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23049));


-- SELECT 1 AS "Kel‘Thuzad";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau de la faucheuse d‘os',23060,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 5),
('Anneau de rédemption',23066,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 5),
('Anneau du cuirassier',23059,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 5),
('Anneau de Brise-terre',23065,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 5),
('Anneau de traqueur des cryptes',23067,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 5),
('Anneau de foi',23061,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 5),
('Anneau de givrefeu',23062,(SELECT id FROM "Classes" WHERE "name"='Mage'), 5),
('Anneau de pestecoeur',23063,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 5),
('Anneau de marcherêve',23064,(SELECT id FROM "Classes" WHERE "name"='Druide'), 5),
('Le phylactère de Kel‘Thuzad',22520,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Gemme des innocents enchaînés',23057,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Puissance de Menethil',22798,(SELECT id FROM "Classes" WHERE "name"=''), 5),
('Détrôneuse',22802,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Talisman bouillonnant de Stormrage',23053,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Cherche-âme',22799,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Marteau du Néant distordu',23056,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Doigt du destin',22821,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Gressil, Aube de la ruine',23054,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Bouclier de condamnation',22819,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Le Froid dévorant',23577,(SELECT id FROM "Classes" WHERE "name"=''), 6),
('Esclavagiste nérubien',22812,(SELECT id FROM "Classes" WHERE "name"=''), 6);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22520)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23060)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23057)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22798)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23066)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23059)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23065)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22802)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23053)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23062)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23067)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22799)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23056)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23061)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22821)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23063)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23054)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23064)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22819)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23577)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22812));


-- safe comment
-- THIS FILE IS GENERATED
INSERT INTO "ClassItem" ("itemId","classId","prio","comment")
VALUES

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de la Terre profonde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Maillet draconique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Maillet draconique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de puissance draconique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de puissance draconique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vengeresse draconique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de blizzard de Ringo'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pourpoint d‘ombre entrelacé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Trancheuse du destin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trancheuse du destin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Récolteur d‘essence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Récolteur d‘essence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Récolteur d‘essence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Récolteur d‘essence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de sombre domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de sombre domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de sombre domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de l‘évolution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de l‘évolution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de l‘évolution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de l‘évolution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la cabale de l‘Aile noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la cabale de l‘Aile noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la cabale de l‘Aile noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Brise-échine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brise-échine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'La lame indomptée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La lame indomptée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du dragon déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du dragon déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du dragon déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume de la rage infinie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume de la rage infinie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame croc-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame croc-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Protecteur en écailles de dragon rouge'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protecteur en écailles de dragon rouge'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers de rejeton noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers de rejeton noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de précision des arcanes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de précision des arcanes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de précision des arcanes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-coeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-coeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-coeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Maladath, lame runique du Vol noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Maladath, lame runique du Vol noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Maladath, lame runique du Vol noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de cendre noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de cendre noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de cendre noire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Etreinte Gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Etreinte Gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Etreinte Gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Etreinte Gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe du drake noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe du drake noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe du drake noir'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape gueule-de-feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards du croisé déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers griffe-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers griffe-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de Blackrock'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de Blackrock'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de Blackrock'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de Blackrock'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards rivetés de Primaliste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton focalisateur de l‘Aile de l‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton focalisateur de l‘Aile de l‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de récupération'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de récupération'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de récupération'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fendoir griffe-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Concentration forcée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Concentration forcée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Concentration forcée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme d‘ébène'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme d‘ébène'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman croc-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman croc-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman croc-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman croc-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman croc-de-drake'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Rempart béni de Malfurion'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Canon à main Souffle-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Canon à main Souffle-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de la pensée pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cercle de la force appliquée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cercle de la force appliquée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cercle de la force appliquée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cercle de la force appliquée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières en tisse-braise'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières en tisse-braise'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée d‘obstruction de Styleen'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée d‘obstruction de Styleen'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher du dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher du dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher du dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher du dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Prophète de malheur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Prophète de malheur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman Amélio'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes chromatiques'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes chromatiques'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants en cuir de dragon tendu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Geta chatoyantes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape brochée d‘élémentium'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape brochée d‘élémentium'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon du croisé déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières surpuissantes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières surpuissantes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Epée trempée chromatiquement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epée trempée chromatiquement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de Chromaggus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de Chromaggus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de Chromaggus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sangle rivetée de Primaliste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ashjre‘thul, arbalète de châtiment'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bouclier en élémentium renforcé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bouclier en élémentium renforcé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tête de Nefarian'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête de Nefarian'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête de Nefarian'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête de Nefarian'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête de Nefarian'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du seigneur des couvées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du seigneur des couvées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du seigneur des couvées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la Flamme d‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la Flamme d‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la Flamme d‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Chaîne de Therazane'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de rétorsion d‘Archimtiros'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de rétorsion d‘Archimtiros'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau d‘élémentium pur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau d‘élémentium pur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau d‘élémentium pur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de Neltharion'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de Neltharion'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de Neltharion'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mish‘undare, coiffure du flagelleur mental'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mish‘undare, coiffure du flagelleur mental'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mish‘undare, coiffure du flagelleur mental'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de perfidie de Prestor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de perfidie de Prestor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de la Flamme d‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de la Flamme d‘ombre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ashkandi, Grande épée de la Confrérie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ashkandi, Grande épée de la Confrérie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Crul‘shorukh, Trancheuse du chaos'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Crul‘shorukh, Trancheuse du chaos'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lok‘amir il Romathis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lok‘amir il Romathis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lok‘amir il Romathis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du prophète déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la volonté inexorable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de la volonté inexorable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets en écailles de hanneton'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets en écailles de hanneton'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets en écailles de hanneton'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets en écailles de hanneton'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets en écailles de hanneton'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de concentré de haine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de concentré de haine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de concentré de haine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de concentré de haine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de concentré de haine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières du barrage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières du barrage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Plastron d‘annihilation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Plastron d‘annihilation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de pensée foisonnante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de pensée foisonnante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de pensée foisonnante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du gardien qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du gardien qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif du gardien qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de vile sauvegarde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de vile sauvegarde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de vile sauvegarde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de vile sauvegarde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de vile sauvegarde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton des prophètes qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton des prophètes qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton des prophètes qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau de Ji‘zhi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau de Ji‘zhi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes du prophète déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture qiraji en peau épaisse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture qiraji en peau épaisse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du garde de guerre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du garde de guerre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du garde de guerre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes recomposées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de pureté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de coercition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de coercition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de coercition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de coercition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Casque des lianes rampantes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Casque des lianes rampantes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de détermination inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de détermination inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de l‘essaim purulent'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de l‘essaim purulent'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Insigne de garde-essaim'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Insigne de garde-essaim'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Insigne de garde-essaim'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir de Sartura'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir de Sartura'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir de Sartura'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de silithide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de silithide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe de silithide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de fureur qiraji en écailles'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tenue de parade impériale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tenue de parade impériale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tenue de parade impériale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tenue de parade impériale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tenue de parade impériale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Armes impériales qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Armes impériales qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Armes impériales qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Armes impériales qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du saint gardien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du saint gardien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du saint gardien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Corselet en carapace de silithide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corselet en carapace de silithide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de tunnelière de la ruche'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de tunnelière de la ruche'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de tunnelière de la ruche'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape des secrets inexprimables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier barbelé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier barbelé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier barbelé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier barbelé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier barbelé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers de l‘Implacable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers de l‘Implacable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fétiche du ravageur des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fétiche du ravageur des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fétiche du ravageur des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de vengeance cruelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de vengeance cruelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de ravageur des sables en écailles'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Guisarme du ravageur des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien éventreur qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien éventreur qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Totem de vie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de domination qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de domination qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de domination qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de commandement qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de commandement qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de commandement qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes de commandement qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du martyr'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du martyr'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du martyr'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets en peau de guêpe'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets en peau de guêpe'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de profanateur de ruche'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de profanateur de ruche'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la Ruche d‘or'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la Ruche d‘or'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du messie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du messie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du messie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon d‘Huhuran'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon d‘Huhuran'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon d‘Huhuran'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon d‘Huhuran'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gilet d‘exécution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gilet d‘exécution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gilet d‘exécution rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Scarabée pétrifié'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture de la triade'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture de la triade'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du triumvirat'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Semblance du dévoreur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Semblance du dévoreur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de noblesse qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de noblesse qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de noblesse qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de noblesse qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Toucher d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet ternaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet ternaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet ternaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la trinité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la trinité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la puissance phrénique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la puissance phrénique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de ténèbres d‘Ukko'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets couverts de bile'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets couverts de bile'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets couverts de bile'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet de la fureur du désert'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes du héros déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes du héros déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Charme d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Charme d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Charme d‘Angelista'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants d‘Ebru'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants d‘Ebru'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets éclaboussés de vase'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets éclaboussés de vase'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de Kalimdor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de fureur qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de fureur qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de fureur qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Idole de santé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Idole de santé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fémur de silithide aiguisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fémur de silithide aiguisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières couvertes de vase'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières couvertes de vase'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Broche scarabée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Broche scarabée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Broche scarabée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de l‘épiphanie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de l‘épiphanie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de l‘épiphanie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de dévastation de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de dévastation de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture royale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture royale qiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards d‘exécution quiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards d‘exécution quiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards d‘exécution quiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards d‘exécution quiraji'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre royal de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre royal de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre royal de Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de l‘empereur Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de l‘empereur Vek‘lor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du temple caché'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du temple caché'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du temple caché'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants du temple caché'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture régénérante de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture régénérante de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Amulette de Vek‘nilash'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bracelets de rédemption royale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bracelets de rédemption royale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bracelets de rédemption royale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vengeance de Kalimdor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vengeance de Kalimdor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade de l‘empereur déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Peau du Grand ver des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Peau du Grand ver des sables'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Peau intacte d‘Ouro'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Peau intacte d‘Ouro'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Peau intacte d‘Ouro'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Peau intacte d‘Ouro'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Peau intacte d‘Ouro'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Larve du Grand ver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larve du Grand ver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larve du Grand ver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau égaré de Don Rigoberto'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau égaré de Don Rigoberto'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau égaré de Don Rigoberto'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La Carapace du fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards de fouisseur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bouclier en écailles de ver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jom Gabbar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jom Gabbar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jom Gabbar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Carcasse du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carcasse du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carcasse du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carcasse du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carcasse du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Carapace du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carapace du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carapace du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carapace du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Carapace du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de pédoncule cintrée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de pédoncule cintrée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de pédoncule cintrée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de clarté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de clarté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de clarté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du tueur de dieu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du tueur de dieu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du tueur de dieu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau du tueur de dieu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets d‘annihilation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets d‘annihilation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets du sombre orage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets du sombre orage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets du sombre orage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marque de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque de C‘Thun'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Dévoré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tentacule de C‘Thun vaincu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Torsade du Dieu très ancien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘agonie sans fin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘agonie sans fin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘agonie sans fin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre du faux prophète'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre du faux prophète'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceptre du faux prophète'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sombre doloire de la démence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sombre doloire de la démence'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Aiguillon de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de la flamme éternelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de la flamme éternelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Atours de nécrochevalier'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Atours de nécrochevalier'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Atours de nécrochevalier'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Atours de nécrochevalier'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de furie élémentaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers de furie élémentaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de furie élémentaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Présage funeste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Présage funeste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Présage funeste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Servobras égaré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Servobras égaré'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières du Grand croisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Targe stygienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Targe stygienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Targe stygienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique en peau de goule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique en peau de goule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique en peau de goule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Brassards désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-poignets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-poignets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-poignets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague des prières inexaucées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague des prières inexaucées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague des prières inexaucées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de givre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de givre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Larme de givre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de Nérubis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de Nérubis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme de Nérubis'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape en soie de démon des cryptes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape en soie de démon des cryptes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape en soie de démon des cryptes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vengeance'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vengeance'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'L‘Etreinte de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'L‘Etreinte de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'L‘Etreinte de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules polaires'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules polaires'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Remords de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Remords de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Remords de la veuve'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers plaie-de-glace'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers plaie-de-glace'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif de la pierre pernicieuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif de la pierre pernicieuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif de la pierre pernicieuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-mains désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-mains désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-mains désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Baiser de l‘araignée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, 'Premier pour Paffë puis rotation Tank / Rogue / DD'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baiser de l‘araignée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'Premier pour Paffë puis rotation Tank / Rogue / DD'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baiser de l‘araignée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, 'Premier pour Paffë puis rotation Tank / Rogue / DD'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baiser de l‘araignée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, 'Premier pour Paffë puis rotation Tank / Rogue / DD'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame en peine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, 'Rotation Mage / Démonistes'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame en peine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, 'Rotation Mage / Démonistes'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame en peine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, 'Rotation Mage / Démonistes'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif des noms oubliés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif des noms oubliés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pendentif des noms oubliés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Croc de Maexxna'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de toile cristalline'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de toile cristalline'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe de toile cristalline'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinture désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sangle désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, 'Première à Fllas'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sangle désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, 'Première à Fllas'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Coeur frigide de Noth'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coeur frigide de Noth'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coeur frigide de Noth'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de l‘inévitable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de l‘inévitable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de l‘inévitable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague du grêlon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Hachette de l‘os brisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, 'War Tank Orcs'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Hachette de l‘os brisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, 'War Tank Orcs'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Hachette de l‘os brisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, 'War Tank Orcs'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Libram de lumière'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Totem de l‘eau courante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissots de carnage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissots de carnage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Camail glacécaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Camail glacécaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chapeau de précepteur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume plaie-de-glace'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume plaie-de-glace'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de nécropsie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de nécropsie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier de nécropsie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissots désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissots désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague des forces contre-nature'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague des forces contre-nature'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'L‘oeil de Nérub'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de ferveur spirituelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de ferveur spirituelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de ferveur spirituelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de soufre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de soufre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de soufre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Reflet d‘Horreb'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Espauliers désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de suture'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de suture'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de suture'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de réanimation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bague de réanimation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette des Parques'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette des Parques'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette des Parques'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cisailleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'Prio Orc'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Le Porte-peste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le Porte-peste'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières glacécaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières glacécaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Injecteur de toxines'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Injecteur de toxines'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Injecteur de toxines'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'La fin des rêves'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'La fin des rêves'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Rosée du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Rosée du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Rosée du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet glacial'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet glacial'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet glacial'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Claymore de puissance impie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Claymore de puissance impie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Claymore de puissance impie'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier perdu de Gluth'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier perdu de Gluth'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Main de pouvoir digérée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Main de pouvoir digérée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Main de pouvoir digérée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pacte de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets désacralisés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet couvert de gel'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Mantelet couvert de gel'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sandales désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sandales désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sandales désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes désacralisées'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Heaume désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Diadème désacralisé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de polarité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, 'Rotation Mage / Démo'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de polarité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, 'Rotation Mage / Démo'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de polarité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, 'Rotation Mage / Démo'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pic du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pic du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pic du crépuscule'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de diminution'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de diminution'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de diminution'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fustigatrice'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fustigatrice'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fustigatrice'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Thorax d‘abomination blindé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Thorax d‘abomination blindé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de la mort murmurante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Baguette de la mort murmurante'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Chevalière du défenseur déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chevalière du défenseur déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Chevalière du défenseur déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Idole de longévité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Idole de longévité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon du mentor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, 'Sauf tanks 8/8 T3'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon du mentor'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'Sauf tanks 8/8 T3'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de l‘éclipse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de l‘éclipse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile de l‘éclipse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Iblis, lame du Séraphin déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'War DD non orcs / Rogues épées'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Iblis, lame du Séraphin déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, 'War DD non orcs / Rogues épées'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Iblis, lame du Séraphin déchu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, 'War DD non orcs / Rogues épées'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Coiffure glaciale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coiffure glaciale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coiffure glaciale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coiffure glaciale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Coiffure glaciale'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes du moissonneur d‘âmes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Manchettes du moissonneur d‘âmes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Torque de sadique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Torque de sadique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de déplacement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes de déplacement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Casque polaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Casque polaire'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cordâme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cordâme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cordâme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cordialité du pardon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cordialité du pardon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cordialité du pardon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuirasse désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuirasse désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de l‘Apocalypse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de l‘Apocalypse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Maillet du croisé racheté'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-cendres corrompue'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-cendres corrompue'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-cendres corrompue'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau des damnés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau des damnés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tunique désacralisée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pouvoir du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Puissance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Puissance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Puissance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Résistance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Résistance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Résistance du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robustesse du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robustesse du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robustesse du Fléau'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil du mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil du mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil du mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Voile d‘assujettissement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile d‘assujettissement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Voile d‘assujettissement'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe du wyrm de givre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe du wyrm de givre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Le Visage de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le Visage de la mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Blason de tueur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Blason de tueur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Blason de tueur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil droit de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil droit de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil droit de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Glyphe de déviation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Glyphe de déviation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'L‘essence contenue de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, 'Rotation Mage Démo'),
  ((SELECT id FROM "Items" WHERE "name"=
  'L‘essence contenue de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, 'Rotation Mage Démo'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la nécropole'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la nécropole'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape de la nécropole'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil gauche de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil gauche de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil gauche de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Le phylactère de Kel‘Thuzad'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le phylactère de Kel‘Thuzad'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le phylactère de Kel‘Thuzad'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme des innocents enchaînés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme des innocents enchaînés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gemme des innocents enchaînés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Puissance de Menethil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Puissance de Menethil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Détrôneuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, '2 rogues / 1 tank / 1 hunt puis roll de classe'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Détrôneuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, '2 rogues / 1 tank / 1 hunt puis roll de classe'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Détrôneuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, '2 rogues / 1 tank / 1 hunt puis roll de classe'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Détrôneuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true, '2 rogues / 1 tank / 1 hunt puis roll de classe'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman bouillonnant de Stormrage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman bouillonnant de Stormrage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman bouillonnant de Stormrage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide Feral'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cherche-âme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cherche-âme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cherche-âme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau du Néant distordu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, 'Rotation Prêtre / Chaman / Druide'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau du Néant distordu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false, 'Rotation Prêtre / Chaman / Druide'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau du Néant distordu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false, 'Rotation Prêtre / Chaman / Druide'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Doigt du destin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Doigt du destin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true, NULL),
  ((SELECT id FROM "Items" WHERE "name"=
  'Doigt du destin'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre Ombre'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gressil, Aube de la ruine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'Rotation rogue épée / War DD'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gressil, Aube de la ruine'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, 'Rotation rogue épée / War DD'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bouclier de condamnation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false, NULL),

  ((SELECT id FROM "Items" WHERE "name"=
  'Le Froid dévorant'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false, 'Rotation Tank / War DD / Rogue'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le Froid dévorant'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false, 'Rotation Tank / War DD / Rogue'),
  ((SELECT id FROM "Items" WHERE "name"=
  'Le Froid dévorant'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false, 'Rotation Tank / War DD / Rogue'),

  ((SELECT id FROM "Items" WHERE "name"=
  'Esclavagiste nérubien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true, NULL); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Merit" ("order", "active", "value", "categorie", "name", "comment", "delay")
VALUES

(1, true, 10, 'Enchantements (actuels)', 'Casque', 'libram ou ZG', null),
(2, true, 15, 'Enchantements (actuels)', 'Epaulettes', 'exalté ZG ou +5 resist', null),
(3, true, 05, 'Enchantements (actuels)', 'Cape', '', null),
(4, true, 10, 'Enchantements (actuels)', 'Plastron', '', null),
(5, true, 10, 'Enchantements (actuels)', 'Bracelet', '', null),
(6, true, 10, 'Enchantements (actuels)', 'Gants', '', null),
(7, true, 10, 'Enchantements (actuels)', 'Pantalon', 'libram ou ZG', null),
(8, true, 10, 'Enchantements (actuels)', 'Bottes', '', null),

(9, true, 10, 'Enchantements (actuels)', 'Arme droite', '', null),
(10, true, 10, 'Enchantements (actuels)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(11, true, 05, 'Enchantements (actuels)', 'Arme distance', '', null),

(1, true, 10, 'Equipement Pré-raid', 'Casque', '', null),
(2, true, 10, 'Equipement Pré-raid', 'Collier', '', null),
(3, true, 10, 'Equipement Pré-raid', 'Epaulettes', '', null),
(4, true, 10, 'Equipement Pré-raid', 'Cape', '', null),
(5, true, 10, 'Equipement Pré-raid', 'Plastron', '', null),
(6, true, 10, 'Equipement Pré-raid', 'Bracelet', '', null),
(7, true, 10, 'Equipement Pré-raid', 'Gants', '', null),
(8, true, 10, 'Equipement Pré-raid', 'Ceinture', '', null),
(9, true, 10, 'Equipement Pré-raid', 'Pantalon', '', null),
(10, true, 10, 'Equipement Pré-raid', 'Bottes', '', null),
(11, true, 10, 'Equipement Pré-raid', 'Anneau 1', '', null),
(12, true, 10, 'Equipement Pré-raid', 'Anneau 2', '', null),
(13, true, 10, 'Equipement Pré-raid', 'Bijou 1', '', null),
(14, true, 10, 'Equipement Pré-raid', 'Bijou 2', '', null),

(15, true, 10, 'Equipement Pré-raid', 'Arme droite', '', null),
(16, true, 10, 'Equipement Pré-raid', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, true, 10, 'Equipement Pré-raid', 'Arme distance / relique / totem', '', null),

(1, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Casque', '', null),
(2, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Collier', '', null),
(3, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Epaulettes', '', null),
(4, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Cape', '', null),
(5, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Plastron', '', null),
(6, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Bracelet', '', null),
(7, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Gants', '', null),
(8, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Ceinture', '', null),
(9, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Pantalon', '', null),
(10, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Bottes', '', null),
(11, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Anneau 1', '', null),
(12, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Anneau 2', '', null),
(13, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Bijou 1', '', null),
(14, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Bijou 2', '', null),

(15, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Arme droite', '', null),
(16, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, true, 05, 'Equipement palier 1 (T1 / MC / R10)', 'Arme distance / relique / totem', '', null),

(1, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Casque', '', null),
(2, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Collier', '', null),
(3, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Epaulettes', '', null),
(4, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Cape', '', null),
(5, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Plastron', '', null),
(6, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bracelet', '', null),
(7, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Gants', '', null),
(8, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Ceinture', '', null),
(9, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Pantalon', '', null),
(10, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bottes', '', null),
(11, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Anneau 1', '', null),
(12, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Anneau 2', '', null),
(13, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bijou 1', '', null),
(14, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bijou 2', '', null),

(15, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme droite', '', null),
(16, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, true, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme distance / relique / totem', '', null),

(1, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Casque', '', null),
(2, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Collier', '', null),
(3, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Epaulettes', '', null),
(4, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Cape', '', null),
(5, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Plastron', '', null),
(6, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bracelet', '', null),
(7, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Gants', '', null),
(8, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Ceinture', '', null),
(9, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Pantalon', '', null),
(10, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bottes', '', null),
(11, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Anneau 1', '', null),
(12, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Anneau 2', '', null),
(13, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bijou 1', '', null),
(14, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bijou 2', '', null),

(15, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme droite', '', null),
(16, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, true, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme distance / relique / totem', '', null),

(1, true, 10, 'Spécialisation', 'Publiée sur cet outil et à jour', 'https://fr.classic.wowhead.com/talent-calc', null),
(2, true, 15, 'Spécialisation', 'Validée par le Maître de classe', 'Pas une spé PvP', null),
(3, true, 10, 'Spécialisation', '100% PvE', 'Tous les points les plus opti au raid', null),
(4, true, 10, 'Spécialisation', 'Soigneur: Spécialisation non hybride', 'Pour tous les healers qui ne jouent pas tank ou DPS', null),

(1, true, 05, 'Grade', 'Avoir le grade Membre', 'également pour les Raideur', null),
(2, true, 05, 'Grade', 'Avoir le grade Raideur', 'également pour les Vétérans', null),
(3, true, 05, 'Grade', 'Avoir le grade Vétéran', 'également pour les Maîtres de classe', null),
(4, true, 05, 'Grade', 'Avoir le grade Maître de classe', 'également pour les Officiers', null),
(5, true, 05, 'Grade', 'Avoir le grade Officier', 'également pour le GM', null),
(6, true, 05, 'Grade', 'Avoir le grade GM', '', null),

(1, true, 05, 'Communauté', 'Présenté sur les forums', '', null),
(2, true, 05, 'Communauté', 'Photo dans le trombinoscope', '', null),
(3, true, 02, 'Communauté', 'Avoir un chat et avoir posté sa photo', 'dans le chabinoscope', null),
(4, true, 15, 'Communauté', 'Signer la charte de guilde', '', null),
(5, true, 15, 'Communauté', 'Porter le tabard de guilde', '', null),
(6, true, 03, 'Communauté', 'Avoir un avatar sur le forum', '', null),
(7, true, 03, 'Communauté', 'Avoir exactement le même pseudo sur le forum qu‘en jeu', '', null),
(8, true, 03, 'Communauté', 'Avoir un avatar sur le Discord', '', null),
(9, true, 03, 'Communauté', 'Avoir exactement le même pseudo sur le Discord qu‘en jeu', '', null),
(10, true, 02, 'Communauté', 'Avoir un micro correctement configuré sur Discord', '', null),

(1, true, 05, 'Communauté - forum', 'A fait un guide sur le forum', '', null),
(2, true, 05, 'Communauté - forum', 'A fait un guide vidéo sur le forum', '', null),
(3, true, 05, 'Communauté - forum', 'A partagé un screen de son interface sur le forum', '', null),
(4, true, 05, 'Communauté - forum', 'A partagé sa liste d‘addons / weakaura sur le forum', '', null),

(5, true, 05, 'Communauté - forum', '50 messages sur le forum', '', null),
(6, true, 05, 'Communauté - forum', '200 messages sur le forum', '', null),
(7, true, 05, 'Communauté - forum', '500 messages sur le forum', '', null),
(8, true, 05, 'Communauté - forum', '1000 messages sur le forum', '', null),

(1, true, 05, 'Ancienneté', 'Est un ancien Awaken (Nostalrius)', '', null),
(2, true, 05, 'Ancienneté', 'A rejoint Awaken avant le 22 septembre (début de Classic)', '', null),
(3, true, 05, 'Ancienneté', 'A rejoint Awaken il y a plus de 3 mois', '', null),
(4, true, 05, 'Ancienneté', 'A rejoint Awaken il y a plus de 6 mois', '', null),
(5, true, 05, 'Ancienneté', 'A rejoint Awaken il y a plus d‘un an', '', null),

(1, true, 07, 'Farm Guilde', 'A fourni un lotus noir à la guilde', 'dure 60 jours', 60),
(2, true, 07, 'Farm Guilde', 'A fourni plusieurs lotus noir à la guilde', 'Egalement pour le mérite précédent, dure 60 jours', 60),
(3, true, 07, 'Farm Guilde', 'Est un artisant de la guilde', 'Dépeuceur 315 / TDC craft Rési / Couture craft Rési / Forge craft Rési / Enchantement ++', null),

(1, true, 03, 'Accès Raid', 'Accès Onyxia', '', null),
(2, true, 03, 'Accès Raid', 'Accès Molten Core', '', null),
(3, true, 03, 'Accès Raid', 'Accès BWL', '', null),
(4, false, 03, 'Accès Raid', 'Accès Naxxramas', '', null),
(5, true, 05, 'Accès Raid', 'Accès à la Quintessence aquatique', '', null),
(6, true, 05, 'Accès Raid', 'Toujours une Quintessence aquatique dans le sac', '', null),

(1, true, 05, 'Raid', 'Possède les addons de raid obligatoires', '', null),

(2, true, 05, 'Raid', 'Toujours sous consommables', 'Boss + Trash', null),
(3, true, 05, 'Raid', 'Sous consommables quand nécessaire', 'A ajouter si "Toujours sous consommables"', null),
(4, true, 03, 'Raid', 'La bouffe, c‘est déjà pas mal', '', null),
(5, true, 03, 'Raid', '300 en bandages', '', null),

(6, true, 03, 'Raid', 'Toujours des popos dans le sac', 'Mana et Vie', null),

(7, true, 10, 'Raid', 'Stuff +140 résistance feu unbuff', '', null),
(8, true, 10, 'Raid', 'Stuff +140 résistance nature unbuff', '', null),
(9, true, 10, 'Raid', 'Stuff +140 résistance givre unbuff', '', null),

(10, true, 10, 'Raid', 'Avoir un sac Onyxia', '', null),
(11, true, 5, 'Raid', 'Avoir deux sacs Onyxia', '', null),
(12, true, 5, 'Raid', 'Avoir trois sacs Onyxia', '', null),
(13, true, 5, 'Raid', 'Avoir quatres sacs Onyxia', '', null),

-- // DEAD MERITS
(21, false, 10, 'Raid', 'Exalté Hydraxiens', '', null),
(22, false, 10, 'Raid', 'Exalté Gurubashi', '', null),
(23, false, 10, 'Raid', 'Exalté Cercle cénarien', '', null),
(24, false, 10, 'Raid', 'Exalté Progeniture de nozdormu', '', null),
(25, false, 10, 'Raid', 'Exalté Aube d‘argent', '', null),
-- // FIN DEAD MERITS

(1, true, 5, 'PvE', 'J‘ai tué Ragnaros chez Awaken', '', null),
(2, true, 5, 'PvE', 'J‘ai tué Nefarian chez Awaken', '', null),
(3, true, 5, 'PvE', 'J‘ai tué C‘thun chez Awaken', '', null),
(4, true, 10, 'PvE', 'J‘ai tué Kel Thuzad chez Awaken', '', null),

(1, true, 10, 'Réputations de raids', 'Exalté Hydraxiens', '', null),
(2, true, 10, 'Réputations de raids', 'Exalté Gurubashi', '', null),
(3, true, 10, 'Réputations de raids', 'Exalté Cercle cénarien', '', null),
(4, true, 10, 'Réputations de raids', 'Exalté Progeniture de nozdormu', '', null),
(5, true, 10, 'Réputations de raids', 'Exalté Aube d‘argent', '', null),

(1, true, 10, 'PvP', 'Exalté Altérac (Equipement pré-raid épique)', '', null),
(2, true, 5, 'PvP', 'Grade PvP 6 : Garde de Pierre : Accès aux potions', '', null),
(3, true, 5, 'PvP', 'Grade PvP 10 : Equipement bleu', '', null),
(4, true, 5, 'PvP', 'Grade PvP 13 : Equipement épique', '', null),
(5, true, 10, 'PvP', 'Grade PvP 14 : Armes épiques', '', null),

(1, true, 05, 'Mérite', 'Atteindre 100 points de mérite validés', '', null),
(2, true, 05, 'Mérite', 'Atteindre 200 points de mérite validés', '', null),
(3, true, 05, 'Mérite', 'Atteindre 300 points de mérite validés', '', null),
(4, true, 05, 'Mérite', 'Atteindre 400 points de mérite validés', '', null),
(5, true, 05, 'Mérite', 'Atteindre 500 points de mérite validés', '', null),
(6, true, 05, 'Mérite', 'Atteindre 600 points de mérite validés', '', null),
(7, true, 05, 'Mérite', 'Atteindre 700 points de mérite validés', '', null),

(1, true, -100, 'Malus', 'J‘ai mal saisie un mérite et je me suis fait chopper', 'au cours du dernier mois', 30),
(2, true, -75, 'Malus', 'J‘ai manqué de respect envers un off ou un mdc', 'au cours du dernier mois', 30),
(3, true, -40, 'Malus', 'Je ne me suis pas inscrit en raid 2 fois', 'au cours du dernier mois', 30),
(4, true, -20, 'Malus', 'Je suis arrivé en retard en raid sans prévenir', 'au cours du dernier mois', 30),
(5, true, -50, 'Malus', 'J‘était inscrit au raid mais pas présent, sans prévenir', 'au cours des deux derniers mois', 60),
(6, true, -20, 'Malus', 'J‘ai pris la parole de manière inapropriée en raid', 'au cours du dernier mois', 30),
(7, true, -50, 'Malus', 'J‘ai menti sur ma spé ou respé sans le dire à mon MDC', 'au cours des deux derniers mois', 60),
(8, true, -30, 'Malus', 'Je suis venu en raid sans consommables', 'au cours du dernier mois', 30),
(9, true, -30, 'Malus', 'Je suis venu en raid sans enchantements', 'au cours du dernier mois', 30),
(10, true, -30, 'Malus', 'J‘ai pull un pack en mode kikoo', 'au cours du dernier mois', 30),
(11, true, -40, 'Malus', 'J‘ai fais wipe le raid sur une bombe', 'Vael/Gueedon au cours des deux derniers mois', 60),
(12, true, -40, 'Malus', 'J‘ai fais dépop les techniciens autour de Vael', 'au cours des deux derniers mois', 60),
(13, true, -40, 'Malus', 'J‘ai loot l‘or de raid à la place d‘un officier','au cours des deux derniers mois', 60);

-- added after release :
-- (13, true, -40, 'Malus', 'J‘ai loot l‘or de raid à la place d‘un officier','au cours des deux derniers mois', 60);



-- TODO Futurs mérites de classes
-- INSERT INTO "Merit" ("order", "active", "value", "classId", "categorie", "name", "comment")
-- VALUES
-- (1, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Mage'),
-- 'Merite de Classe',
-- 'Avoir le pain et l‘eau rang max', ''),
-- (2, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Mage'),
-- 'Merite de Classe',
-- 'Avoir son pipot de bruyère', ''),
-- (3, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Prêtre'),
-- 'Merite de Classe',
-- 'Avoir sa bénédiction / Anathème enchantée', ''),
-- (4, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Prêtre'),
-- 'Merite de Classe',
-- 'Avoir sa suite de fauve', ''),
-- (5, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Druide'),
-- 'Merite de Classe',
-- 'Jouer au mouseover', ''),
-- (6, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Druide'),
-- 'Merite de Classe',
-- 'Avoir sa suite de fauve', ''),
-- (7, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Voleur'),
-- 'Merite de Classe',
-- 'Avoir un stuff 140+ RN unbuff', ''),
-- (8, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Voleur'),
-- 'Merite de Classe',
-- 'Avoir un stuff 140+ RF unbuff', ''),
-- (9, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Chasseur'),
-- 'Merite de Classe',
-- 'Avoir son arc épique', ''),
-- (10, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Chasseur'),
-- 'Merite de Classe',
-- 'Avoir un stuff 140+ RN unbuff', ''),
-- (11, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Chaman'),
-- 'Merite de Classe',
-- 'Jouer au mouseover', ''),
-- -- (12, false, 15,
-- -- (SELECT id FROM "Classes" WHERE "name"='Chaman'),
-- -- 'Merite de Classe',
-- -- 'Avoir sa Crépuscule', 'Chaman amélio uniquement'),
-- (13, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Guerrier DPS'),
-- 'Merite de Classe',
-- 'Avoir un stuff avec 390+ def', ''),
-- (14, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'),
-- 'Merite de Classe',
-- 'Avoir 230+ RF unbuff', ''),
-- (15, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'),
-- 'Merite de Classe',
-- 'Avoir un stuff avec 420+ def', '')
-- ;

-- INSERT INTO "Merit" ("order", "active",  "value", "classId", "categorie", "name", "comment")
-- VALUES
-- (1, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Démoniste'),
-- 'Merite de Classe - Epique',
-- 'Avoir 200+ résist ombre unbuff', ''),
-- (2, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Chasseur'),
-- 'Merite de Classe - Epique',
-- 'Solote Hache trippe', ''),
-- (3, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Chasseur'),
-- 'Merite de Classe - Epique',
-- 'Avoir son carquois épique', '')
-- ;

-- INSERT INTO "Merit" ("order", "active", "value", "classId", "categorie", "name", "comment")
-- VALUES
-- (1, false, 15,
-- (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'),
-- 'Merite de Classe - Légendaire',
-- 'Avoir sa Thunderfury', '')
-- ; -- SAFE BEGIN FOR CONCAT

-- admin
-- officer
-- classMaster
-- player
-- guest

-- 1 - Prêtre
-- 2 - Mage
-- 3 - Démoniste
-- 4 - Voleur
-- 5 - Druide
-- 6 - Chasseur
-- 7 - Chaman
-- 8 - Guerrier Tank
-- 9 - Guerrier DPS
-- 10 - Paladin


INSERT INTO "Players" ("name", "classId", "role", "password", "active", "inRoster")
VALUES
('Devilhunter'  , 6,  'admin', '71c0665585d07663b6955dd9d43fa209', true, true),
('awaken'       , 6,  'player', 'a4261bb727d95e6df608247a6559571f', false, true), -- awakentest
('admin'        , 1,  'admin', '84ad2112b283ac8f9e59d062d531917b', false, false),
('officer'      , 1,  'officer', '071b8d0d37313edbaf88c5f8cc198a22', false, false),
('classMaster'  , 1,  'classMaster', '71c0665585d07663b6955dd9d43fa209', true, false),
('player'       , 1,  'player', '28d1fc4380e4adb521742bdd6ad260b9', true, false),
('Lums'         , 7,  'player', null, true, true),
('Deiv'         , 1,  'player', '5a29ca97ad30bb6484a3832042ff7f2b', true, true),
('Krigen'       , 8,  'player', '1ce82060116628e67b6dfa004ce8d70a', true, true),
('Cocobanjo'    , 4,  'player', null, true, true),
('Nozil'        , 6,  'player', '950382a04140bcdab437600b0928ec63', true, true),
('Oscuro'       , 9,  'player', null, true, true),
('Paffë'        , 12,  'player', null, true, true),
('Skwäsh'       , 1,  'player', '2f8b09d7750539ba0d7853cd1eae78ee', true, true),
('Tàel'         , 3,  'player', null, true, true),
('Ragegoriath'  , 8,  'player', 'e3b557b6f939ad38f1610dd5102b1ee7', true, true),
('Abramus'      , 2,  'player', '36c22332185e0dba36d442e66a83e706', true, true),
('Shaheem'      , 3,  'player', null, false, false),
('Hakken'       , 2,  'player', null, false, false),
('Adblock'      , 2,  'player', 'fff2cc3acaab98a5b0b7f0550c6981df', true, false),
('Affligeant'   , 3,  'player', null, false, false),
('Alk'          , 6,  'player', '2554dbad66e1367b98f6c52cea0811b6', true, false),
('Allyssamyr'   , 2,  'player', null, true, false),
('Beudinio'     , 5,  'player', null, false, false),
('Bobbyz'       , 9,  'player', null, true, false),
('Boblemoche'   , 3,  'player', null, true, false),
('Brebouche'    , 8,  'player', null, true, false),
('Brk'          , 1,  'player', null, false, false),
('Brosko'       , 9,  'player', null, true, false),
('Bruh'         , 3,  'player', null, false, false),
('Callumlolz'   , 4,  'player', '8ccda50d6e0346eee3c691a94a797942', true, false),
('Drakenns'     , 8,  'player', null, false, false),
('Elementz'     , 2,  'player', null, false, false),
('Ez'           , 4,  'player', null, true, false),
('Gidgud'       , 7,  'player', null, true, false),
('Hanzaplast'   , 1,  'player', null, false, false),
('Ikith'        , 2,  'player', null, true, false),
('Jonasran'     , 4,  'player', null, true, false),
('Kaarr'        , 4,  'player', null, true, false),
('Karaelys'     , 1,  'player', null, true, false),
('Kenyâ'        , 7,  'player', null, true, false),
('Kresmi'       , 3,  'player', null, false, false),
('Kusogakî'     , 9,  'player', null, true, false),
('Kynosura'     , 2,  'player', null, true, false),
('Ladj'         , 8,  'player', '885eeaac6ca8a9456d6d73fbb6e7f12e', true, false),
('Lyaxus'       , 7,  'player', null, false, false),
('Lykwette'     , 8,  'player', null, true, false),
('Lylith'       , 1,  'player', null, true, false),
('Mergueztguez' , 13,  'player', null, true, false),
('Minatrix'     , 2,  'player', null, true, false),
('Need'         , 1,  'player', 'b1d38a948caf22ca343d9efc2d36729e', true, false),
('Nérull'       , 4,  'player', null, false, false),
('Néstor'       , 3,  'player', null, true, false),
('Nøwad'        , 9,  'player', null, true, false),
('Psykøhazard'  , 3,  'player', null, true, false),
('Punkhead'     , 4,  'player', null, false, false),
('Qweakzor'     , 6,  'player', null, true, false),
('Ràys'         , 4,  'player', null, true, false),
('Rektall'      , 3,  'player', null, true, false),
('Skau'         , 11,  'player', null, true, false),
('Sprawl'       , 8,  'player', null, false, false),
('Størmfury'    , 5,  'player', null, false, false),
('Suprême'      , 3,  'player', null, true, false),
('Synrj'        , 5,  'player', null, true, false),
('Tad'          , 7,  'player', null, true, false),
('Teimdall'     , 1,  'player', null, true, false),
('Tephrite'     , 5,  'player', null, true, false),
('Thorsen'      , 2,  'player', null, true, false),
('Throma'       , 9,  'player', null, true, false),
('Thünberg'     , 7,  'player', null, true, false),
('Ticcounet'    , 8,  'player', null, false, false),
('Titanesque'   , 4,  'player', null, false, false),
('Trackass'     , 1,  'player', null, true, false),
('Traqùs'       , 6,  'player', null, false, false),
('Vòlt'         , 2,  'player', null, false, false),
('Wid'          , 2,  'player', null, false, false),
('Xihfu'        , 5,  'player', null, true, false),
('Yx'           , 4,  'player', '752c3c7a999aa21ac20b19f172a8463d', true, false),
('Zapikote'     , 2,  'player', null, true, false),
('Zhantla'      , 7,  'player', null, false, false),
('Zykxx'        , 7,  'player', null, false, false),
('Zzeus'        , 2,  'player', null, true, false),
('Capoul'       , 5,  'player', null, true, false),
('Capriseum'    , 2,  'player', null, true, false),
('Chibraltar'   , 6,  'player', null, false, false),
('Draizon'      , 1,  'player', null, false, false),
('Easìer'       , 1,  'player', null, true, false),
('Fougasse'     , 8,  'player', null, false, false),
('Lusoline'     , 1,  'player', null, false, false),
('Malvotis'     , 3,  'player', null, false, false),
('Ogrim'        , 1,  'player', null, false, false),
('Olv'          , 2,  'player', null, false, false),
('Rognor'       , 7,  'player', null, false, false),
('Secaly'       , 4,  'player', null, false, false),
('Keiki'        , 7,  'player', null, true, false),
('Øupla'        , 4,  'player', null, true, false),
('Flash'        , 7,  'player', null, true, false),
('Knh'          , 5,  'player', null, true, false),
-- ('Øups'        , 7,  'player', null, true, false),
-- ('Slov'        , 7,  'player', null, true, false),
('Elgor'        , 9,  'player', null, true, false),
('Rassis'       , 3,  'player', null, true, false),
('Owhlord'      , 2,  'player', null, true, false),
('Angelus'      , 9,  'player', null, true, false),
('Felrik'       , 9,  'player', '26b0386e5b40cceb3be2ff00e2a32a8c', true, false),
('Kgr'          , 3,  'player', '4523bea82ba2f9c9d30644931d2dc35e', true, false),
('Kheya'        , 4,  'player', null, true, false),
('Caëdo'        , 4,  'player', '4432062f5df9be53c4c50741321644a4', true, false),
('Weezy'        , 3,  'player', null, true, false),
('Paren'        , 6,  'player', null, true, false),
('Munuxi'       , 1,  'player', null, true, false),
('Hyknoz'       , 3,  'player', null, true, false),
('Sopalin'      , 4,  'player', null, true, false),
('Gkz'          , 4,  'player', null, true, false),
('Zebaww'       , 6,  'player', null, true, false),
('Krijgs'       , 8,  'player', null, true, false),
('Volzam'       , 6,  'player', '3ab013c196ad5aeebc46b51d451daa08', true, false),
('Romek'        , 2,  'player', '8f7029a25f593e64a888e673ce5689a9', true, false),
('Rupt'         , 4,  'player', null, true, false),
('Ané'          , 9,  'player', null, true, false),
('Squeeze'      , 4,  'player', 'a8c934f5d23534db9db4db7b91c558e7', true, false),
('Blackgïft'    , 8,  'player', null, true, false),
('Skedone'      , 9,  'player', null, true, false),
('fucked-1'     , 1,  'player', null, false, false),
('Spydermatrix' , 2,  'player', null, true, false),
('Waira'        , 3,  'player', null, true, false),
('Panou'        , 7,  'player', null, true, false),
('Non Assigné'  , 5,  'player', null, false, false)
;

-- 1 - Prêtre
-- 2 - Mage
-- 3 - Démoniste
-- 4 - Voleur
-- 5 - Druide
-- 6 - Chasseur
-- 7 - Chaman
-- 8 - Guerrier Tank
-- 9 - Guerrier DPS
-- 10 - Paladin
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "PlayerMerit" ("meritId", "playerId", "date", "validated")
VALUES
(1, 1, '2019-10-10', true),
(2, 1, '2019-10-20', true),
(3, 1, '2019-10-20', false),
(4, 1, '2019-10-20', true);
 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Raids" ("donjonId", "date")
VALUES
(1, '2019-09-19'), -- 1
(1, '2019-09-22'), -- 2
(2, '2019-09-24'), -- 3
(1, '2019-09-25'), -- 4
(2, '2019-09-29'), -- 5
(1, '2019-09-29'), -- 6
(2, '2019-10-01'), -- 7
(1, '2019-10-01'), -- 8
(1, '2019-10-02'), -- 9
(1, '2019-10-06'), -- 10
(2, '2019-10-06'), -- 11
(1, '2019-10-09'), -- 12
(2, '2019-10-13'), -- 13
(1, '2019-10-16'), -- 14
(2, '2019-10-20'), -- 15
(1, '2019-10-20'), -- 16
(2, '2019-10-21'), -- 17
(1, '2019-10-23'), -- 18
(2, '2019-10-27'), -- 19
(1, '2019-10-27'), -- 20
(2, '2019-10-28'), -- 21
(1, '2019-10-30'), -- 22
(1, '2019-10-30'), -- 23
(2, '2019-11-03'), -- 24 - all ony
(2, '2019-11-05'), -- 24 - all ony
(1, '2019-11-06'), -- 25
(1, '2019-11-07'); -- 26

-- 1 => Molten Core
-- 2 => Onyxia Lair
-- 3 => Blackwing Lair
-- 4 => Ahn‘Qiraj Temple
-- 5 => Naxxramas
-- 6 => Ahn‘Qiraj Ruins
-- 7 => Zul‘Gurub


-- MC 2019-09-19
-- INSERT INTO "RaidPlayers" ("playerId", "raidId")
-- VALUES
-- (1, 1),
-- (1, 1);

-- MC 2019-09-22
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(2, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(2, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(2, (SELECT id FROM "Players" WHERE "name"='Ticcounet')),
(2, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(2, (SELECT id FROM "Players" WHERE "name"='Størmfury')),
(2, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(2, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(2, (SELECT id FROM "Players" WHERE "name"='Traqùs')),
(2, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(2, (SELECT id FROM "Players" WHERE "name"='Elementz')),
(2, (SELECT id FROM "Players" WHERE "name"='Kynosura')),
(2, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(2, (SELECT id FROM "Players" WHERE "name"='Vòlt')),
(2, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(2, (SELECT id FROM "Players" WHERE "name"='Hanzaplast')),
(2, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(2, (SELECT id FROM "Players" WHERE "name"='Nérull')),
(2, (SELECT id FROM "Players" WHERE "name"='Punkhead')),
(2, (SELECT id FROM "Players" WHERE "name"='Titanesque')),
(2, (SELECT id FROM "Players" WHERE "name"='Lyaxus')),
(2, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(2, (SELECT id FROM "Players" WHERE "name"='Affligeant')),
(2, (SELECT id FROM "Players" WHERE "name"='Bruh')),
(2, (SELECT id FROM "Players" WHERE "name"='Kresmi')),
(2, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(2, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(2, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(2, (SELECT id FROM "Players" WHERE "name"='Drakenns')),
(2, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(2, (SELECT id FROM "Players" WHERE "name"='Sprawl')),
(2, (SELECT id FROM "Players" WHERE "name"='Beudinio')),
(2, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(2, (SELECT id FROM "Players" WHERE "name"='Brk')),
(2, (SELECT id FROM "Players" WHERE "name"='Lylith')),
(2, (SELECT id FROM "Players" WHERE "name"='Skau')),
(2, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(2, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(2, (SELECT id FROM "Players" WHERE "name"='Zhantla')),
(2, (SELECT id FROM "Players" WHERE "name"='Zykxx'));

-- MC 2019-09-22
-- TODO onyxia


-- MC full guilde 2019-09-25
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(4, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(4, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(4, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(4, (SELECT id FROM "Players" WHERE "name"='Throma')),
(4, (SELECT id FROM "Players" WHERE "name"='Alk')),
(4, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(4, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(4, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(4, (SELECT id FROM "Players" WHERE "name"='Traqùs')),
(4, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(4, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(4, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(4, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(4, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(4, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(4, (SELECT id FROM "Players" WHERE "name"='Wid')),
(4, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(4, (SELECT id FROM "Players" WHERE "name"='Need')),
(4, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(4, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(4, (SELECT id FROM "Players" WHERE "name"='Ez')),
(4, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(4, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(4, (SELECT id FROM "Players" WHERE "name"='Yx')),
(4, (SELECT id FROM "Players" WHERE "name"='Lyaxus')),
(4, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(4, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(4, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(4, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(4, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(4, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(4, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(4, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(4, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(4, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(4, (SELECT id FROM "Players" WHERE "name"='Teimdall')),
(4, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(4, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(4, (SELECT id FROM "Players" WHERE "name"='Kenyâ'));
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(4, (SELECT id FROM "Players" WHERE "name"='Abramus'), true)
-- TODO finir de notez ceux qui ont passer leur tour
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true)
;

-- Ony full guilde 2019-09-29
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(5, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(5, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(5, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(5, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(5, (SELECT id FROM "Players" WHERE "name"='Alk')),
(5, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(5, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(5, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(5, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(5, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(5, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(5, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(5, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(5, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(5, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(5, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(5, (SELECT id FROM "Players" WHERE "name"='Ez')),
(5, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(5, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(5, (SELECT id FROM "Players" WHERE "name"='Yx')),
(5, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(5, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(5, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(5, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(5, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(5, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(5, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(5, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(5, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(5, (SELECT id FROM "Players" WHERE "name"='Throma')),
(5, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(5, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(5, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(5, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(5, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(5, (SELECT id FROM "Players" WHERE "name"='Need')),
(5, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(5, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(5, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(5, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));


-- MC 3 bosses first DOMO 2019-09-29
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(6, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(6, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(6, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(6, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(6, (SELECT id FROM "Players" WHERE "name"='Alk')),
(6, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(6, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(6, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(6, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(6, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(6, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(6, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(6, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(6, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(6, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(6, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(6, (SELECT id FROM "Players" WHERE "name"='Ez')),
(6, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(6, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(6, (SELECT id FROM "Players" WHERE "name"='Yx')),
(6, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(6, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(6, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(6, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(6, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(6, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(6, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(6, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(6, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(6, (SELECT id FROM "Players" WHERE "name"='Throma')),
(6, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(6, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(6, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(6, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(6, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(6, (SELECT id FROM "Players" WHERE "name"='Need')),
(6, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(6, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(6, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(6, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(6, (SELECT id FROM "Players" WHERE "name"='Traqùs'), true);


-- Ony avant les try ragnaros 2019-10-01
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(7, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(7, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(7, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(7, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(7, (SELECT id FROM "Players" WHERE "name"='Throma')),
(7, (SELECT id FROM "Players" WHERE "name"='Alk')),
(7, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(7, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(7, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(7, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(7, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(7, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(7, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(7, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(7, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(7, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(7, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(7, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(7, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(7, (SELECT id FROM "Players" WHERE "name"='Ez')),
(7, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(7, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(7, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(7, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(7, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(7, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(7, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(7, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(7, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(7, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(7, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(7, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(7, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(7, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(7, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(7, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(7, (SELECT id FROM "Players" WHERE "name"='Need')),
(7, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(7, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(7, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(7, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));

-- try ragnaros 2019-10-01
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(8, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(8, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(8, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(8, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(8, (SELECT id FROM "Players" WHERE "name"='Throma')),
(8, (SELECT id FROM "Players" WHERE "name"='Alk')),
(8, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(8, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(8, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(8, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(8, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(8, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(8, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(8, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(8, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(8, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(8, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(8, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(8, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(8, (SELECT id FROM "Players" WHERE "name"='Ez')),
(8, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(8, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(8, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(8, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(8, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(8, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(8, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(8, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(8, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(8, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(8, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(8, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(8, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(8, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(8, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(8, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(8, (SELECT id FROM "Players" WHERE "name"='Need')),
(8, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(8, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(8, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(8, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));


-- MC 8 bosses 2019-10-02 (pas de raidstats)
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- manually entered :
(9, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(9, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(9, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(9, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(9, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(9, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(9, (SELECT id FROM "Players" WHERE "name"='Ez')),
(9, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(9, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(9, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(9, (SELECT id FROM "Players" WHERE "name"='Alk')),
(9, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(9, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(9, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(9, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(9, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(9, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(9, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(9, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(9, (SELECT id FROM "Players" WHERE "name"='Synrj'))
;
-- TODO get screenshot or stream to complete attendees

-- MC first down ragna 2019-10-06
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(10, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(10, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(10, (SELECT id FROM "Players" WHERE "name"='Alk')),
(10, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(10, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(10, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(10, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(10, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(10, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(10, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(10, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(10, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(10, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(10, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(10, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(10, (SELECT id FROM "Players" WHERE "name"='Ez')),
(10, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(10, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(10, (SELECT id FROM "Players" WHERE "name"='Yx')),
(10, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(10, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(10, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(10, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(10, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(10, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(10, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(10, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(10, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(10, (SELECT id FROM "Players" WHERE "name"='Throma')),
(10, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(10, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(10, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(10, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(10, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(10, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(10, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(10, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(10, (SELECT id FROM "Players" WHERE "name"='Lums')),
(10, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;

-- Onyxia down post ragna 2019-10-06
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(11, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(11, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(11, (SELECT id FROM "Players" WHERE "name"='Alk')),
(11, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(11, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(11, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(11, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(11, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(11, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(11, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(11, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(11, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(11, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(11, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(11, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(11, (SELECT id FROM "Players" WHERE "name"='Ez')),
(11, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(11, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(11, (SELECT id FROM "Players" WHERE "name"='Yx')),
(11, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(11, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(11, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(11, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(11, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(11, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(11, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(11, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(11, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(11, (SELECT id FROM "Players" WHERE "name"='Throma')),
(11, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(11, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(11, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(11, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(11, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(11, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(11, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(11, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(11, (SELECT id FROM "Players" WHERE "name"='Lums')),
(11, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


-- Full MC - 2019-10-09
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(12, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(12, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(12, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(12, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(12, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(12, (SELECT id FROM "Players" WHERE "name"='Alk')),
(12, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(12, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(12, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(12, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(12, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(12, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(12, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(12, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(12, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(12, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(12, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(12, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(12, (SELECT id FROM "Players" WHERE "name"='Ez')),
(12, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(12, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(12, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(12, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(12, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(12, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(12, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(12, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(12, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(12, (SELECT id FROM "Players" WHERE "name"='Throma')),
(12, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(12, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(12, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(12, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(12, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(12, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(12, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(12, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(12, (SELECT id FROM "Players" WHERE "name"='Lums')),
(12, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(12, (SELECT id FROM "Players" WHERE "name"='Tad'))
;
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(12, (SELECT id FROM "Players" WHERE "name"='Ikith'), true);


-- double id onyxia - 2019-10-13
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- raid Devilhunter
(13, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(13, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(13, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(13, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(13, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(13, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(13, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(13, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(13, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(13, (SELECT id FROM "Players" WHERE "name"='Ez')),
(13, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(13, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(13, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(13, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(13, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(13, (SELECT id FROM "Players" WHERE "name"='Throma')),
(13, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(13, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(13, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(13, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(13, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(13, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(13, (SELECT id FROM "Players" WHERE "name"='Tad')),
(13, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- raid Lums
(13, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(13, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(13, (SELECT id FROM "Players" WHERE "name"='Alk')),
(13, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(13, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(13, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(13, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(13, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(13, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(13, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(13, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(13, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(13, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(13, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(13, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(13, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(13, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(13, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(13, (SELECT id FROM "Players" WHERE "name"='Skau')),
(13, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(13, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(13, (SELECT id FROM "Players" WHERE "name"='Lums'));

-- double id MC + Pickup Elgor - 2019-10-16
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- raid Devilhunter
(14, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(14, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(14, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(14, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(14, (SELECT id FROM "Players" WHERE "name"='Alk')),
(14, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(14, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(14, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(14, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(14, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(14, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(14, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(14, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(14, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(14, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(14, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(14, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(14, (SELECT id FROM "Players" WHERE "name"='Ez')),
(14, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(14, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(14, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(14, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(14, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(14, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(14, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(14, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(14, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(14, (SELECT id FROM "Players" WHERE "name"='Throma')),
(14, (SELECT id FROM "Players" WHERE "name"='Knh')),
(14, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(14, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(14, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(14, (SELECT id FROM "Players" WHERE "name"='Need')),
(14, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(14, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(14, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(14, (SELECT id FROM "Players" WHERE "name"='Lums')),
(14, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(14, (SELECT id FROM "Players" WHERE "name"='Tad')),
(14, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- raid Elgor
(14, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(14, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Mmeeuh')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Leugimdetroy')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Orcgasmïk')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Désølé')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Hydroxyde')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Linze')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Løbø')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Phoen')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Skyral')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Xidie')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Troispoules')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Alphaketa')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Coldgaze')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Jeunecitron')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Mebs')),
(14, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(14, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Jây')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Pitbuff')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Ragegueg')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Relma')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Aragonia')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Dukine')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Paulotemple')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Soralock')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Dùf')),
(14, (SELECT id FROM "Players" WHERE "name"='Elgor')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Underik')),
(14, (SELECT id FROM "Players" WHERE "name"='Capoul')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Djowcoco')),
(14, (SELECT id FROM "Players" WHERE "name"='Easìer')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Kikootoubib')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Maestrya')),
(14, (SELECT id FROM "Players" WHERE "name"='Skau')),
(14, (SELECT id FROM "Players" WHERE "name"='Flash')),
(14, (SELECT id FROM "Players" WHERE "name"='Keiki'))
-- (14, (SELECT id FROM "Players" WHERE "name"='Slov')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Øups'))

;


-- double id onyxia - 2019-10-20
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- Raid deiv
(15, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(15, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(15, (SELECT id FROM "Players" WHERE "name"='Alk')),
(15, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(15, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(15, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(15, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(15, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(15, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(15, (SELECT id FROM "Players" WHERE "name"='Ez')),
(15, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(15, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(15, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(15, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(15, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(15, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(15, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(15, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(15, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(15, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(15, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(15, (SELECT id FROM "Players" WHERE "name"='Need')),
(15, (SELECT id FROM "Players" WHERE "name"='Lums')),
(15, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(15, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- Raid devilhunter
(15, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(15, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(15, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(15, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(15, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(15, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(15, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(15, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(15, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(15, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(15, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(15, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(15, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(15, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(15, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(15, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(15, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(15, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(15, (SELECT id FROM "Players" WHERE "name"='Throma')),
(15, (SELECT id FROM "Players" WHERE "name"='Knh')),
(15, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(15, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(15, (SELECT id FROM "Players" WHERE "name"='Skau')),
(15, (SELECT id FROM "Players" WHERE "name"='Flash')),
(15, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(15, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(15, (SELECT id FROM "Players" WHERE "name"='Kenyâ'))
;


-- fin MC elgor - 2019-10-20
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(16, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(16, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(16, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Relma')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Leugimdetroy')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Orcgasmïk')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Dohlol')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Désølé')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Linze')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Loanagain')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Lollÿ')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Løbø')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Phoen')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Pyrobolt')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Skyral')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Troispoules')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Alphaketa')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Atréides')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Coldgaze')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Jeunecitron')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Mebs')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Sopalin')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Swyyt')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Wishmaster')),
(16, (SELECT id FROM "Players" WHERE "name"='Øupla')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Aragonia')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Paulotemple')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Soralock')),
(16, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(16, (SELECT id FROM "Players" WHERE "name"='Capoul')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Djowcoco')),
(16, (SELECT id FROM "Players" WHERE "name"='Easìer')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Kikootoubib')),
(16, (SELECT id FROM "Players" WHERE "name"='Skau')),
(16, (SELECT id FROM "Players" WHERE "name"='Flash')),
(16, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(16, (SELECT id FROM "Players" WHERE "name"='Keiki'))
-- (16, (SELECT id FROM "Players" WHERE "name"='Pitbuff')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Ragegueg')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Slov')),
;

-- double id onyxia - 2019-10-17
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- devilhunter
(17, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(17, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(17, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(17, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(17, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(17, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(17, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(17, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(17, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(17, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(17, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(17, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(17, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(17, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(17, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(17, (SELECT id FROM "Players" WHERE "name"='Felrik')),
(17, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(17, (SELECT id FROM "Players" WHERE "name"='Knh')),
(17, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(17, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(17, (SELECT id FROM "Players" WHERE "name"='Skau')),
(17, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(17, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(17, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- ragegoriath
(17, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(17, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(17, (SELECT id FROM "Players" WHERE "name"='Alk')),
(17, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(17, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(17, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(17, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(17, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(17, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(17, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(17, (SELECT id FROM "Players" WHERE "name"='Ez')),
(17, (SELECT id FROM "Players" WHERE "name"='Yx')),
(17, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(17, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(17, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(17, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(17, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(17, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(17, (SELECT id FROM "Players" WHERE "name"='Throma')),
(17, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(17, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(17, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(17, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(17, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(17, (SELECT id FROM "Players" WHERE "name"='Flash')),
(17, (SELECT id FROM "Players" WHERE "name"='Lums')),
(17, (SELECT id FROM "Players" WHERE "name"='Tad'))
;


-- RAID 1 ragnaros (soir du bug) 23/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(18, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(18, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(18, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(18, (SELECT id FROM "Players" WHERE "name"='Alk')),
(18, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(18, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(18, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(18, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(18, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(18, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(18, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(18, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(18, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(18, (SELECT id FROM "Players" WHERE "name"='Caëdo')),
(18, (SELECT id FROM "Players" WHERE "name"='Ez')),
(18, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(18, (SELECT id FROM "Players" WHERE "name"='Kheya')),
(18, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(18, (SELECT id FROM "Players" WHERE "name"='Yx')),
(18, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(18, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(18, (SELECT id FROM "Players" WHERE "name"='Kgr')),
(18, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(18, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(18, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(18, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(18, (SELECT id FROM "Players" WHERE "name"='Throma')),
(18, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(18, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(18, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(18, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(18, (SELECT id FROM "Players" WHERE "name"='Skau')),
(18, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(18, (SELECT id FROM "Players" WHERE "name"='Flash')),
(18, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(18, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(18, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


-- Onyxia Raid 1 : 27/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(19, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(19, (SELECT id FROM "Players" WHERE "name"='Throma')),
(19, (SELECT id FROM "Players" WHERE "name"='Alk')),
(19, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(19, (SELECT id FROM "Players" WHERE "name"='Paren')),
(19, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(19, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(19, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(19, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(19, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(19, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(19, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(19, (SELECT id FROM "Players" WHERE "name"='Caëdo')),
(19, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(19, (SELECT id FROM "Players" WHERE "name"='Ez')),
(19, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(19, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(19, (SELECT id FROM "Players" WHERE "name"='Yx')),
(19, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(19, (SELECT id FROM "Players" WHERE "name"='Hyknoz')),
(19, (SELECT id FROM "Players" WHERE "name"='Kgr')),
(19, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(19, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(19, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(19, (SELECT id FROM "Players" WHERE "name"='Weezy')),
(19, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(19, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(19, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(19, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(19, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(19, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(19, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(19, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(19, (SELECT id FROM "Players" WHERE "name"='Skau')),
(19, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(19, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


-- MC sauvetage Raid 2 : 27/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(20, (SELECT id FROM "Players" WHERE "name"='Krijgs')),
(20, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(20, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(20, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Powpit')),
(20, (SELECT id FROM "Players" WHERE "name"='Volzam')),
(20, (SELECT id FROM "Players" WHERE "name"='Zebaww')),
(20, (SELECT id FROM "Players" WHERE "name"='Adblock')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Anahita')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Dumbledog')),
(20, (SELECT id FROM "Players" WHERE "name"='Romek')),
(20, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Malstep')),
(20, (SELECT id FROM "Players" WHERE "name"='Gkz')),
(20, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Lihàtarekt')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Qaen')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Shåðøw')),
(20, (SELECT id FROM "Players" WHERE "name"='Sopalin')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Yuzumi')),
(20, (SELECT id FROM "Players" WHERE "name"='Néstor')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Osdryon')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Rendalfllag')),
(20, (SELECT id FROM "Players" WHERE "name"='Suprême')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Waira')),
(20, (SELECT id FROM "Players" WHERE "name"='Brosko')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Skedone')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Warning')),
(20, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(20, (SELECT id FROM "Players" WHERE "name"='Knh')),
(20, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Bayne')),
(20, (SELECT id FROM "Players" WHERE "name"='Deiv')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Doky')),
(20, (SELECT id FROM "Players" WHERE "name"='Need')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Splendo')),
(20, (SELECT id FROM "Players" WHERE "name"='Trackass')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Daggot')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Gengrous')),
(20, (SELECT id FROM "Players" WHERE "name"='Tad'))
;



-- Onyxia Raid 1 : 28/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(21, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(21, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(21, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(21, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(21, (SELECT id FROM "Players" WHERE "name"='Romek')),
(21, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(21, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(21, (SELECT id FROM "Players" WHERE "name"='Gkz')),
(21, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(21, (SELECT id FROM "Players" WHERE "name"='Rupt')),
(21, (SELECT id FROM "Players" WHERE "name"='Squeeze')),
(21, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(21, (SELECT id FROM "Players" WHERE "name"='Ané')),
(21, (SELECT id FROM "Players" WHERE "name"='Felrik')),
(21, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(21, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(21, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(21, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(21, (SELECT id FROM "Players" WHERE "name"='Need')),
(21, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(21, (SELECT id FROM "Players" WHERE "name"='Lums')),
(21, (SELECT id FROM "Players" WHERE "name"='Tad')),
(21, (SELECT id FROM "Players" WHERE "name"='Thünberg'))
;
 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Hakken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes d‘arcaniste')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de traqueur de géant')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'))
-- ( 1,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Bartok'), -- TODO pseudo exact ou BTO ?
--   (SELECT id FROM "Items" WHERE "name"=
--   'Lame à tranchant d‘obsidienne')),

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Hanzaplast'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Beudinio'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières cénariennes')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Kresmi'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants cénariens')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Rektall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Sprawl'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Titanesque'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'))
-- ( 2, TODO
--   (SELECT id FROM "Players" WHERE "name"=
--   '?????'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'loot sulfuron')),

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de dragon')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tendon de dragon noir adulte'))
-- TODO autres loots sur onyxia ?
  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de Gangrecoeur')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes Rageterre')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de puissance')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Gidgud'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets Rageterre')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de puissance')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Teimdall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collerette de prophétie')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières cénariennes')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Suprême'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de traqueur de géant'))

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Rektall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Crâne de Némésis')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'))

  ;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards cénariens')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mantelet de prophétie')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de traqueur de géant')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Plastron du tueur de la nuit')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Ikith'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'))


  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Hakken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tendon de dragon noir adulte')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'))

  ;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 8,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre'))

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Allyssamyr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Nøwad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sandales de puissance')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Trackass'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Zapikote'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne d‘arcaniste')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de Gangrecoeur')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants d‘arcaniste')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Trackass'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mantelet de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Plastron du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Habit cénarien')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘arcaniste'))

  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de puissance')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'L‘Oeil de la divinité')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de courroux')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Stormrage')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Abramus'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'))
;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tendon de dragon noir adulte')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Auréole de transcendance')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards Rageterre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de traqueur de géant')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Nøwad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Lums'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Suprême'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère')),
-- TODO add lien de cherchevent
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Throma'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de prophétie')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants cénariens')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards cénariens')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulettes de traqueur de géant')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Zapikote'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘arcaniste')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon Rougecroc')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Stormrage')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'))

;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
-- raid devilhunter
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Capriseum'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
-- raid Lums
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Auréole de transcendance')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ikith'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
-- raid devilhunter
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de puissance')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Capriseum'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ràys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collerette de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Kusogakî'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Knh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Lums'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulettes Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture cénarienne')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'L‘Oeil de la divinité')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Throma'),
  (SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon Rougecroc')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de courroux')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon')),
-- raid elgor
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de puissance')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Elgor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Øupla'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Skau'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Gidgud'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Habit Rageterre'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
-- raid devilhunter
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Abramus'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Knh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),

-- raid deiv
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia'))
;


INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
( 16,
  (SELECT id FROM "Players" WHERE "name"=
  'Flash'),
  (SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
-- devilhunter
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Elgor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Capriseum'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Heaume de courroux'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Kusogakî'),
  (SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
-- ragegoriath
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Elgor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Néstor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Tad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 17,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia'))
;


-- MC raid 1 propre
INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Lucifron')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes Rageterre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Lucifron')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Bobbyz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Easìer'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets Rageterre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Gehennas')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Flash'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Gehennas')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Easìer'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collerette de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Garr')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque Rageterre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Garr')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Garr')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Skau'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Baron Geddon')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières cénariennes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Baron Geddon')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Kgr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Shazzrah')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de traqueur de géant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Shazzrah')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Sulfuron Harbinger')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulettes de traqueur de géant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Sulfuron Harbinger')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Golemagg the Incinerator')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Rassis'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Golemagg the Incinerator')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Golemagg the Incinerator')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Stormrage'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Némésis'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Bobbyz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),

( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Øupla'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de Gangrecoeur'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Allyssamyr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Manchettes d‘arcaniste'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Rassis'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de Gangrecoeur'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Easìer'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 18,
  (SELECT id FROM "Players" WHERE "name"=
  'Skau'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash'))
;

-- ony 27/10
INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
( 19,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Crâne de Némésis'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 19,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Heaume de courroux'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 19,
  (SELECT id FROM "Players" WHERE "name"=
  'Throma'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 19,
  (SELECT id FROM "Players" WHERE "name"=
  'Hyknoz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 19,
  (SELECT id FROM "Players" WHERE "name"=
  'Angelus'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia'))
;
INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Osdyron'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Gants de Gangrecoeur'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Lucifron')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes cénariennes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Lucifron')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Krijgs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon de prophétie'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Magmadar')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Zebaww'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Lums'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards Rageterre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
-- ( 20, -- TODO
--   (SELECT id FROM "Players" WHERE "name"=
--   'Xihfu'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Gants du tueur de la nuit'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Gehennas')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Lihàtarekt'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Pantalon en écailles de salamandre'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Gehennas')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Rendalfllag'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Cornes de Gangrecoeur'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Garr')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Tad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque Rageterre'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Garr')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Warning'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Lame à tranchant d‘obsidienne'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Garr')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Powpit'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Solerets du Marcheflammes'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Baron Geddon')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Dumbledog'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Mantelet d‘arcaniste'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Baron Geddon')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Knh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants cénariens'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Shazzrah')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Yuzumi'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Bottes du tueur de la nuit'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Shazzrah')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de traqueur de géant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Krijgs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Sulfuron Harbinger')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Doky'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Mantelet de prophétie'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Sulfuron Harbinger')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Gkz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Trash')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Golemagg the Incinerator')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Osdryon'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Robe de Gangrecoeur'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Golemagg the Incinerator')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Suprême'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Golemagg the Incinerator')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Tad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Zebaww'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Majordomo Executus')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Dumbledog'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Ceinture d‘arcaniste'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Trash')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Tad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières des dix tempêtes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),
-- ( 20,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Gengrous'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'Jambières des dix tempêtes'),
--   (SELECT id FROM "Bosses" WHERE "name"=
--   'Ragnaros')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Néstor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros')),
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Ragnaros'))

;


INSERT INTO "Loots" ("raidId", "playerId", "itemId", "bossId")
VALUES
( 21,
  (SELECT id FROM "Players" WHERE "name"=
  'Romek'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 21,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 21,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 21,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia')),
( 21,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Onyxia'))

;