 -- SAFE BEGIN FOR CONCAT
DROP SCHEMA public cascade;
CREATE SCHEMA public;
DROP DATABASE test;
CREATE DATABASE test;

SET search_path TO public;

SELECT 1 AS "Classes";
CREATE TABLE "Classes" (
  "id" SERIAL PRIMARY KEY,
  "color" varchar,
  "type" varchar,
  "name" varchar,
  "cdnImage" varchar
);
comment on table "Classes" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Classes" ("id");
-- CREATE RULE classes_del_protect AS ON DELETE TO "Classes" DO INSTEAD NOTHING;


SELECT 1 AS "Players";
CREATE TABLE "Players" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "classId" int NOT NULL,
  "role" varchar DEFAULT 'player',
  "password" varchar,
  "active" boolean DEFAULT true,
  "inRoster" boolean DEFAULT false,
  "specialisation" varchar,
  "rerollOf" varchar,
  "mdcOf" int,
  "discordId" varchar
);
comment on table "Players" is E'@omit delete';
CREATE UNIQUE INDEX ON "Players" ("id");


SELECT 1 AS "Merit";
CREATE TABLE "Merit" (
  "id" SERIAL PRIMARY KEY,
  "categorie" varchar,
  "name" varchar,
  "comment" varchar DEFAULT '',
  "value" int,
  "active" boolean DEFAULT true,
  "order" int,
  "delay" int
);
comment on table "Merit" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Merit" ("id");


SELECT 1 AS "PlayerMerit";
CREATE TABLE "PlayerMerit" (
  "id" SERIAL PRIMARY KEY,
  "meritId" int NOT NULL,
  "playerId" int NOT NULL,
  "date" varchar,
  "validated" boolean DEFAULT false
);
-- comment on table "PlayerMerit" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerMerit" ("id");


SELECT 1 AS "Loots";
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


SELECT 1 AS "Items";
CREATE TABLE "Items" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "wowheadId" int,
  "lootLevel" int,
  "doesNotCount" boolean
);
comment on table "Items" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");


SELECT 1 AS "ClassItem";
CREATE TABLE "ClassItem" (
  "id" SERIAL PRIMARY KEY,
  "classId" int NOT NULL,
  "itemId" int NOT NULL,
  "comment" varchar
);
comment on table "ClassItem" is E'@omit delete';
CREATE UNIQUE INDEX ON "ClassItem" ("id");


SELECT 1 AS "BossItem";
CREATE TABLE "BossItem" (
  "id" SERIAL PRIMARY KEY,
  "itemId" int NOT NULL,
  "bossId" int NOT NULL
);
comment on table "BossItem" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "BossItem" ("id");


SELECT 1 AS "Bosses";
CREATE TABLE "Bosses" (
  "id" SERIAL PRIMARY KEY,
  "order" int NOT NULL,
  "donjonId" int NOT NULL,
  "name" varchar,
  "cdnImage" varchar
);
comment on table "Bosses" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Bosses" ("id");


SELECT 1 AS "Donjons";
CREATE TABLE "Donjons" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "shortName" varchar,
  "active" boolean DEFAULT false,
  "cdnImage" varchar,
  "cdnIconImage" varchar
);
comment on table "Donjons" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Donjons" ("id");


SELECT 1 AS "Raids";
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


SELECT 1 AS "RaidPlayers";
CREATE TABLE "RaidPlayers" (
    "id" SERIAL PRIMARY KEY,
    "playerId" int NOT NULL,
    "raidId" int NOT NULL,
    "passed" boolean DEFAULT false, -- deprecated, do not use anymore
    "status" int
  );
-- comment on table "RaidPlayers" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");

SELECT 1 AS "SoftResa";
CREATE TABLE "SoftResa" (
  "id" SERIAL PRIMARY KEY,
  "raidId" int NOT NULL,
  "playerId" int NOT NULL,
  "itemId" int NOT NULL
);
-- comment on table "Players" is E'@omit delete';
CREATE UNIQUE INDEX ON "SoftResa" ("id");


ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("mdcOf") REFERENCES "Classes" ("id");
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
ALTER TABLE "BossItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
ALTER TABLE "SoftResa" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "SoftResa" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "SoftResa" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id"); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Classes" ("name", "type", "color", "cdnImage")
VALUES
('Guerrier Tank', 'Tank',   '#C79C6E', 'https://i.imgur.com/hw2XKfc.jpg'), -- 1
('Guerrier DPS',  'DPS',    '#C79C6E', 'https://i.imgur.com/cbXTPXo.jpg'), -- 2
('Paladin Tank',  'Tank',   '#F58CBA', 'https://i.imgur.com/eBvF6kD.jpg'), -- 3
('Paladin Heal',  'Heal',   '#F58CBA', 'https://i.imgur.com/k7llTzz.jpg'), -- 4
('Paladin Ret',   'DPS',    '#F58CBA', 'https://i.imgur.com/CXqHFbR.jpg'), -- 5
('Chaman Heal',   'Heal',   '#0070DE', 'https://i.imgur.com/2F7OwC3.jpg'), -- 6
('Chaman Amélio', 'DPS',    '#0070DE', 'https://i.imgur.com/YIg6jtf.jpg'), -- 7
('Chaman Elem',   'Caster', '#0070DE', 'https://i.imgur.com/7fWBhhh.jpg'), -- 8
('Druide Heal',   'Heal',   '#FF7D0A', 'https://i.imgur.com/AtQpe8j.jpg'), -- 9
('Druide Féral',  'Tank',   '#FF7D0A', 'https://i.imgur.com/WDYnD11.jpg'), -- 10
('Druide Equi',   'Caster', '#0070DE', 'https://i.imgur.com/EitTIKx.jpg'), -- 11
('Voleur',        'DPS',    '#f7ea25', 'https://i.imgur.com/ILDSOb7.jpg'), -- 12
('Prêtre Heal',   'Heal',   'grey',    'https://i.imgur.com/eJWivpE.jpg'), -- 13
('Prêtre Ombre',  'Caster', 'grey',    'https://i.imgur.com/h3NR1O4.jpg'), -- 14
('Mage',          'Caster', '#69CCF0', 'https://i.imgur.com/G1FHT31.jpg'), -- 15
('Démoniste',     'Caster', '#9482C9', 'https://i.imgur.com/9YeZLsl.jpg'), -- 16
('Chasseur',      'DPS',    '#ABD473', 'https://i.imgur.com/sDVqcvA.jpg') -- 17
;

 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active", "cdnImage", "cdnIconImage")
