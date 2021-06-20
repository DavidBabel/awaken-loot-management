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
