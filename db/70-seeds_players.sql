 -- SAFE BEGIN FOR CONCAT

-- admin
-- officer
-- classMaster
-- player
-- guest

-- 1 - Prêtre
-- 2 - Mage
-- 3 - Démoniste
-- 4 - Voleur
-- 5 - Druide
-- 6 - Chasseur
-- 7 - Chaman
-- 8 - Guerrier Tank
-- 9 - Guerrier DPS
-- 10 - Paladin


INSERT INTO "Players" ("name", "classId", "role", "password", "active", "inRoster")
VALUES
('Devilhunter'  , 6,  'admin', '71c0665585d07663b6955dd9d43fa209', true, true),
('awaken'       , 6,  'player', 'a4261bb727d95e6df608247a6559571f', false, true), -- awakentest
('admin'        , 1,  'admin', '84ad2112b283ac8f9e59d062d531917b', false, false),
('officer'      , 1,  'officer', '071b8d0d37313edbaf88c5f8cc198a22', false, false),
('classMaster'  , 1,  'classMaster', '71c0665585d07663b6955dd9d43fa209', true, false),
('player'       , 1,  'player', '28d1fc4380e4adb521742bdd6ad260b9', true, false),
('Lums'         , 7,  'player', null, true, true),
('Deiv'         , 1,  'player', '5a29ca97ad30bb6484a3832042ff7f2b', true, true),
('Krigen'       , 8,  'player', '1ce82060116628e67b6dfa004ce8d70a', true, true),
('Cocobanjo'    , 4,  'player', null, true, true),
('Nozil'        , 6,  'player', '950382a04140bcdab437600b0928ec63', true, true),
('Oscuro'       , 9,  'player', null, true, true),
('Paffë'        , 12,  'player', null, true, true),
('Skwäsh'       , 1,  'player', '2f8b09d7750539ba0d7853cd1eae78ee', true, true),
('Tàel'         , 3,  'player', null, true, true),
('Ragegoriath'  , 8,  'player', 'e3b557b6f939ad38f1610dd5102b1ee7', true, true),
('Abramus'      , 2,  'player', '36c22332185e0dba36d442e66a83e706', true, true),
('Shaheem'      , 3,  'player', null, false, false),
('Hakken'       , 2,  'player', null, false, false),
('Adblock'      , 2,  'player', 'fff2cc3acaab98a5b0b7f0550c6981df', true, false),
('Affligeant'   , 3,  'player', null, false, false),
('Alk'          , 6,  'player', '2554dbad66e1367b98f6c52cea0811b6', true, false),
('Allyssamyr'   , 2,  'player', null, true, false),
('Beudinio'     , 5,  'player', null, false, false),
('Bobbyz'       , 9,  'player', null, true, false),
('Boblemoche'   , 3,  'player', null, true, false),
('Brebouche'    , 8,  'player', null, true, false),
('Brk'          , 1,  'player', null, false, false),
('Brosko'       , 9,  'player', null, true, false),
('Bruh'         , 3,  'player', null, false, false),
('Callumlolz'   , 4,  'player', '8ccda50d6e0346eee3c691a94a797942', true, false),
('Drakenns'     , 8,  'player', null, false, false),
('Elementz'     , 2,  'player', null, false, false),
('Ez'           , 4,  'player', null, true, false),
('Gidgud'       , 7,  'player', null, true, false),
('Hanzaplast'   , 1,  'player', null, false, false),
('Ikith'        , 2,  'player', null, true, false),
('Jonasran'     , 4,  'player', null, true, false),
('Kaarr'        , 4,  'player', null, true, false),
('Karaelys'     , 1,  'player', null, true, false),
('Kenyâ'        , 7,  'player', null, true, false),
('Kresmi'       , 3,  'player', null, false, false),
('Kusogakî'     , 9,  'player', null, true, false),
('Kynosura'     , 2,  'player', null, true, false),
('Ladj'         , 8,  'player', '885eeaac6ca8a9456d6d73fbb6e7f12e', true, false),
('Lyaxus'       , 7,  'player', null, false, false),
('Lykwette'     , 8,  'player', null, true, false),
('Lylith'       , 1,  'player', null, true, false),
('Mergueztguez' , 13,  'player', null, true, false),
('Minatrix'     , 2,  'player', null, true, false),
('Need'         , 1,  'player', 'b1d38a948caf22ca343d9efc2d36729e', true, false),
('Nérull'       , 4,  'player', null, false, false),
('Néstor'       , 3,  'player', null, true, false),
('Nøwad'        , 9,  'player', null, true, false),
('Psykøhazard'  , 3,  'player', null, true, false),
('Punkhead'     , 4,  'player', null, false, false),
('Qweakzor'     , 6,  'player', null, true, false),
('Ràys'         , 4,  'player', null, true, false),
('Rektall'      , 3,  'player', null, true, false),
('Skau'         , 11,  'player', null, true, false),
('Sprawl'       , 8,  'player', null, false, false),
('Størmfury'    , 5,  'player', null, false, false),
('Suprême'      , 3,  'player', null, true, false),
('Synrj'        , 5,  'player', null, true, false),
('Tad'          , 7,  'player', null, true, false),
('Teimdall'     , 1,  'player', null, true, false),
('Tephrite'     , 5,  'player', null, true, false),
('Thorsen'      , 2,  'player', null, true, false),
('Throma'       , 9,  'player', null, true, false),
('Thünberg'     , 7,  'player', null, true, false),
('Ticcounet'    , 8,  'player', null, false, false),
('Titanesque'   , 4,  'player', null, false, false),
('Trackass'     , 1,  'player', null, true, false),
('Traqùs'       , 6,  'player', null, false, false),
('Vòlt'         , 2,  'player', null, false, false),
('Wid'          , 2,  'player', null, false, false),
('Xihfu'        , 5,  'player', null, true, false),
('Yx'           , 4,  'player', '752c3c7a999aa21ac20b19f172a8463d', true, false),
('Zapikote'     , 2,  'player', null, true, false),
('Zhantla'      , 7,  'player', null, false, false),
('Zykxx'        , 7,  'player', null, false, false),
('Zzeus'        , 2,  'player', null, true, false),
('Capoul'       , 5,  'player', null, true, false),
('Capriseum'    , 2,  'player', null, true, false),
('Chibraltar'   , 6,  'player', null, false, false),
('Draizon'      , 1,  'player', null, false, false),
('Easìer'       , 1,  'player', null, true, false),
('Fougasse'     , 8,  'player', null, false, false),
('Lusoline'     , 1,  'player', null, false, false),
('Malvotis'     , 3,  'player', null, false, false),
('Ogrim'        , 1,  'player', null, false, false),
('Olv'          , 2,  'player', null, false, false),
('Rognor'       , 7,  'player', null, false, false),
('Secaly'       , 4,  'player', null, false, false),
('Keiki'        , 7,  'player', null, true, false),
('Øupla'        , 4,  'player', null, true, false),
('Flash'        , 7,  'player', null, true, false),
('Knh'          , 5,  'player', null, true, false),
-- ('Øups'        , 7,  'player', null, true, false),
-- ('Slov'        , 7,  'player', null, true, false),
('Elgor'        , 9,  'player', null, true, false),
('Rassis'       , 3,  'player', null, true, false),
('Owhlord'      , 2,  'player', null, true, false),
('Angelus'      , 9,  'player', null, true, false),
('Felrik'       , 9,  'player', '26b0386e5b40cceb3be2ff00e2a32a8c', true, false),
('Kgr'          , 3,  'player', '4523bea82ba2f9c9d30644931d2dc35e', true, false),
('Kheya'        , 4,  'player', null, true, false),
('Caëdo'        , 4,  'player', '4432062f5df9be53c4c50741321644a4', true, false),
('Weezy'        , 3,  'player', null, true, false),
('Paren'        , 6,  'player', null, true, false),
('Munuxi'       , 1,  'player', null, true, false),
('Hyknoz'       , 3,  'player', null, true, false),
('Sopalin'      , 4,  'player', null, true, false),
('Gkz'          , 4,  'player', null, true, false),
('Zebaww'       , 6,  'player', null, true, false),
('Krijgs'       , 8,  'player', null, true, false),
('Volzam'       , 6,  'player', '3ab013c196ad5aeebc46b51d451daa08', true, false),
('Romek'        , 2,  'player', '8f7029a25f593e64a888e673ce5689a9', true, false),
('Rupt'         , 4,  'player', null, true, false),
('Ané'          , 9,  'player', null, true, false),
('Squeeze'      , 4,  'player', 'a8c934f5d23534db9db4db7b91c558e7', true, false),
('Blackgïft'    , 8,  'player', null, true, false),
('Skedone'      , 9,  'player', null, true, false),
('fucked-1'     , 1,  'player', null, false, false),
('Spydermatrix' , 2,  'player', null, true, false),
('Waira'        , 3,  'player', null, true, false),
('Panou'        , 7,  'player', null, true, false),
('Non Assigné'  , 5,  'player', null, false, false)
;

-- 1 - Prêtre
-- 2 - Mage
-- 3 - Démoniste
-- 4 - Voleur
-- 5 - Druide
-- 6 - Chasseur
-- 7 - Chaman
-- 8 - Guerrier Tank
-- 9 - Guerrier DPS
-- 10 - Paladin