VALUES
('Gruul Magtheridon', 'gm25', true, 'https://i.imgur.com/PgqM0T0.jpg', 'https://i.imgur.com/PgqM0T0.jpg');

INSERT INTO "Bosses" ("order", "name", "donjonId", "cdnImage")
VALUES
(1,'Haut Roi Maulgar', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/taQaw2j.jpg'),
(2,'Gruul le Tue-dragon', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/gcLF8qu.jpg'),

(3,'Magtheridon', (SELECT id FROM "Donjons" WHERE "shortName"='gm25'), 'https://i.imgur.com/yvq678n.jpg');
SELECT 1 AS "Haut Roi Maulgar";

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Espauliers du héros déchu',29762, 2),
('Espauliers du champion déchu',29763, 2),
('Espauliers du défenseur déchu',29764, 2),
('Poignets de guerre flèchelame',28795, 2),
('Cape brutale de l‘ogre-magi',28797, 2),
('Marteau des naaru',28800, 2),
('Ceinture d‘inspiration divine',28799, 2),
('Heaume de guerre de Maulgar',28801, 2),
('Masque maléfique des ombres',28796, 2),
('Sautoir du repentir',31321, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29762)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29763)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29764)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28795)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28797)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28800)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28799)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28801)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28796)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=31321));

SELECT 1 AS "Gruul le Tue-dragon";

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Jambières du héros déchu',29765, 2),
('Jambières du champion déchu',29766, 2),
('Jambières du défenseur déchu',29767, 2),
('Bottes des Cisailles',28810, 2),
('Ceinture cousue de Gronn',28828, 2),
('Dent de Gruul',28822, 2),
('Capuche du souffle de la nature',28803, 2),
('Collier de Cho‘gall',28804, 2),
('Gantelets de la perfection martiale',28824, 2),
('Shuriken de négation',28826, 2),
('Trophée Epine-de-dragon',28830, 2),
('Défendeur de l‘héritage aldori',28825, 2),
('Oeil de Gruul',28823, 2),
('Gantelets du tueur de dragon',28827, 2),
('Hache des seigneurs gronns',28794, 2),
('Lame-magus Saignegueule',28802, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29765)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29766)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29767)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28810)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28828)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28822)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28803)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28804)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28824)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28826)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28830)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28825)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28823)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28827)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28794)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28802));

SELECT 1 AS "Magtheridon";

INSERT INTO "Items" ("name","wowheadId","lootLevel","doesNotCount")
VALUES
('Sacoche de seigneur des abîmes',34845, 1, true);

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Tête de Magtheridon',32385, 2),
('Corselet du héros déchu',29755, 2),
('Corselet du défenseur déchu',29753, 2),
('Bâton coeur-de-cristal à impulsions',28782, 2),
('Grand heaume de tonnerre',28775, 2),
('Oeil de Magtheridon',28789, 2),
('Talisman karaborien',28781, 2),
('Ceinturon du puits sans fond',28779, 2),
('Corselet du champion déchu',29754, 2),
('Baguette d‘oblitération érédar',28783, 2),
('Cape du traqueur des puits',28777, 2),
('Ceinturon du puits de la terreur',28778, 2),
('Gants langue-de-vipère',28776, 2),
('Couteau de brèche de la fosse',28774, 2),
('Egide du redresseur de torts',29458, 2),
('Protège-mains de dévoreur d‘âmes',28780, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=34845)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=32385)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29755)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29753)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28782)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28775)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28789)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28781)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28779)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29754)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28783)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28777)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28778)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28776)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28774)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29458)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28780));



-- safe comment
-- THIS FILE IS GENERATED
-- from https://docs.google.com/document/d/1UzSvjPjsRW7RX_ujcFQht6_Tg5SwTlRMLQxzN9Oq71Q/edit

