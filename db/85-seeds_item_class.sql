 -- SAFE BEGIN FOR CONCAT


-- INSERT INTO "ClassItem" ("itemValueForThisClass","itemId","classId")
-- VALUES
-- (2, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Chasseur')),
-- (5, (SELECT id FROM "Items" WHERE "wowheadId"=16863), (SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'));

-- INSERT INTO "Loots" ("playerId","itemId","raidId")
-- VALUES
-- ((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1),
-- ((SELECT id FROM "Players" WHERE "name"='Devilhunter'), (SELECT id FROM "Items" WHERE "wowheadId"=16863), 1);
