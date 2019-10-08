 -- SAFE BEGIN FOR CONCAT
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
  "classId" int,
  "role" varchar,
  "password" varchar,
  "active" boolean DEFAULT true
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
  "meritId" int,
  "playerId" int,
  "date" varchar,
  "validated" boolean DEFAULT false
);
-- comment on table "PlayerMerit" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerMerit" ("id");


CREATE TABLE "Loots" (
  "id" SERIAL PRIMARY KEY,
  "playerId" int,
  "itemId" int,
  "raidId" int,
  "active" boolean DEFAULT true
);
comment on table "Loots" is E'@omit delete';
CREATE UNIQUE INDEX ON "Loots" ("id");


CREATE TABLE "Items" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "wowheadId" int,
  "classId" int,
  "phatLoot" boolean DEFAULT false
);
comment on table "Items" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");


CREATE TABLE "ClassItem" (
  "id" SERIAL PRIMARY KEY,
  "classId" int,
  "itemId" int,
  "itemValueForThisClass" int
);
comment on table "ClassItem" is E'@omit delete';
CREATE UNIQUE INDEX ON "ClassItem" ("id");


CREATE TABLE "BossItem" ("id" SERIAL PRIMARY KEY,
  "itemId" int,
  "bossId" int
);
comment on table "BossItem" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "BossItem" ("id");


CREATE TABLE "Bosses" (
  "id" SERIAL PRIMARY KEY,
  "donjonId" int,
  "name" varchar
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
  "donjonId" int,
  "date" varchar
);
comment on table "Raids" is E'@omit delete';
CREATE UNIQUE INDEX ON "Raids" ("id");


CREATE TABLE "RaidPlayers" (
    "id" SERIAL PRIMARY KEY,
    "playerId" int,
    "raidId" int,
    "passed" boolean DEFAULT false
  );
