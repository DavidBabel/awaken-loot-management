 -- SAFE BEGIN FOR CONCAT

-- admin
-- officer
-- classMaster
-- player
-- guest


INSERT INTO "Players" ("name", "classId", "role", "password", "active", "inRoster")
VALUES
('Non Assigné'  , 9,  'player', null, false, false),
('Devilhawk'    , 17,  'admin', '71c0665585d07663b6955dd9d43fa209', true, true),
('awaken'       , 6,  'player', '71c0665585d07663b6955dd9d43fa209', false, true),
('admin'        , 1,  'admin', '71c0665585d07663b6955dd9d43fa209', false, false),
('officer'      , 1,  'officer', '71c0665585d07663b6955dd9d43fa209', false, false),
('classMaster'  , 1,  'classMaster', '71c0665585d07663b6955dd9d43fa209', false, false),
('player'       , 1,  'player', '28d1fc4380e4adb521742bdd6ad260b9', false, false),

('Alkriminal',  12, 'player', '2554dbad66e1367b98f6c52cea0811b6', true, false),
('Altayr',      12, 'player', 'e342047629c9a3fceaa1e06697b10733', true, false),
('Ataraxíe',    6, 'player', null, true, false),
('Baabz',       15, 'player', 'c55166fc9f98c47b0843846f788ec5be', true, false),
('Bobbyzz',     14, 'officer', 'dbb26197ef7aedcd9eb245d8c7704739', true, false),
('Bouzor',      7, 'player', '5382096c77eb7f738ff036a2a77d73a3', true, false),
('Callumlolz',  12, 'player', '3a71cf7d29651123d5955d292a0dcad1', true, false),
('Chendø',      8, 'player', null, true, false),
('Dakilla',     9, 'officer', '827f4fb1af2ed8076d59aaa768311ba6', true, false),
('Dralnox',     6, 'player', null, true, false),
('Galah',       17, 'player', null, true, false),
('Häkken',      16, 'player', 'b850de7d249d9253ba37cd8401ebbc82', true, false),
('Harkana',     13, 'player', null, true, false),
('Jenova',      16, 'player', '6fc8899635d8a60cf9c38b03c12709f0', true, false),
-- ('Kedry',       1, 'player', null, true, false),
('Keiki',       6, 'player', 'c20668853a93f45e52ae25bf3d4bcb63', true, false),
('Laadj',       3, 'officer', 'ab12eade6d0082c4ae345e496df545cb', true, false),
('Môu',         9, 'player', null, true, false),
('Munuxi',      13, 'player', '39f7ea3b4452666a2e21dc56d2fd352d', true, false),
('Myorekt',     3, 'player', null, true, false),
('Njørd',       8, 'player', '89d37e27ac1f26f0aa16046f79820338', true, false),
('Nozil',       17, 'player', '950382a04140bcdab437600b0928ec63', true, false),
('Paûlette',    13, 'player', null, true, false),
('Rajan',       3, 'player', null, true, false),
('Saprocky',    12, 'player', '4e1de04ae389f4aa72a282ea1a0a93e0', true, false),
('Sazio',       15, 'player', null, true, false),
('Tohltahr',    17, 'player', '65e3a848e61e38b08b84cd1dbb4e776c', true, false),
('Withoutmana', 16, 'player', null, true, false),
('Zaela',       1, 'player', 'af5eed1fb763606e8ef00cd491323a91', true, false),
('Zérra',       6, 'player', '676da35cd0c9f8b58bbd04b0a9e99072', true, false),
('Zhorg',       17, 'player', null, true, false),
('Rhyfèwl',     4, 'player', 'd8bbe79143501225968279e0446f66b5', true, false)
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
