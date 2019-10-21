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
('Devilhunter'  , 6,  'admin', '55fc5b709962876903785fd64a6961e5', true, true),
('test'         , 1,  'admin', '098f6bcd4621d373cade4e832627b4f6', true, false),
('Lums'         , 7,  'officer', null, true, true),
('Deiv'         , 1,  'officer', null, true, true),
('Krigen'       , 8,  'officer', null, true, true),
('Cocobanjo'    , 4,  'classMaster', null, true, true),
('Nozil'        , 6,  'classMaster', null, true, true),
('Oscuro'       , 9,  'classMaster', null, true, true),
('Paffë'        , 5,  'classMaster', null, true, true),
('Skwäsh'       , 1,  'classMaster', null, true, true),
('Tàel'         , 3,  'classMaster', null, true, true),
('Ragegoriath'  , 8,  'classMaster', null, true, true),
('Abramus'      , 2,  'classMaster', null, true, true),
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
('Need'         , 1,  'player', null, true, false),
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
('Yx'           , 4,  'player', null, true, false),
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
('Rassis'       , 3,  'player', null, true, false)
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