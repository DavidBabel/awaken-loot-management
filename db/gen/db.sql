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
  "role" varchar,
  "password" varchar,
  "active" boolean DEFAULT true,
  "inRoster" boolean DEFAULT false
);
comment on table "Players" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Players" ("id");


CREATE TABLE "Merit" (
  "id" SERIAL PRIMARY KEY,
  "categorie" varchar,
  "name" varchar,
  "comment" varchar DEFAULT '',
  "value" int,
  "active" boolean DEFAULT true
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
  "prio" boolean NOT NULL
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
  "active" boolean DEFAULT false
);
comment on table "Donjons" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Donjons" ("id");


CREATE TABLE "Raids" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "donjonId" int NOT NULL,
  "date" varchar,
  "active" boolean DEFAULT true
);
comment on table "Raids" is E'@omit delete';
CREATE UNIQUE INDEX ON "Raids" ("id");


CREATE TABLE "RaidPlayers" (
    "id" SERIAL PRIMARY KEY,
    "playerId" int NOT NULL,
    "raidId" int NOT NULL,
    "passed" boolean DEFAULT false
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
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Items" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id"); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Classes" ("name", "color")
VALUES
('Prêtre',        '#FFFFFF'),
('Mage',          '#69CCF0'),
('Démoniste',     '#9482C9'),
('Voleur',        '#FFF569'),
('Druide',        '#FF7D0A'),
('Chasseur',      '#ABD473'),
('Chaman',        '#0070DE'),
('Guerrier Tank', '#C79C6E'),
('Guerrier DPS',  '#C41F3B'),
('Paladin',       '#F58CBA');

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
INSERT INTO "Donjons" ("name", "shortName", "active")
VALUES
('Molten Core', 'MC', true),
('Onyxia Lair', 'Ony', true),
('Blackwing Lair', 'BWL', false),
('Ahn‘Qiraj Temple', 'AQ40', false),
('Naxxramas', 'Naxx', false),
('Ahn‘Qiraj Ruins', 'AQ20', false),
('Zul‘Gurub', 'ZG', false);

INSERT INTO "Bosses" ("name", "donjonId" )
VALUES
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='ZG')),
('Lucifron', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Magmadar', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Gehennas', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Garr', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Shazzrah', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Baron Geddon', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Sulfuron Harbinger', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Golemagg the Incinerator', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Majordomo Executus', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Ragnaros', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Onyxia', (SELECT id FROM "Donjons" WHERE "shortName"='Ony')),
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
-- REDO ZG -- SAFE BEGIN FOR CONCAT
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
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
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
('Oeil de Sulfuras',17204,(SELECT id FROM "Classes" WHERE "name"=''), 3);

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

-- molten core hors set
INSERT INTO "ClassItem" ("itemId","classId","prio")
VALUES
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de la Terre profonde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),


  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true)
;

-- onyxia
INSERT INTO "ClassItem" ("itemId","classId","prio")
VALUES
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true)
;


-- ('Prêtre',        '#FFFFFF'),
-- ('Mage',          '#69CCF0'),
-- ('Démoniste',     '#9482C9'),
-- ('Voleur',        '#FFF569'),
-- ('Druide',        '#FF7D0A'),
-- ('Chasseur',      '#ABD473'),
-- ('Chaman',        '#0070DE'),
-- ('Guerrier Tank', '#C79C6E'),
-- ('Guerrier DPS',  '#C41F3B'),
-- ('Paladin',       '#F58CBA'); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Merit" ("value", "categorie", "name", "comment")
VALUES

(10, 'Enchantement', 'Casque', 'libram ou ZG'),
(15, 'Enchantement', 'Epaulettes', 'exalté ZG ou +5 all resist'),
(05, 'Enchantement', 'Cape', ''),
(10, 'Enchantement', 'Plastron', ''),
(10, 'Enchantement', 'Bracelet', ''),
(10, 'Enchantement', 'Gants', ''),
(10, 'Enchantement', 'Pantalon', 'libram ou ZG'),
(10, 'Enchantement', 'Bottes', ''),

(10, 'Enchantement', 'Arme droite', ''),
(10, 'Enchantement', 'Arme gauche', 'automatique pour les armes 2 mains'),
(05, 'Enchantement', 'Arme distance', ''),


(10, 'Pré-raid', 'Casque', ''),
(10, 'Pré-raid', 'Collier', ''),
(10, 'Pré-raid', 'Epaulettes', ''),
(10, 'Pré-raid', 'Cape', ''),
(10, 'Pré-raid', 'Plastron', ''),
(10, 'Pré-raid', 'Bracelet', ''),
(10, 'Pré-raid', 'Gants', ''),
(10, 'Pré-raid', 'Ceinture', ''),
(10, 'Pré-raid', 'Pantalon', ''),
(10, 'Pré-raid', 'Bottes', ''),
(10, 'Pré-raid', 'Anneau 1', ''),
(10, 'Pré-raid', 'Anneau 2', ''),
(10, 'Pré-raid', 'Bijou 1', ''),
(10, 'Pré-raid', 'Bijou 2', ''),

