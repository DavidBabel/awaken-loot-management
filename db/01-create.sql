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
  "classId" int NOT NULL,
  "itemId" int NOT NULL,
  "itemValueForThisClass" int
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
  "donjonId" int NOT NULL,
  "date" varchar
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
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");