 -- SAFE BEGIN FOR CONCAT
SET search_path TO public;

CREATE TABLE "Classes" (
  "id" SERIAL,
  "color" varchar,
  "name" varchar
);
comment on table "Classes" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Classes" ("id");
-- CREATE RULE classes_del_protect AS ON DELETE TO "Classes" DO INSTEAD NOTHING;


CREATE TABLE "Players" (
  "id" SERIAL,
  "name" varchar,
  "classId" int,
  "rank" varchar,
  "active" boolean DEFAULT true
);
comment on table "Players" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Players" ("id");


CREATE TABLE "Slots" (
  "id" SERIAL,
  "name" varchar
);
comment on table "Slots" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Slots" ("id");


CREATE TABLE "PlayerSlots" (
  "id" SERIAL,
  "playerId" int,
  "slotId" int,
  "enchanted" boolean,
  "scoreMerit" int,
  "validated" boolean
);
comment on table "PlayerSlots" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerSlots" ("id");


CREATE TABLE "Merit" (
  "id" SERIAL,
  "categorie" varchar,
  "name" varchar,
  "comment" varchar DEFAULT '',
  "value" int,
  "active" boolean DEFAULT true
);
comment on table "Merit" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Merit" ("id");


CREATE TABLE "PlayerMerit" (
  "id" SERIAL,
  "meritId" int,
  "playerId" int,
  "date" varchar,
  "active" boolean DEFAULT false
);
comment on table "PlayerMerit" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerMerit" ("id");


CREATE TABLE "Loots" (
  "id" SERIAL,
  "playerId" int,
  "itemId" int,
  "raidId" int,
  "active" boolean DEFAULT true
);
comment on table "Loots" is E'@omit delete';
CREATE UNIQUE INDEX ON "Loots" ("id");


CREATE TABLE "Items" (
  "id" SERIAL,
  "name" varchar,
  "wowheadId" int,
  "classId" int
);
comment on table "Items" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");


CREATE TABLE "ClassItem" (
  "id" SERIAL,
  "classId" int,
  "itemId" int,
  "itemValueForThisClass" int
);
comment on table "ClassItem" is E'@omit delete';
CREATE UNIQUE INDEX ON "ClassItem" ("id");


CREATE TABLE "BossItem" ("id" SERIAL,
  "itemId" int,
  "bossId" int
);
comment on table "BossItem" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "BossItem" ("id");


CREATE TABLE "Bosses" (
  "id" SERIAL,
  "donjonId" int,
  "name" varchar
);
comment on table "Bosses" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Bosses" ("id");


CREATE TABLE "Donjons" (
  "id" SERIAL,
  "name" varchar,
  "shortName" varchar,
  "active" boolean DEFAULT false
);
comment on table "Donjons" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Donjons" ("id");


CREATE TABLE "Raids" (
  "id" SERIAL,
  "donjonId" int,
  "date" varchar
);
comment on table "Raids" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Raids" ("id");


CREATE TABLE "RaidPlayers" (
    "id" SERIAL,
    "playerId" int,
    "raidId" int
  );
-- comment on table "RaidPlayers" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");


ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Raids" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "PlayerSlots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "PlayerSlots" ADD FOREIGN KEY ("slotId") REFERENCES "Slots" ("id");
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
('Paladin',       '#F58CBA'),
('Guerrier DPS',  '#C41F3B');

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
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='7')),
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
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"='')),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"='')),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"='')),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18805)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18703)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18811)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18809)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18812)),
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
INSERT INTO "Players" ("name", "classId", "rank")
VALUES
('Devilhunter', 6, 'admin');
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "PlayerMerit" ("meritId", "playerId", "date", "active")
VALUES
(1, 1, '2019-10-10', true),
(2, 1, '2019-10-20', true),
(3, 1, '2019-10-20', false),
(4, 1, '2019-10-20', true);
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Raids" ("donjonId", "date")
VALUES
(1, '2019-10-10'),
(2, '2019-09-09'),
(2, '2019-11-11');

INSERT INTO "RaidPlayers" ("playerId", "raidId")
VALUES
(1, 1),
(1, 2);
 -- SAFE BEGIN FOR CONCAT


INSERT INTO "ClassItem" ("itemValueForThisClass","itemId","classId")
VALUES
(2, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Chasseur')),
(5, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'));

INSERT INTO "Loots" ("playerId","itemId","raidId")
VALUES
((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1),
((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1);
