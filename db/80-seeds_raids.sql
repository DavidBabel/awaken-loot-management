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

(2, (SELECT id FROM "Players" WHERE "name"='Alkriminal')),
(2, (SELECT id FROM "Players" WHERE "name"='Altayr')),
(2, (SELECT id FROM "Players" WHERE "name"='Bobbyzz')),
(2, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(2, (SELECT id FROM "Players" WHERE "name"='Chendø')),
(2, (SELECT id FROM "Players" WHERE "name"='Devilhawk')),
(2, (SELECT id FROM "Players" WHERE "name"='Dralnox')),
(2, (SELECT id FROM "Players" WHERE "name"='Galah')),
(2, (SELECT id FROM "Players" WHERE "name"='Harkana')),
(2, (SELECT id FROM "Players" WHERE "name"='Jenova')),
(2, (SELECT id FROM "Players" WHERE "name"='Laadj')),
(2, (SELECT id FROM "Players" WHERE "name"='Môu')),
(2, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(2, (SELECT id FROM "Players" WHERE "name"='Myorekt')),
(2, (SELECT id FROM "Players" WHERE "name"='Njørd')),
(2, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(2, (SELECT id FROM "Players" WHERE "name"='Paûlette')),
(2, (SELECT id FROM "Players" WHERE "name"='Rajan')),
(2, (SELECT id FROM "Players" WHERE "name"='Saprocky')),
(2, (SELECT id FROM "Players" WHERE "name"='Sazio')),
(2, (SELECT id FROM "Players" WHERE "name"='Tohltahr')),
(2, (SELECT id FROM "Players" WHERE "name"='Withoutmana')),
(2, (SELECT id FROM "Players" WHERE "name"='Zaela')),
(2, (SELECT id FROM "Players" WHERE "name"='Zérra')),
(2, (SELECT id FROM "Players" WHERE "name"='Zhorg')),

-- (3, (SELECT id FROM "Players" WHERE "name"='Kedry')),
(3, (SELECT id FROM "Players" WHERE "name"='Altayr')),
(3, (SELECT id FROM "Players" WHERE "name"='Bobbyzz')),
(3, (SELECT id FROM "Players" WHERE "name"='Bouzor')),
(3, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(3, (SELECT id FROM "Players" WHERE "name"='Chendø')),
(3, (SELECT id FROM "Players" WHERE "name"='Dakilla')),
(3, (SELECT id FROM "Players" WHERE "name"='Devilhawk')),
(3, (SELECT id FROM "Players" WHERE "name"='Dralnox')),
(3, (SELECT id FROM "Players" WHERE "name"='Galah')),
(3, (SELECT id FROM "Players" WHERE "name"='Häkken')),
(3, (SELECT id FROM "Players" WHERE "name"='Harkana')),
(3, (SELECT id FROM "Players" WHERE "name"='Jenova')),
(3, (SELECT id FROM "Players" WHERE "name"='Môu')),
(3, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(3, (SELECT id FROM "Players" WHERE "name"='Myorekt')),
(3, (SELECT id FROM "Players" WHERE "name"='Njørd')),
(3, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(3, (SELECT id FROM "Players" WHERE "name"='Paûlette')),
(3, (SELECT id FROM "Players" WHERE "name"='Rajan')),
(3, (SELECT id FROM "Players" WHERE "name"='Sazio')),
(3, (SELECT id FROM "Players" WHERE "name"='Tohltahr')),
(3, (SELECT id FROM "Players" WHERE "name"='Withoutmana')),
(3, (SELECT id FROM "Players" WHERE "name"='Zaela')),
(3, (SELECT id FROM "Players" WHERE "name"='Zérra'))
;
