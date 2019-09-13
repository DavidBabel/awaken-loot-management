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
  "scoreMerite" int,
  "validated" boolean
);
comment on table "PlayerSlots" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerSlots" ("id");


CREATE TABLE "Merite" (
  "id" SERIAL,
  "categorie" varchar,
  "name" varchar,
  "comment" varchar DEFAULT '',
  "value" int,
  "active" boolean
);
comment on table "Merite" is E'@omit create,update,delete';
CREATE UNIQUE INDEX ON "Merite" ("id");


CREATE TABLE "PlayerMerite" (
  "id" SERIAL,
  "meriteId" int,
  "playerId" int,
  "date" varchar,
  "active" boolean
);
comment on table "PlayerMerite" is E'@omit delete';
CREATE UNIQUE INDEX ON "PlayerMerite" ("id");


CREATE TABLE "Loots" (
  "id" SERIAL,
  "playerId" int,
  "itemId" int,
  "raidId" int,
  "active" boolean
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
  "active" boolean
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
ALTER TABLE "PlayerMerite" ADD FOREIGN KEY ("meriteId") REFERENCES "Merite" ("id");
ALTER TABLE "PlayerMerite" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Items" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");