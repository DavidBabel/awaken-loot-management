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
('awaken'       , 6,  'player', 'a4261bb727d95e6df608247a6559571f', true, true), -- awakentest
('admin'        , 1,  'admin', '84ad2112b283ac8f9e59d062d531917b', true, false),
('officer'      , 1,  'officer', '071b8d0d37313edbaf88c5f8cc198a22', true, false),
('classMaster'  , 1,  'classMaster', 'ca114be619ce539ca093ee7121acf98b', true, false),
('player'       , 1,  'player', '0cd8250454e6003c270680b4fca3583c', true, false),
('Lums'         , 7,  'player', null, true, true),
('Deiv'         , 1,  'player', null, true, true),
('Krigen'       , 8,  'player', null, true, true),
('Cocobanjo'    , 4,  'player', null, true, true),
('Nozil'        , 6,  'player', '950382a04140bcdab437600b0928ec63', true, true),
('Oscuro'       , 9,  'player', null, true, true),
('Paffë'        , 5,  'player', null, true, true),
('Skwäsh'       , 1,  'player', '2f8b09d7750539ba0d7853cd1eae78ee', true, true),
('Tàel'         , 3,  'player', null, true, true),
('Ragegoriath'  , 8,  'player', null, true, true),
('Abramus'      , 2,  'player', null, true, true),
('Shaheem'      , 3,  'player', null, false, false),
('Hakken'       , 2,  'player', null, false, false),
('Adblock'      , 2,  'player', null, true, false),
('Affligeant'   , 3,  'player', null, false, false),
('Alk'          , 6,  'player', null, true, false),
('Allyssamyr'   , 2,  'player', null, true, false),
('Beudinio'     , 5,  'player', null, false, false),
('Bobbyz'       , 9,  'player', null, true, false),
('Boblemoche'   , 3,  'player', null, true, false),
('Brebouche'    , 8,  'player', null, true, false),
('Brk'          , 1,  'player', null, false, false),
('Brosko'       , 9,  'player', null, true, false),
('Bruh'         , 3,  'player', null, false, false),
('Callumlolz'   , 4,  'player', null, true, false),
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
('Ladj'         , 8,  'player', null, true, false),
('Lyaxus'       , 7,  'player', null, false, false),
('Lykwette'     , 8,  'player', null, true, false),
('Lylith'       , 1,  'player', null, true, false),
('Mergueztguez' , 7,  'player', null, true, false),
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
('Skau'         , 1,  'player', null, false, false),
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
('Felrik'       , 9,  'player', null, true, false),
('Kgr'          , 3,  'player', null, true, false),
('Kheya'        , 4,  'player', null, true, false),
('Caëdo'        , 4,  'player', null, true, false),
('Weezy'        , 3,  'player', null, true, false),
('Paren'        , 6,  'player', null, true, false),
('Munuxi'       , 1,  'player', null, true, false),
('Hyknoz'       , 3,  'player', null, true, false),
('Sopalin'      , 4,  'player', null, true, false),
('Gkz'          , 4,  'player', null, true, false),
('Zebaww'       , 6,  'player', null, true, false),
('Krijgs'       , 8,  'player', null, true, false),
('Volzam'       , 6,  'player', null, true, false),
('Romek'        , 2,  'player', null, true, false),
('Rupt'         , 4,  'player', null, true, false),
('Ané'          , 9,  'player', null, true, false),
('Squeeze'      , 4,  'player', null, true, false)
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