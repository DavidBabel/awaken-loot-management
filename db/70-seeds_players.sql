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