(10, 'Pré-raid', 'Arme droite', ''),
(10, 'Pré-raid', 'Arme gauche', 'automatique pour les armes 2 mains'),
(10, 'Pré-raid', 'Arme distance / relique / totem', ''),


(05, 'T1 / R10', 'Casque', ''),
(05, 'T1 / R10', 'Collier', ''),
(05, 'T1 / R10', 'Epaulettes', ''),
(05, 'T1 / R10', 'Cape', ''),
(05, 'T1 / R10', 'Plastron', ''),
(05, 'T1 / R10', 'Bracelet', ''),
(05, 'T1 / R10', 'Gants', ''),
(05, 'T1 / R10', 'Ceinture', ''),
(05, 'T1 / R10', 'Pantalon', ''),
(05, 'T1 / R10', 'Bottes', ''),
(05, 'T1 / R10', 'Anneau 1', ''),
(05, 'T1 / R10', 'Anneau 2', ''),
(05, 'T1 / R10', 'Bijou 1', ''),
(05, 'T1 / R10', 'Bijou 2', ''),

(05, 'T1 / R10', 'Arme droite', ''),
(05, 'T1 / R10', 'Arme gauche', 'automatique pour les armes 2 mains'),
(05, 'T1 / R10', 'Arme distance / relique / totem', ''),


(05, 'T2 / R13', 'Casque', ''),
(05, 'T2 / R13', 'Collier', ''),
(05, 'T2 / R13', 'Epaulettes', ''),
(05, 'T2 / R13', 'Cape', ''),
(05, 'T2 / R13', 'Plastron', ''),
(05, 'T2 / R13', 'Bracelet', ''),
(05, 'T2 / R13', 'Gants', ''),
(05, 'T2 / R13', 'Ceinture', ''),
(05, 'T2 / R13', 'Pantalon', ''),
(05, 'T2 / R13', 'Bottes', ''),
(05, 'T2 / R13', 'Anneau 1', ''),
(05, 'T2 / R13', 'Anneau 2', ''),
(05, 'T2 / R13', 'Bijou 1', ''),
(05, 'T2 / R13', 'Bijou 2', ''),

(05, 'T2 / R13', 'Arme droite', ''),
(05, 'T2 / R13', 'Arme gauche', 'automatique pour les armes 2 mains'),
(05, 'T2 / R13', 'Arme distance / relique / totem', ''),


(05, 'T3 / R14', 'Casque', ''),
(05, 'T3 / R14', 'Collier', ''),
(05, 'T3 / R14', 'Epaulettes', ''),
(05, 'T3 / R14', 'Cape', ''),
(05, 'T3 / R14', 'Plastron', ''),
(05, 'T3 / R14', 'Bracelet', ''),
(05, 'T3 / R14', 'Gants', ''),
(05, 'T3 / R14', 'Ceinture', ''),
(05, 'T3 / R14', 'Pantalon', ''),
(05, 'T3 / R14', 'Bottes', ''),
(05, 'T3 / R14', 'Anneau 1', ''),
(05, 'T3 / R14', 'Anneau 2', ''),
(05, 'T3 / R14', 'Bijou 1', ''),
(05, 'T3 / R14', 'Bijou 2', ''),

(05, 'T3 / R14', 'Arme droite', ''),
(05, 'T3 / R14', 'Arme gauche', 'automatique pour les armes 2 mains'),
(05, 'T3 / R14', 'Arme distance / relique / totem', ''),


(10, 'Spécialisation', 'Publiée sur le forum', ''),
(15, 'Spécialisation', 'PvE HL', ''),


(05, 'Communauté', 'Présenté sur les forums', ''),
(05, 'Communauté', 'Photo dans le trombinoscope', ''),
(03, 'Communauté', 'Signer la charte de guilde', ''),
(05, 'Communauté', 'Porter le tabard de guilde', ''),
(03, 'Communauté', 'Avoir un avatar sur le forum', ''),
(03, 'Communauté', 'Avoir le même nom sur le forum qu‘en jeu', ''),
(03, 'Communauté', 'Avoir un avatar sur le Discord', ''),
(03, 'Communauté', 'Avoir le même nom sur le Discord qu‘en jeu', ''),
(02, 'Communauté', 'Avoir un micro correctement configuré sur Discord', ''),

(05, 'Communauté', '50 messages sur le forum', ''),
(05, 'Communauté', '200 messages sur le forum', ''),
(05, 'Communauté', '500 messages sur le forum', ''),


