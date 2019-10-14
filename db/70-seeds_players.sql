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


INSERT INTO "Players" ("name", "classId", "role", "password", "active")
VALUES
('Devilhunter'  , 6,  'admin', '55fc5b709962876903785fd64a6961e5', true),
('test'         , 1,  'admin', '098f6bcd4621d373cade4e832627b4f6', true),
('Hakken'       , 2,  'officer', null, true),
('Lums'         , 7,  'officer', null, true),
('Shaheem'      , 3,  'officer', null, false),
('Cocobanjo'    , 4,  'classMaster', null, true),
('Krigen'       , 8,  'classMaster', null, true),
('Nozil'        , 6,  'classMaster', null, true),
('Oscuro'       , 9,  'classMaster', null, true),
('Paffë'        , 5,  'classMaster', null, true),
('Skwäsh'       , 1,  'classMaster', null, true),
('Tàel'         , 3,  'classMaster', null, true),
('Abramus'      , 2,  'player', null, true),
('Adblock'      , 2,  'player', null, true),
('Affligeant'   , 3,  'player', null, false),
('Alk'          , 6,  'player', null, true),
('Allyssamyr'   , 2,  'player', null, true),
('Beudinio'     , 5,  'player', null, false),
('Bobbyz'       , 9,  'player', null, true),
('Boblemoche'   , 3,  'player', null, true),
('Brebouche'    , 8,  'player', null, true),
('Brk'          , 1,  'player', null, false),
('Brosko'       , 9,  'player', null, true),
('Bruh'         , 3,  'player', null, false),
('Callumlolz'   , 4,  'player', null, true),
('Deiv'         , 1,  'player', null, true),
('Drakenns'     , 8,  'player', null, false),
('Elementz'     , 2,  'player', null, false),
('Ez'           , 4,  'player', null, true),
('Gidgud'       , 7,  'player', null, true),
('Hanzaplast'   , 1,  'player', null, false),
('Ikith'        , 2,  'player', null, true),
('Jonasran'     , 4,  'player', null, true),
('Kaarr'        , 4,  'player', null, true),
('Karaelys'     , 1,  'player', null, true),
('Kenyâ'        , 7,  'player', null, true),
('Kresmi'       , 3,  'player', null, false),
('Kusogakî'     , 9,  'player', null, true),
('Kynosura'     , 2,  'player', null, true),
('Ladj'         , 8,  'player', null, true),
('Lyaxus'       , 7,  'player', null, false),
('Lykwette'     , 8,  'player', null, true),
('Lylith'       , 1,  'player', null, true),
('Mergueztguez' , 7,  'player', null, true),
('Minatrix'     , 2,  'player', null, true),
('Need'         , 1,  'player', null, true),
('Nérull'       , 4,  'player', null, false),
('Néstor'       , 3,  'player', null, true),
('Nøwad'        , 9,  'player', null, true),
('Psykøhazard'  , 3,  'player', null, true),
('Punkhead'     , 4,  'player', null, false),
('Qweakzor'     , 6,  'player', null, true),
('Ragegoriath'  , 8,  'player', null, true),
('Ràys'         , 4,  'player', null, true),
('Rektall'      , 3,  'player', null, true),
('Skau'         , 1,  'player', null, false),
('Sprawl'       , 8,  'player', null, false),
('Størmfury'    , 5,  'player', null, false),
('Suprême'      , 3,  'player', null, true),
('Synrj'        , 5,  'player', null, true),
('Tad'          , 7,  'player', null, true),
('Teimdall'     , 1,  'player', null, true),
('Tephrite'     , 5,  'player', null, true),
('Thorsen'      , 2,  'player', null, true),
('Throma'       , 9,  'player', null, true),
('Thünberg'     , 7,  'player', null, true),
('Ticcounet'    , 8,  'player', null, false),
('Titanesque'   , 4,  'player', null, false),
('Trackass'     , 1,  'player', null, true),
('Traqùs'       , 6,  'player', null, true),
('Vòlt'         , 2,  'player', null, false),
('Wid'          , 2,  'player', null, false),
('Xihfu'        , 5,  'player', null, true),
('Yx'           , 4,  'player', null, true),
('Zapikote'     , 3,  'player', null, true),
('Zhantla'      , 7,  'player', null, false),
('Zykxx'        , 7,  'player', null, false),
('Zzeus'        , 2,  'player', null, true),
('Capoul'       , 5,  'player', null, true),
('Capriseum'    , 2,  'player', null, true),
('Chibraltar'   , 6,  'player', null, false),
('Draizon'      , 1,  'player', null, false),
('Easìer'       , 1,  'player', null, true),
('Fougasse'     , 8,  'player', null, false),
('Lusoline'     , 1,  'player', null, false),
('Malvotis'     , 3,  'player', null, false),
('Ogrim'        , 1,  'player', null, false),
('Olv'          , 2,  'player', null, false),
('Rognor'       , 7,  'player', null, false),
('Secaly'       , 4,  'player', null, false)
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