-- comment on table "RaidPlayers" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");


ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Raids" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "PlayerMerit" ADD FOREIGN KEY ("meritId") REFERENCES "Merit" ("id");
ALTER TABLE "PlayerMerit" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
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
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Ony')),
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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Ceinture de traqueur de géant',16851,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Brassards de traqueur de géant',16850,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Protège-bras de prophétie',16819,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Ceinturon de prophétie',16817,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Brassards Rageterre',16840,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Ceinture Rageterre',16838,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Brassards cénariens',16830,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Ceinture cénarienne',16828,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Ceinture de puissance',16864,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Brassards de puissance',16861,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Ceinture d‘arcaniste',16802,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Manchettes d‘arcaniste',16799,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Brassards de Gangrecoeur',16804,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Ceinture de Gangrecoeur',16806,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Brassards judiciaires',16857,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Ceinture judiciaire',16858,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Bracelets du tueur de la nuit',16825,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Ceinture du tueur de la nuit',16827,(SELECT id FROM "Classes" WHERE "name"='Voleur'));


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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gantelets de puissance',16863,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Gants de Gangrecoeur',16805,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Bottes cénariennes',16829,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Collier d‘illumination',17109,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes d‘arcaniste',16800,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Bottes judiciaires',16859,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Bottes Rageterre',16837,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Trembleterre',17073,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières cénariennes',16835,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Gangrecoeur',16810,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Pantalon de prophétie',16814,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Marque du Frappeur',17069,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières d‘arcaniste',16796,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Jambières de puissance',16867,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Médaillon de Puissance inébranlable',17065,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon du tueur de la nuit',16822,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Jambières de traqueur de géant',16847,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Griffe droite d‘Eskhandar',18203,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières judiciaires',16855,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières Rageterre',16843,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"='')),
('Solerets du Marcheflammes',19144,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants de prophétie',16812,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes de traqueur de géant',16849,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Gants du tueur de la nuit',16826,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Sandales de puissance',16862,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Gantelets judiciaires',16860,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Gantelets Rageterre',16839,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Marteau d‘Aurastone',17105,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque cénarien',16834,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Casque de traqueur de géant',16846,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Déchireur de Gutgore',17071,(SELECT id FROM "Classes" WHERE "name"='')),
('Disque Drillborer',17066,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame de brutalité',18832,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque de puissance',16866,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Collerette de prophétie',16813,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cornes de Gangrecoeur',16808,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Couronne d‘arcaniste',16795,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Couvre-chef du tueur de la nuit',16821,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume judiciaire',16854,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque Rageterre',16842,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants cénariens',16831,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Gants d‘arcaniste',16801,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Gants de traqueur de géant',16852,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Bottes de prophétie',16811,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes du tueur de la nuit',16824,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Mules de Gangrecoeur',16803,(SELECT id FROM "Classes" WHERE "name"='Démoniste'));
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Mantelet d‘arcaniste',16797,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Spallières cénariennes',16836,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Protège-épaules de Gangrecoeur',16807,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Sceau de l‘archimagus',17110,(SELECT id FROM "Classes" WHERE "name"='')),
('Spallières judiciaires',16856,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Epaulettes Rageterre',16844,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Frappe-ténèbres',17074,(SELECT id FROM "Classes" WHERE "name"='')),
('Epaulettes de traqueur de géant',16848,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Espauliers de puissance',16868,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Mantelet de prophétie',16816,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Protège-épaules du tueur de la nuit',16823,(SELECT id FROM "Classes" WHERE "name"='Voleur'));
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Bâton de domination',18842,(SELECT id FROM "Classes" WHERE "name"='')),
('Magelame de Chante-azur',17103,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe d‘arcaniste',16798,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Cuirasse de traqueur de géant',16845,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Plastron du tueur de la nuit',16820,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Robe de Gangrecoeur',16809,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Robe de prophétie',16815,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cuirasse de puissance',16865,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Lance-grenaille explosif',17072,(SELECT id FROM "Classes" WHERE "name"='')),
('Lingot de sulfuron',17203,(SELECT id FROM "Classes" WHERE "name"='')),
('Corselet judiciaire',16853,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Habit cénarien',16833,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Habit Rageterre',16841,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Anneau de cautérisation',19140,(SELECT id FROM "Classes" WHERE "name"='')),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"='')),
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"='')),
('Drague-lave de Finkle',18803,(SELECT id FROM "Classes" WHERE "name"='')),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"='')),
('Epaulières de garde du feu',19139,(SELECT id FROM "Classes" WHERE "name"='')),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Gants de la flamme hypnotique',18808,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"='')),
('Grèves du Coeur du Magma',18806,(SELECT id FROM "Classes" WHERE "name"='')),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Jambières de Stormrage',16901,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Vent du néant',16915,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Lame de la perdition',18816,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de Sulfuras',19138,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de traqueur de dragon',16938,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de destruction',18817,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon Rougecroc',16909,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Anneau de Précisia',17063,(SELECT id FROM "Classes" WHERE "name"='')),
('Cape sang-de-dragon',17107,(SELECT id FROM "Classes" WHERE "name"='')),
('Essence de la Flamme pure',18815,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Némésis',16930,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Jambières de transcendance',16922,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Jambières de courroux',16962,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Cape du Voile de brume',17102,(SELECT id FROM "Classes" WHERE "name"='')),
('Ceinturon d‘assaut',19137,(SELECT id FROM "Classes" WHERE "name"='')),
('Collier du Seigneur du Feu',18814,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières du jugement',16954,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Arrache-moelle',17104,(SELECT id FROM "Classes" WHERE "name"='')),
('Fragment de la Flamme',17082,(SELECT id FROM "Classes" WHERE "name"='')),
('Fléau de Bonereaver',17076,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières des dix tempêtes',16946,(SELECT id FROM "Classes" WHERE "name"='Chaman'));

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
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16946));

-- SELECT 1 AS "Onyxia";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Tête d‘Onyxia',18422,(SELECT id FROM "Classes" WHERE "name"='')),
('Tendon de dragon noir adulte',18705,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Ancien Grimoire de Cornerstone',17067,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de lien',18813,(SELECT id FROM "Classes" WHERE "name"='')),
('Couvre-chef de Stormrage',16900,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Crâne de Némésis',16929,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Casque de traqueur de dragon',16939,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de Vent du néant',16914,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Drapé de Saphiron',17078,(SELECT id FROM "Classes" WHERE "name"='')),
('Auréole de transcendance',16921,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cagoule Rougecroc',16908,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume de courroux',16963,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Collier d‘Eskhandar',18205,(SELECT id FROM "Classes" WHERE "name"='')),
('Couronne du jugement',16955,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque des dix tempêtes',16947,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Eclat de l‘Ecaille',17064,(SELECT id FROM "Classes" WHERE "name"='')),
('Porte-mort',17068,(SELECT id FROM "Classes" WHERE "name"='')),
('Sac à dos en cuir d‘Onyxia',17966,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Tête d‘Onyxia',18423,(SELECT id FROM "Classes" WHERE "name"='')),
('Vis‘kag le Saigneur',17075,(SELECT id FROM "Classes" WHERE "name"=''));

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
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17075));
 -- SAFE BEGIN FOR CONCAT
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


INSERT INTO "Players" ("name", "classId", "role", "password", "active")
VALUES
('Devilhunter'  , 6,  'admin', '55fc5b709962876903785fd64a6961e5', true),
('Hakken'       , 2,  'officer', null, true),
('Lums'         , 7,  'officer', null, true),
('Shaheem'      , 3,  'officer', null, true),
('Nozil'        , 6,  'classMaster', null, true),
('Tàel'         , 3,  'classMaster', null, true),
('Skwäsh'       , 1,  'classMaster', null, true),
('Cocobanjo'    , 4,  'classMaster', null, true),
('Krigen'       , 8,  'classMaster', null, true),
('Oscuro'       , 9,  'classMaster', null, true),
('Paffë'        , 5,  'classMaster', null, true),
('Ticcounet'    , 8,  'player', null, false),
('Størmfury'    , 5,  'player', null, false),
('Qweakzor'     , 6,  'player', null, true),
('Traqùs'       , 6,  'player', null, true),
('Adblock'      , 2,  'player', null, true),
('Elementz'     , 2,  'player', null, false),
('Kynosura'     , 2,  'player', null, true),
('Minatrix'     , 2,  'player', null, true),
('Vòlt'         , 2,  'player', null, false),
('Zapikote'     , 3,  'player', null, true),
('Hanzaplast'   , 1,  'player', null, false),
('Kaarr'        , 4,  'player', null, true),
('Nérull'       , 4,  'player', null, false),
('Punkhead'     , 4,  'player', null, false),
('Titanesque'   , 4,  'player', null, false),
('Lyaxus'       , 7,  'player', null, false),
('Mergueztguez' , 7,  'player', null, true),
('Affligeant'   , 3,  'player', null, false),
('Bruh'         , 3,  'player', null, false),
('Kresmi'       , 3,  'player', null, false),
('Psykøhazard'  , 3,  'player', null, true),
('Rektall'      , 3,  'player', null, true),
('Drakenns'     , 8,  'player', null, false),
('Sprawl'       , 8,  'player', null, false),
('Beudinio'     , 5,  'player', null, false),
('Synrj'        , 5,  'player', null, true),
('Brk'          , 1,  'player', null, false),
('Lylith'       , 1,  'player', null, true),
('Skau'         , 1,  'player', null, false),
('Kenyâ'        , 7,  'player', null, true),
('Zhantla'      , 7,  'player', null, false),
('Zykxx'        , 7,  'player', null, false),
('Brebouche'    , 8,  'player', null, true),
('Lykwette'     , 8,  'player', null, true),
('Throma'       , 9,  'player', null, true),
('Alk'          , 6,  'player', null, true),
('Allyssamyr'   , 2,  'player', null, true),
('Ikith'        , 2,  'player', null, true),
('Thorsen'      , 2,  'player', null, true),
('Wid'          , 2,  'player', null, false),
('Need'         , 1,  'player', null, true),
('Callumlolz'   , 4,  'player', null, true),
('Ez'           , 4,  'player', null, true),
('Jonasran'     , 4,  'player', null, true),
('Yx'           , 4,  'player', null, true),
('Suprême'      , 3,  'player', null, true),
('Brosko'       , 9,  'player', null, true),
('Karaelys'     , 1,  'player', null, true),
('Teimdall'     , 1,  'player', null, true),
('Trackass'     , 1,  'player', null, true),
('Gidgud'       , 7,  'player', null, true),
('Ragegoriath'  , 8,  'player', null, true),
('Abramus'      , 2,  'player', null, true),
('Boblemoche'   , 3,  'player', null, true),
('Néstor'       , 3,  'player', null, true),
('Tephrite'     , 5,  'player', null, true),
('Deiv'         , 1,  'player', null, true),
('Nøwad'        , 9,  'player', null, true)

;
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "PlayerMerit" ("meritId", "playerId", "date", "validated")
VALUES
(1, 1, '2019-10-10', true),
(2, 1, '2019-10-20', true),
(3, 1, '2019-10-20', false),
(4, 1, '2019-10-20', true);
 -- SAFE BEGIN FOR CONCAT
-- 1 => Molten Core
-- 2 => Onyxia Lair
-- 3 => Blackwing Lair
-- 4 => Ahn‘Qiraj Temple
-- 5 => Naxxramas
-- 6 => Ahn‘Qiraj Ruins
-- 7 => Zul‘Gurub

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
(2, '2019-10-06'); -- 11


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
  'Casque de traqueur de dragon'))
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
  'Vis‘kag le Saigneur')),
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
; -- SAFE BEGIN FOR CONCAT


-- INSERT INTO "ClassItem" ("itemValueForThisClass","itemId","classId")
-- VALUES
-- (2, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Chasseur')),
-- (5, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'));

-- INSERT INTO "Loots" ("playerId","itemId","raidId")
-- VALUES
-- ((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1),
-- ((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1);