(15, 'Farm Guilde', 'Semaine courante', ''),
(15, 'Farm Guilde', 'Semaine précédente', ''),
(15, 'Farm Guilde', 'Semaine antépénultième', ''),


(05, 'Raid', 'Quintessence aquatique', ''),

(10, 'Raid', 'Toujours sous consommables', 'Boss + Trash'),
(07, 'Raid', 'Sous consommables quand nécessaire', 'A ajouter si "Toujours sous consommables"'),
(03, 'Raid', 'La bouffe, c‘est déjà pas mal', ''),
(03, 'Raid', '300 en bandages', ''),

(03, 'Raid', 'Toujours des popos dans le sac', 'Mana et Vie'),

(10, 'Raid', 'Grade PvP 6 : Garde de Pierre : Accès aux potions', ''),
(10, 'Raid', 'Exalté Altérac (pré-raid épique)', ''),

(10, 'Raid', 'Stuff +140 résistance feu unbuff', ''),
(10, 'Raid', 'Stuff +140 résistance nature unbuff', ''),
(10, 'Raid', 'Stuff +140 résistance givre unbuff', ''),

(10, 'Raid', 'Avoir son sac Onyxia', ''),

(15, 'Merite de Classe', 'Démoniste : Avoir 150+ résist ombre unbuff', ''),
(15, 'Merite de Classe', 'Mage : Avoir le pain rang max', ''),
(15, 'Merite de Classe', 'Prêtre : Avoir sa suite de fauve', ''),
(15, 'Merite de Classe', 'Shadow Prêtre : Avoir son anathème enchantée', ''),
(15, 'Merite de Classe', 'Druide : Jouer au mouseover', ''),
(15, 'Merite de Classe', 'Voleur : Avoir un stuff 140+ RN unbuff', ''),
(15, 'Merite de Classe', 'Chasseur : Avoir son arc épique', ''),
(15, 'Merite de Classe', 'Chaman : Jouer au mouseover', ''),
(15, 'Merite de Classe', 'Chamélio : Avoir sa Crépuscule', ''),
(15, 'Merite de Classe', 'Guerrier DD : Avoir un stuff avec 380+ def', ''),
(15, 'Merite de Classe', 'Guerrier tank : Avoir 200+ RF unbuff', ''),


(-25, 'Malus', 'J‘ai mal saisie un mérite et je me suis fait chopper', ''),
(-10, 'Malus', 'Je suis arriver en retard en raid', ''),
(-10, 'Malus', 'J‘ai fais wipe le raid', '')
-- (-10, 'Malus', 'J‘ai fais wipe le raid', ''),
;
 -- SAFE BEGIN FOR CONCAT

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
('classMaster'  , 1,  'classMaster', 'ca114be619ce539ca093ee7121acf98b', false, false),
('player'       , 1,  'player', '0cd8250454e6003c270680b4fca3583c', false, false),
('Lums'         , 7,  'player', null, true, true),
('Deiv'         , 1,  'player', '5a29ca97ad30bb6484a3832042ff7f2b', true, true),
('Krigen'       , 8,  'player', null, true, true),
('Cocobanjo'    , 4,  'player', null, true, true),
('Nozil'        , 6,  'player', '950382a04140bcdab437600b0928ec63', true, true),
('Oscuro'       , 9,  'player', null, true, true),
('Paffë'        , 5,  'player', null, true, true),
('Skwäsh'       , 1,  'player', '2f8b09d7750539ba0d7853cd1eae78ee', true, true),
('Tàel'         , 3,  'player', null, true, true),
('Ragegoriath'  , 8,  'player', 'e3b557b6f939ad38f1610dd5102b1ee7', true, true),
('Abramus'      , 2,  'player', null, true, true),
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
('Callumlolz'   , 4,  'player', null, true, false),
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
('Ladj'         , 8,  'player', null, true, false),
('Lyaxus'       , 7,  'player', null, false, false),
('Lykwette'     , 8,  'player', null, true, false),
('Lylith'       , 1,  'player', null, true, false),
('Mergueztguez' , 7,  'player', null, true, false),
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
('Skau'         , 1,  'player', null, false, false),
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
('Volzam'       , 6,  'player', null, true, false),
('Romek'        , 2,  'player', '8f7029a25f593e64a888e673ce5689a9', true, false),
('Rupt'         , 4,  'player', null, true, false),
('Ané'          , 9,  'player', null, true, false),
('Squeeze'      , 4,  'player', 'a8c934f5d23534db9db4db7b91c558e7', true, false)
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
  'Casque de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef du tueur de la nuit')),
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
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'),
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
( 20,
  (SELECT id FROM "Players" WHERE "name"=
  'Xihfu'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants du tueur de la nuit'),
  (SELECT id FROM "Bosses" WHERE "name"=
  'Gehennas')),
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