 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Hakken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes d‘arcaniste')),
-- ( 1,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Jonasran'), -- TODO pseudo exact
--   (SELECT id FROM "Items" WHERE "name"=
--   'Pantalon du tueur de la nuit')),
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
--   'Bartok'), -- TODO pseudo exact
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
-- ( 2,
--   (SELECT id FROM "Players" WHERE "name"=
--   '?????'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'loot sulfuron')),

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