INSERT INTO "ClassItem" ("itemId", "classId", "comment")
VALUES

-- Espauliers du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Espauliers du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
-- Espauliers du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),

-- Espauliers du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
-- Espauliers du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Espauliers du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),

-- Espauliers du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
-- Espauliers du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Espauliers du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Espauliers du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Poignets de guerre flèchelame
((SELECT id FROM "Items" WHERE "name"=
'Poignets de guerre flèchelame'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Poignets de guerre flèchelame
((SELECT id FROM "Items" WHERE "name"=
'Poignets de guerre flèchelame'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Cape brutale de l‘ogre-magi
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),
-- Cape brutale de l‘ogre-magi
((SELECT id FROM "Items" WHERE "name"=
'Cape brutale de l‘ogre-magi'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),

-- Marteau des naaru
((SELECT id FROM "Items" WHERE "name"=
'Marteau des naaru'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Marteau des naaru
((SELECT id FROM "Items" WHERE "name"=
'Marteau des naaru'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Marteau des naaru
((SELECT id FROM "Items" WHERE "name"=
'Marteau des naaru'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
-- Marteau des naaru
((SELECT id FROM "Items" WHERE "name"=
'Marteau des naaru'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Ceinture d‘inspiration divine
((SELECT id FROM "Items" WHERE "name"=
'Ceinture d‘inspiration divine'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture d‘inspiration divine'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture d‘inspiration divine'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture d‘inspiration divine'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture d‘inspiration divine'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Heaume de guerre de Maulgar
((SELECT id FROM "Items" WHERE "name"=
'Heaume de guerre de Maulgar'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Heaume de guerre de Maulgar
((SELECT id FROM "Items" WHERE "name"=
'Heaume de guerre de Maulgar'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),

-- Masque maléfique des ombres
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Masque maléfique des ombres'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Sautoir du repentir
((SELECT id FROM "Items" WHERE "name"=
'Sautoir du repentir'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Sautoir du repentir'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Sautoir du repentir'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Jambières du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Jambières du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
-- Jambières du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),

-- Jambières du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
-- Jambières du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Jambières du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),

-- Jambières du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
-- Jambières du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Jambières du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Jambières du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Bottes des Cisailles
((SELECT id FROM "Items" WHERE "name"=
'Bottes des Cisailles'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),

-- Ceinture cousue de Gronn
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Ceinture cousue de Gronn'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Dent de Gruul
((SELECT id FROM "Items" WHERE "name"=
'Dent de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Dent de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Dent de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Dent de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),

-- Capuche du souffle de la nature
((SELECT id FROM "Items" WHERE "name"=
'Capuche du souffle de la nature'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
-- Capuche du souffle de la nature
((SELECT id FROM "Items" WHERE "name"=
'Capuche du souffle de la nature'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
-- Capuche du souffle de la nature
((SELECT id FROM "Items" WHERE "name"=
'Capuche du souffle de la nature'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),

-- Collier de Cho‘gall
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),
-- Collier de Cho‘gall
((SELECT id FROM "Items" WHERE "name"=
'Collier de Cho‘gall'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),

-- Gantelets de la perfection martiale
((SELECT id FROM "Items" WHERE "name"=
'Gantelets de la perfection martiale'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Gantelets de la perfection martiale
((SELECT id FROM "Items" WHERE "name"=
'Gantelets de la perfection martiale'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Shuriken de négation
((SELECT id FROM "Items" WHERE "name"=
'Shuriken de négation'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Shuriken de négation'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Shuriken de négation
((SELECT id FROM "Items" WHERE "name"=
'Shuriken de négation'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),

-- Trophée Epine-de-dragon
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Trophée Epine-de-dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Défendeur de l‘héritage aldori
((SELECT id FROM "Items" WHERE "name"=
'Défendeur de l‘héritage aldori'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Défendeur de l‘héritage aldori
((SELECT id FROM "Items" WHERE "name"=
'Défendeur de l‘héritage aldori'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),

-- Oeil de Gruul
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Gruul'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),

-- Gantelets du tueur de dragon
((SELECT id FROM "Items" WHERE "name"=
'Gantelets du tueur de dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Gantelets du tueur de dragon
((SELECT id FROM "Items" WHERE "name"=
'Gantelets du tueur de dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
-- Gantelets du tueur de dragon
((SELECT id FROM "Items" WHERE "name"=
'Gantelets du tueur de dragon'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Hache des seigneurs gronns
((SELECT id FROM "Items" WHERE "name"=
'Hache des seigneurs gronns'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Hache des seigneurs gronns
((SELECT id FROM "Items" WHERE "name"=
'Hache des seigneurs gronns'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Hache des seigneurs gronns
((SELECT id FROM "Items" WHERE "name"=
'Hache des seigneurs gronns'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Hache des seigneurs gronns
((SELECT id FROM "Items" WHERE "name"=
'Hache des seigneurs gronns'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),

-- Lame-magus Saignegueule
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),
-- Lame-magus Saignegueule
((SELECT id FROM "Items" WHERE "name"=
'Lame-magus Saignegueule'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),



-- Corselet du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Corselet du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
-- Corselet du héros déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du héros déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),

-- Corselet du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
-- Corselet du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Corselet du défenseur déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du défenseur déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Corselet du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
-- Corselet du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Corselet du champion déchu
((SELECT id FROM "Items" WHERE "name"=
'Corselet du champion déchu'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),

-- Bâton coeur-de-cristal à impulsions
((SELECT id FROM "Items" WHERE "name"=
'Bâton coeur-de-cristal à impulsions'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Bâton coeur-de-cristal à impulsions'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Bâton coeur-de-cristal à impulsions'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Bâton coeur-de-cristal à impulsions'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),

-- Grand heaume de tonnerre
((SELECT id FROM "Items" WHERE "name"=
'Grand heaume de tonnerre'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Grand heaume de tonnerre'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier Tank'), NULL),
-- Grand heaume de tonnerre
((SELECT id FROM "Items" WHERE "name"=
'Grand heaume de tonnerre'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Grand heaume de tonnerre
((SELECT id FROM "Items" WHERE "name"=
'Grand heaume de tonnerre'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Tank'), NULL),

-- Oeil de Magtheridon
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Magtheridon'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Magtheridon'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Magtheridon'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Magtheridon'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Oeil de Magtheridon'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Talisman karaborien
((SELECT id FROM "Items" WHERE "name"=
'Talisman karaborien'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Talisman karaborien'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Talisman karaborien'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Talisman karaborien'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Talisman karaborien'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL),

-- Ceinturon du puits sans fond
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits sans fond'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
-- Ceinturon du puits sans fond
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits sans fond'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),

-- Baguette d‘oblitération érédar
((SELECT id FROM "Items" WHERE "name"=
'Baguette d‘oblitération érédar'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
-- Baguette d‘oblitération érédar
((SELECT id FROM "Items" WHERE "name"=
'Baguette d‘oblitération érédar'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),

-- Cape du traqueur des puits
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Cape du traqueur des puits'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Ceinturon du puits de la terreur
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits de la terreur'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
-- Ceinturon du puits de la terreur
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits de la terreur'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
-- Ceinturon du puits de la terreur
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits de la terreur'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Ceinturon du puits de la terreur
((SELECT id FROM "Items" WHERE "name"=
'Ceinturon du puits de la terreur'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Gants langue-de-vipère
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Amélio'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Chasseur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Voleur'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Gants langue-de-vipère'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Féral'), NULL),

-- Couteau de brèche de la fosse
((SELECT id FROM "Items" WHERE "name"=
'Couteau de brèche de la fosse'
),(SELECT id FROM "Classes" WHERE "name"=
'Guerrier DPS'), NULL),
-- Couteau de brèche de la fosse
((SELECT id FROM "Items" WHERE "name"=
'Couteau de brèche de la fosse'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Ret'), NULL),

-- Egide du redresseur de torts
((SELECT id FROM "Items" WHERE "name"=
'Egide du redresseur de torts'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Heal'), NULL),
-- Egide du redresseur de torts
((SELECT id FROM "Items" WHERE "name"=
'Egide du redresseur de torts'
),(SELECT id FROM "Classes" WHERE "name"=
'Paladin Heal'), NULL),

-- Protège-mains de dévoreur d‘âmes
((SELECT id FROM "Items" WHERE "name"=
'Protège-mains de dévoreur d‘âmes'
),(SELECT id FROM "Classes" WHERE "name"=
'Chaman Elem'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Protège-mains de dévoreur d‘âmes'
),(SELECT id FROM "Classes" WHERE "name"=
'Druide Equi'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Protège-mains de dévoreur d‘âmes'
),(SELECT id FROM "Classes" WHERE "name"=
'Mage'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Protège-mains de dévoreur d‘âmes'
),(SELECT id FROM "Classes" WHERE "name"=
'Démoniste'), NULL),
((SELECT id FROM "Items" WHERE "name"=
'Protège-mains de dévoreur d‘âmes'
),(SELECT id FROM "Classes" WHERE "name"=
'Prêtre Ombre'), NULL);-- SAFE BEGIN FOR CONCAT

INSERT INTO "Merit" ("order", "active", "value", "categorie", "name", "comment", "delay")
VALUES

(1, true, 10, 'Enchantements (actuels)', 'Casque', 'Réput ou ZG', null),
(2, true, 15, 'Enchantements (actuels)', 'Epaulettes', 'exalté ZG ou +5 resist', null),
(3, true, 05, 'Enchantements (actuels)', 'Cape', '', null),
(4, true, 10, 'Enchantements (actuels)', 'Plastron', '', null),
(5, true, 10, 'Enchantements (actuels)', 'Bracelet', '', null),
(6, true, 10, 'Enchantements (actuels)', 'Gants', '', null),
(7, true, 10, 'Enchantements (actuels)', 'Pantalon', 'TDC ou Couture ou ZG', null),
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

(1, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Casque', '', null),
(2, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Collier', '', null),
(3, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Epaulettes', '', null),
(4, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Cape', '', null),
(5, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Plastron', '', null),
(6, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bracelet', '', null),
(7, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Gants', '', null),
(8, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Ceinture', '', null),
(9, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Pantalon', '', null),
(10, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bottes', '', null),
(11, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Anneau 1', '', null),
(12, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Anneau 2', '', null),
(13, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bijou 1', '', null),
(14, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Bijou 2', '', null),

(15, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme droite', '', null),
(16, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, false, 05, 'Equipement palier 2 (T2 / MC BiS / BWL / R13)', 'Arme distance / relique / totem', '', null),

(1, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Casque', '', null),
(2, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Collier', '', null),
(3, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Epaulettes', '', null),
(4, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Cape', '', null),
(5, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Plastron', '', null),
(6, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bracelet', '', null),
(7, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Gants', '', null),
(8, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Ceinture', '', null),
(9, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Pantalon', '', null),
(10, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bottes', '', null),
(11, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Anneau 1', '', null),
(12, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Anneau 2', '', null),
(13, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bijou 1', '', null),
(14, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Bijou 2', '', null),

(15, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme droite', '', null),
(16, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme gauche', 'automatique pour les armes 2 mains', null),
(17, false, 05, 'Equipement palier 3 (T3 / Naxx / AQ BiS)', 'Arme distance / relique / totem', '', null),

(1, true, 10, 'Spécialisation', 'Publiée sur cet outil et à jour', 'https://fr.tbc.wowhead.com/talent-calc', null),
(2, true, 15, 'Spécialisation', 'Validée par le Maître de classe', 'Pas une spé PvP', null),
(3, true, 10, 'Spécialisation', '100% PvE', 'Tous les points les plus opti au raid', null),
(4, true, 10, 'Spécialisation', 'Soigneur: Spécialisation non hybride', 'Pour tous les healers qui ne jouent pas tank ou DPS', null),

(1, true, 05, 'Grade', 'Avoir le grade Membre', 'également pour les Alpha / Omega', null),
(2, true, 05, 'Grade', 'Avoir le grade Alpha / Omega', 'également pour les Vétérans', null),
(3, true, 05, 'Grade', 'Avoir le grade Vétéran', 'également pour les Chef de raid', null),
(4, true, 05, 'Grade', 'Avoir le grade Chef de raid', 'également pour les Officiers', null),
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

(3, true, 07, 'Farm Guilde', 'Est un artisant de la guilde', 'Joaillerie / TDC craft Rési / Couture craft Rési / Forge craft Rési / Enchantement ++', null),

(1, true, 03, 'Accès Raid', 'Accès Karazhan', '', null),
(2, true, 03, 'Accès Raid', 'Accès Sanctuaire du serpent', '', null),
(3, true, 03, 'Accès Raid', 'Accès à L‘Oeil', '', null),
(4, false, 03, 'Accès Raid', 'Accès Mont Hyjal', '', null),
(5, false, 05, 'Accès Raid', 'Accès Temple Noir', '', null),

(1, true, 05, 'Raid', 'Possède les addons de raid et de guilde obligatoires', '', null),

(2, true, 05, 'Raid', 'Toujours sous consommables', 'Boss + Trash', null),
(3, true, 05, 'Raid', 'Sous consommables quand nécessaire', 'A ajouter si "Toujours sous consommables"', null),
(4, true, 03, 'Raid', 'La bouffe, c‘est déjà pas mal', '', null),
(5, true, 03, 'Raid', '300 en bandages', '', null),

(6, true, 03, 'Raid', 'Toujours des popos dans le sac', 'Mana et Vie', null),

-- (7, true, 10, 'Raid', 'Stuff +140 résistance feu unbuff', '', null),
-- (8, true, 10, 'Raid', 'Stuff +140 résistance nature unbuff', '', null),
-- (9, true, 10, 'Raid', 'Stuff +140 résistance givre unbuff', '', null),

(10, true, 10, 'Raid', 'Avoir un sac 20 places Magtheridon', '', null),
-- (11, true, 5, 'Raid', 'Avoir deux sacs Onyxia', '', null),
-- (12, true, 5, 'Raid', 'Avoir trois sacs Onyxia', '', null),
-- (13, true, 5, 'Raid', 'Avoir quatres sacs Onyxia', '', null),

(1, true, 10, 'Réputation', 'Révéré Ville Basse', '', null),
(2, true, 10, 'Réputation', 'Révéré Thrallmar', '', null),
(3, true, 10, 'Réputation', 'Révéré Expédition cénarienne', '', null),
(4, true, 10, 'Réputation', 'Révéré Grotte du temps', '', null),
(5, true, 10, 'Réputation', 'Révéré Shat‘ar', '', null),
(6, true, 10, 'Réputation', 'Révéré Oeil Pourpre', '', null),
(7, false, 10, 'Réputation', 'Révéré Gardien du temps', '', null),
(8, false, 10, 'Réputation', 'Révéré Illidary', '', null),
(9, false, 10, 'Réputation', 'Révéré kael dranas', '', null),
(10, true, 20, 'Réputation', 'Exalté Aldor / Clairvoyants', '', null),

(1, true, 5, 'PvE', 'J‘ai tué Ragnaros chez Awaken', '', null),
(2, true, 5, 'PvE', 'J‘ai tué Nefarian chez Awaken', '', null),
(3, true, 5, 'PvE', 'J‘ai tué C‘thun chez Awaken', '', null),
(4, true, 10, 'PvE', 'J‘ai tué Kel Thuzad chez Awaken', '', null),
(5, true, 10, 'PvE', 'J‘ai tué Gruul chez Awaken', '', null),
(6, true, 10, 'PvE', 'J‘ai tué Magtheridon chez Awaken', '', null),

(1, true, 05, 'Mérite', 'Atteindre 100 points de mérite validés', '', null),
(2, true, 05, 'Mérite', 'Atteindre 200 points de mérite validés', '', null),
(3, true, 05, 'Mérite', 'Atteindre 300 points de mérite validés', '', null),
(4, true, 05, 'Mérite', 'Atteindre 400 points de mérite validés', '', null),
(5, true, 05, 'Mérite', 'Atteindre 500 points de mérite validés', '', null),
(6, true, 05, 'Mérite', 'Atteindre 600 points de mérite validés', '', null),
(7, true, 05, 'Mérite', 'Atteindre 700 points de mérite validés', '', null),

(1, true, -150, 'Malus', 'J‘ai mal saisie un mérite et je me suis fait chopper', 'au cours du dernier mois', 30),
(2, true, -125, 'Malus', 'J‘ai manqué de respect envers un off ou un mdc', 'au cours du dernier mois', 30),
(3, true, -100, 'Malus', 'Je ne me suis pas inscrit en raid 2 fois', 'au cours du dernier mois', 30),
(4, true, -70, 'Malus', 'Je suis arrivé en retard en raid sans prévenir', 'au cours du dernier mois', 30),
(5, true, -100, 'Malus', 'J‘était inscrit au raid mais pas présent, sans prévenir', 'au cours des deux derniers mois', 60),
(6, true, -80, 'Malus', 'J‘ai pris la parole de manière inapropriée en raid ou sur discord', 'au cours du dernier mois', 30),
(7, true, -110, 'Malus', 'J‘ai menti sur ma spé ou respé sans le dire à mon MDC', 'au cours des deux derniers mois', 60),
(8, true, -90, 'Malus', 'Je suis venu en raid sans consommables', 'au cours du dernier mois', 30),
(9, true, -90, 'Malus', 'Je suis venu en raid sans enchantements', 'au cours du dernier mois', 30),
(10, true, -200, 'Malus', 'J‘ai pull un pack en mode kikoo', 'au cours du dernier mois', 30),
(11, true, -100, 'Malus', 'J‘ai fais wipe le raid sur une bombe', 'Vael/Gueedon au cours des deux derniers mois', 60),
(12, true, -40, 'Malus', 'J‘ai fais dépop les techniciens autour de Vael', 'au cours des deux derniers mois', 60),
(13, false, -40, 'Malus', 'J‘ai loot l‘or de raid à la place d‘un officier','au cours des deux derniers mois', 60);
 -- SAFE BEGIN FOR CONCAT

-- admin
-- officer
-- classMaster
-- player
-- guest


INSERT INTO "Players" ("name", "classId", "role", "password", "active", "inRoster")
VALUES
('Non Assigné'  , 5,  'player', null, false, false),
('Devilhawk'    , 17,  'admin', '71c0665585d07663b6955dd9d43fa209', true, true),
('awaken'       , 6,  'player', '71c0665585d07663b6955dd9d43fa209', false, true),
('admin'        , 1,  'admin', '71c0665585d07663b6955dd9d43fa209', false, false),
('officer'      , 1,  'officer', '71c0665585d07663b6955dd9d43fa209', false, false),
('classMaster'  , 1,  'classMaster', '71c0665585d07663b6955dd9d43fa209', false, false),
('player'       , 1,  'player', '28d1fc4380e4adb521742bdd6ad260b9', false, false),

('Alkriminal',  12, 'player', null, true, false),
('Altayr',      12, 'player', null, true, false),
('Ataraxíe',    6, 'player', null, true, false),
('Baabz',       15, 'player', null, true, false),
('Bobbyzz',     14, 'officer', null, true, false),
('Bouzor',      7, 'player', null, true, false),
('Callumlolz',  12, 'player', null, true, false),
('Chendø',      8, 'player', null, true, false),
('Dakilla',     9, 'officer', null, true, false),
-- ('Devilhawk',   17, 'player', null, true, false),
('Dralnox',     6, 'player', null, true, false),
('Galah',       17, 'player', null, true, false),
('Häkken',      16, 'player', null, true, false),
('Harkana',     13, 'player', null, true, false),
('Jenova',      16, 'player', null, true, false),
-- ('Kedry',       1, 'player', null, true, false),
('Keiki',       6, 'player', null, true, false),
('Laadj',       3, 'officer', null, true, false),
('Môu',         9, 'player', null, true, false),
('Munuxi',      13, 'player', null, true, false),
('Myorekt',     3, 'player', null, true, false),
('Njørd',       8, 'player', null, true, false),
('Nozil',       17, 'player', null, true, false),
('Paûlette',    13, 'player', null, true, false),
('Rajan',       3, 'player', null, true, false),
('Saprocky',    12, 'player', null, true, false),
('Sazio',       15, 'player', null, true, false),
('Tohltahr',    17, 'player', null, true, false),
('Withoutmana', 16, 'player', null, true, false),
('Zaela',       1, 'player', null, true, false),
('Zérra',       6, 'player', null, true, false),
('Zhorg',       17, 'player', null, true, false)
;

-- 1   Guerrier Tank
-- 2   Guerrier DPS
-- 3   Paladin Tank
-- 4   Paladin Heal
-- 5   Paladin Ret
-- 6   Chaman Heal
-- 7   Chaman Amélio
-- 8   Chaman Elem
-- 9   Druide Heal
-- 10  Druide Féral
-- 11  Druide Equi
-- 12  Voleur
-- 13  Prêtre Heal
-- 14  Prêtre Ombre
-- 15  Mage
-- 16  Démoniste
-- 17  Chasseur
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "PlayerMerit" ("meritId", "playerId", "date", "validated")
VALUES
(1, 2, '2021-06-10', true),
(2, 2, '2021-06-20', true),
(3, 2, '2021-06-20', false),
(4, 2, '2021-06-20', true);
 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Raids" ("donjonId", "date", "title")
VALUES
(1, '2021-06-10', 'Devilhawk'), -- 1er gruul
(1, '2021-06-14', 'Devilhawk'), -- 1er Magthé
(1, '2021-06-17', 'Devilhawk'); -- 2e Gruul / Magthé

-- MC 2021-06-10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(1, (SELECT id FROM "Players" WHERE "name"='Altayr')),
(1, (SELECT id FROM "Players" WHERE "name"='Ataraxíe')),
(1, (SELECT id FROM "Players" WHERE "name"='Baabz')),
(1, (SELECT id FROM "Players" WHERE "name"='Bobbyzz')),
(1, (SELECT id FROM "Players" WHERE "name"='Bouzor')),
(1, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(1, (SELECT id FROM "Players" WHERE "name"='Dakilla')),
(1, (SELECT id FROM "Players" WHERE "name"='Devilhawk')),
(1, (SELECT id FROM "Players" WHERE "name"='Dralnox')),
(1, (SELECT id FROM "Players" WHERE "name"='Galah')),
(1, (SELECT id FROM "Players" WHERE "name"='Häkken')),
(1, (SELECT id FROM "Players" WHERE "name"='Harkana')),
(1, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(1, (SELECT id FROM "Players" WHERE "name"='Laadj')),
(1, (SELECT id FROM "Players" WHERE "name"='Môu')),
(1, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(1, (SELECT id FROM "Players" WHERE "name"='Myorekt')),
(1, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(1, (SELECT id FROM "Players" WHERE "name"='Rajan')),
(1, (SELECT id FROM "Players" WHERE "name"='Saprocky')),
(1, (SELECT id FROM "Players" WHERE "name"='Sazio')),
(1, (SELECT id FROM "Players" WHERE "name"='Tohltahr')),
(1, (SELECT id FROM "Players" WHERE "name"='Withoutmana')),
(1, (SELECT id FROM "Players" WHERE "name"='Zaela')),
(1, (SELECT id FROM "Players" WHERE "name"='Zérra')),

(2, (SELECT id FROM "Players" WHERE "name"='Altayr')),
(2, (SELECT id FROM "Players" WHERE "name"='Bobbyzz')),
(2, (SELECT id FROM "Players" WHERE "name"='Bouzor')),
(2, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(2, (SELECT id FROM "Players" WHERE "name"='Chendø')),
(2, (SELECT id FROM "Players" WHERE "name"='Dakilla')),
(2, (SELECT id FROM "Players" WHERE "name"='Devilhawk')),
(2, (SELECT id FROM "Players" WHERE "name"='Dralnox')),
(2, (SELECT id FROM "Players" WHERE "name"='Galah')),
(2, (SELECT id FROM "Players" WHERE "name"='Häkken')),
(2, (SELECT id FROM "Players" WHERE "name"='Harkana')),
(2, (SELECT id FROM "Players" WHERE "name"='Jenova')),
-- (2, (SELECT id FROM "Players" WHERE "name"='Kedry')),
(2, (SELECT id FROM "Players" WHERE "name"='Môu')),
(2, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(2, (SELECT id FROM "Players" WHERE "name"='Myorekt')),
(2, (SELECT id FROM "Players" WHERE "name"='Njørd')),
(2, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(2, (SELECT id FROM "Players" WHERE "name"='Paûlette')),
(2, (SELECT id FROM "Players" WHERE "name"='Rajan')),
(2, (SELECT id FROM "Players" WHERE "name"='Sazio')),
(2, (SELECT id FROM "Players" WHERE "name"='Tohltahr')),
(2, (SELECT id FROM "Players" WHERE "name"='Withoutmana')),
(2, (SELECT id FROM "Players" WHERE "name"='Zaela')),
(2, (SELECT id FROM "Players" WHERE "name"='Zérra')),

(3, (SELECT id FROM "Players" WHERE "name"='Alkriminal')),
(3, (SELECT id FROM "Players" WHERE "name"='Altayr')),
(3, (SELECT id FROM "Players" WHERE "name"='Bobbyzz')),
(3, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(3, (SELECT id FROM "Players" WHERE "name"='Chendø')),
(3, (SELECT id FROM "Players" WHERE "name"='Dakilla')),
(3, (SELECT id FROM "Players" WHERE "name"='Devilhawk')),
(3, (SELECT id FROM "Players" WHERE "name"='Dralnox')),
(3, (SELECT id FROM "Players" WHERE "name"='Galah')),
(3, (SELECT id FROM "Players" WHERE "name"='Harkana')),
(3, (SELECT id FROM "Players" WHERE "name"='Jenova')),
(3, (SELECT id FROM "Players" WHERE "name"='Laadj')),
(3, (SELECT id FROM "Players" WHERE "name"='Môu')),
(3, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(3, (SELECT id FROM "Players" WHERE "name"='Myorekt')),
(3, (SELECT id FROM "Players" WHERE "name"='Njørd')),
(3, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(3, (SELECT id FROM "Players" WHERE "name"='Paûlette')),
(3, (SELECT id FROM "Players" WHERE "name"='Rajan')),
(3, (SELECT id FROM "Players" WHERE "name"='Saprocky')),
(3, (SELECT id FROM "Players" WHERE "name"='Sazio')),
(3, (SELECT id FROM "Players" WHERE "name"='Tohltahr')),
(3, (SELECT id FROM "Players" WHERE "name"='Withoutmana')),
(3, (SELECT id FROM "Players" WHERE "name"='Zaela')),
(3, (SELECT id FROM "Players" WHERE "name"='Zérra')),
(3, (SELECT id FROM "Players" WHERE "name"='Zhorg'))
;


 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Häkken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape brutale de l‘ogre-magi')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Môu'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers du défenseur déchu')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Sazio'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame-magus Saignegueule')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Zaela'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trophée Epine-de-dragon')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Withoutmana'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières du héros déchu')),

( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhawk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières du héros déchu')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Dakilla'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sacoche de seigneur des abîmes')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Jenova'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman karaborien')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête de Magtheridon')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Bouzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape du traqueur des puits')),

-- gruul
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Sazio'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers du héros déchu')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Bobbyzz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘inspiration divine')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Myorekt'),
  (SELECT id FROM "Items" WHERE "name"=
  'Défendeur de l‘héritage aldori')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Jenova'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières du héros déchu')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Laadj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame-magus Saignegueule')),
-- magthé
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Galah'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête de Magtheridon')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Alkriminal'),
  (SELECT id FROM "Items" WHERE "name"=
  'Corselet du champion déchu')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Zaela'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon du puits sans fond')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Harkana'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sacoche de seigneur des abîmes')),
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Myorekt'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman karaborien'))
  ;
 -- SAFE BEGIN FOR CONCAT

INSERT INTO "SoftResa" ("raidId", "playerId", "itemId")
VALUES
(1,	23,	22),
(1,	30,	22),
(1,	12,	7),
(1,	32,	26),
(1,	36,	17),
(1,	9,	21),
(1,	2,	21),
(1,	14,	21),
(1,	28,	21),
(1,	31,	21),
(1,	10,	23),
(1,	35,	21),
(1,	17,	23),
(1,	33,	15),
(1,	13,	2),
(1,	26,	12),
(1,	11,	1),
(1,	25,	3),
(1,	24,	3),
(1,	18,	1),
(2,	17,	42),
(2,	9,	36),
(2,	14,	36),
(2,	15,	36),
(2,	26,	36),
(2,	30,	36),
(2,	25,	30),
(2,	24,	30),
(2,	35,	30),
(2,	2,	29),
(2,	18,	29),
(2,	21,	29),
(2,	20,	31),
(2,	36,	31),
(2,	32,	37),
(2,	13,	40),
(2,	12,	33),
(3,	17,	42),
(3,	8,	36),
(3,	9,	36),
(3,	14,	36),
(3,	23,	36),
(3,	26,	36),
(3,	30,	36),
(3,	31,	36),
(3,	25,	30),
(3,	24,	30),
(3,	35,	30),
(3,	21,	29),
(3,	36,	31),
(3,	32,	37),
(3,	12,	33),
(3,	20,	27),
(3,	37,	39),
(3,	28,	27),
(3,	23,	26),
(3,	26,	22),
(3,	9,	21),
(3,	12,	7),
(3,	34,	26),
(3,	2,	21),
(3,	14,	21),
(3,	33,	21),
(3,	37,	21),
(3,	17,	23),
(3,	31,	15),
(3,	28,	15),
(3,	24,	13),
(3,	8,	12),
(3,	21,	11),
(3,	30,	2),
(3,	25,	3),
(3,	35,	3),
(3,	18,	1),
(3,	32,	1),
(3,	20,	16),
(3,	36,	16);