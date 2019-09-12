 -- SAFE BEGIN FOR CONCAT
SET search_path TO public;
CREATE TABLE "Classes" (
  "id" SERIAL,
  "color" varchar,
  "name" varchar
);
CREATE UNIQUE INDEX ON "Classes" ("id");
-- TODO put this on every tables
CREATE RULE classes_del_protect AS ON DELETE TO "Classes" DO INSTEAD NOTHING;
CREATE TABLE "Players" (
  "id" SERIAL,
  "name" varchar,
  "classId" int,
  "rank" varchar
);
CREATE UNIQUE INDEX ON "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
CREATE TABLE "Slots" ("id" SERIAL, "name" varchar);
CREATE UNIQUE INDEX ON "Slots" ("id");
CREATE TABLE "PlayerSlots" (
    "id" SERIAL,
    "playerId" int,
    "slotId" int,
    "enchanted" boolean,
    "scoreMerite" int,
    "validated" boolean
  );
CREATE UNIQUE INDEX ON "PlayerSlots" ("id");
CREATE TABLE "Merite" ("id" SERIAL, "name" varchar, "value" int);
CREATE UNIQUE INDEX ON "Merite" ("id");
CREATE TABLE "PlayerMerite" (
    "id" SERIAL,
    "meriteId" int,
    "playerId" int,
    "date" varchar,
    "active" boolean
  );
CREATE UNIQUE INDEX ON "PlayerMerite" ("id");
CREATE TABLE "Loots" (
    "id" SERIAL,
    "playerId" int,
    "itemId" int,
    "raidId" int
  );
CREATE UNIQUE INDEX ON "Loots" ("id");
CREATE TABLE "Items" (
    "id" SERIAL,
    "name" varchar,
    "wowheadId" int,
    "classId" int
  );
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");
CREATE TABLE "ClassItem" (
    "id" SERIAL,
    "classId" int,
    "itemId" int,
    "itemValueForThisClass" int
  );
CREATE UNIQUE INDEX ON "ClassItem" ("id");
CREATE TABLE "BossItem" ("id" SERIAL, "itemId" int, "bossId" int);
CREATE UNIQUE INDEX ON "BossItem" ("id");
CREATE TABLE "Bosses" (
    "id" SERIAL,
    "donjonId" int,
    "name" varchar
  );
CREATE UNIQUE INDEX ON "Bosses" ("id");
CREATE TABLE "Donjons" (
    "id" SERIAL,
    "name" varchar,
    "shortName" varchar,
    "active" boolean
  );
CREATE UNIQUE INDEX ON "Donjons" ("id");
CREATE TABLE "Raids" ("id" SERIAL, "donjonId" int, "date" varchar);
CREATE UNIQUE INDEX ON "Raids" ("id");
ALTER TABLE "Raids" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
CREATE TABLE "RaidPlayers" (
    "id" SERIAL,
    "playerId" int,
    "raidId" int
  );
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");
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