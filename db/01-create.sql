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
ALTER TABLE "SoftResa" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");