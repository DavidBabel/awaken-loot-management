 -- SAFE BEGIN FOR CONCAT
-- 1 => Molten Core
-- 2 => Onyxia Lair
-- 3 => Blackwing Lair
-- 4 => Ahn‘Qiraj Temple
-- 5 => Naxxramas
-- 6 => Ahn‘Qiraj Ruins
-- 7 => Zul‘Gurub

INSERT INTO "Raids" ("donjonId", "date")
VALUES
(1, '2019-09-19'), -- 1
(1, '2019-09-22'), -- 2
(2, '2019-09-24'), -- 3
(1, '2019-09-25'), -- 4
(2, '2019-09-29'), -- 5
(1, '2019-09-29'), -- 6
(2, '2019-10-01'), -- 7
(1, '2019-10-01'), -- 8
(1, '2019-10-02'), -- 9
(1, '2019-10-06'), -- 10
(2, '2019-10-06'); -- 11


-- MC 2019-09-19
-- INSERT INTO "RaidPlayers" ("playerId", "raidId")
-- VALUES
-- (1, 1),
-- (1, 1);

-- MC 2019-09-22
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(2, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(2, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(2, (SELECT id FROM "Players" WHERE "name"='Ticcounet')),
(2, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(2, (SELECT id FROM "Players" WHERE "name"='Størmfury')),
(2, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(2, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(2, (SELECT id FROM "Players" WHERE "name"='Traqùs')),
(2, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(2, (SELECT id FROM "Players" WHERE "name"='Elementz')),
(2, (SELECT id FROM "Players" WHERE "name"='Kynosura')),
(2, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(2, (SELECT id FROM "Players" WHERE "name"='Vòlt')),
(2, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(2, (SELECT id FROM "Players" WHERE "name"='Hanzaplast')),
(2, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(2, (SELECT id FROM "Players" WHERE "name"='Nérull')),
(2, (SELECT id FROM "Players" WHERE "name"='Punkhead')),
(2, (SELECT id FROM "Players" WHERE "name"='Titanesque')),
(2, (SELECT id FROM "Players" WHERE "name"='Lyaxus')),
(2, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(2, (SELECT id FROM "Players" WHERE "name"='Affligeant')),
(2, (SELECT id FROM "Players" WHERE "name"='Bruh')),
(2, (SELECT id FROM "Players" WHERE "name"='Kresmi')),
(2, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(2, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(2, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(2, (SELECT id FROM "Players" WHERE "name"='Drakenns')),
(2, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(2, (SELECT id FROM "Players" WHERE "name"='Sprawl')),
(2, (SELECT id FROM "Players" WHERE "name"='Beudinio')),
(2, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(2, (SELECT id FROM "Players" WHERE "name"='Brk')),
(2, (SELECT id FROM "Players" WHERE "name"='Lylith')),
(2, (SELECT id FROM "Players" WHERE "name"='Skau')),
(2, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(2, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(2, (SELECT id FROM "Players" WHERE "name"='Zhantla')),
(2, (SELECT id FROM "Players" WHERE "name"='Zykxx'));

-- MC 2019-09-22
-- TODO onyxia


-- MC full guilde 2019-09-25
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(4, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(4, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(4, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(4, (SELECT id FROM "Players" WHERE "name"='Throma')),
(4, (SELECT id FROM "Players" WHERE "name"='Alk')),
(4, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(4, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(4, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(4, (SELECT id FROM "Players" WHERE "name"='Traqùs')),
(4, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(4, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(4, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(4, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(4, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(4, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(4, (SELECT id FROM "Players" WHERE "name"='Wid')),
(4, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(4, (SELECT id FROM "Players" WHERE "name"='Need')),
(4, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(4, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(4, (SELECT id FROM "Players" WHERE "name"='Ez')),
(4, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(4, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(4, (SELECT id FROM "Players" WHERE "name"='Yx')),
(4, (SELECT id FROM "Players" WHERE "name"='Lyaxus')),
(4, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(4, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(4, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(4, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(4, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(4, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(4, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(4, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(4, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(4, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(4, (SELECT id FROM "Players" WHERE "name"='Teimdall')),
(4, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(4, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(4, (SELECT id FROM "Players" WHERE "name"='Kenyâ'));
-- INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
-- VALUES
-- TODO finir de notez ceux qui ont passer leur tour
-- (4, (SELECT id FROM "Players" WHERE "name"='Abramus'), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true)
;

-- Ony full guilde 2019-09-29
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(5, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(5, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(5, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(5, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(5, (SELECT id FROM "Players" WHERE "name"='Alk')),
(5, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(5, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(5, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(5, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(5, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(5, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(5, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(5, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(5, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(5, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(5, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(5, (SELECT id FROM "Players" WHERE "name"='Ez')),
(5, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(5, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(5, (SELECT id FROM "Players" WHERE "name"='Yx')),
(5, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(5, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(5, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(5, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(5, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(5, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(5, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(5, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(5, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(5, (SELECT id FROM "Players" WHERE "name"='Throma')),
(5, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(5, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(5, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(5, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(5, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(5, (SELECT id FROM "Players" WHERE "name"='Need')),
(5, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(5, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(5, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(5, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));


-- MC 3 bosses first DOMO 2019-09-29
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(6, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(6, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(6, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(6, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(6, (SELECT id FROM "Players" WHERE "name"='Alk')),
(6, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(6, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(6, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(6, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(6, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(6, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(6, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(6, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(6, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(6, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(6, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(6, (SELECT id FROM "Players" WHERE "name"='Ez')),
(6, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(6, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(6, (SELECT id FROM "Players" WHERE "name"='Yx')),
(6, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(6, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(6, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(6, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(6, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(6, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(6, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(6, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(6, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(6, (SELECT id FROM "Players" WHERE "name"='Throma')),
(6, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(6, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(6, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(6, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(6, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(6, (SELECT id FROM "Players" WHERE "name"='Need')),
(6, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(6, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(6, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(6, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(6, (SELECT id FROM "Players" WHERE "name"='Traqùs'), true);


-- Ony avant les try ragnaros 2019-10-01
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(7, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(7, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(7, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(7, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(7, (SELECT id FROM "Players" WHERE "name"='Throma')),
(7, (SELECT id FROM "Players" WHERE "name"='Alk')),
(7, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(7, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(7, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(7, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(7, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(7, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(7, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(7, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(7, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(7, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(7, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(7, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(7, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(7, (SELECT id FROM "Players" WHERE "name"='Ez')),
(7, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(7, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(7, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(7, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(7, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(7, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(7, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(7, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(7, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(7, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(7, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(7, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(7, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(7, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(7, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(7, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(7, (SELECT id FROM "Players" WHERE "name"='Need')),
(7, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(7, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(7, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(7, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));

-- try ragnaros 2019-10-01
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(8, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(8, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(8, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(8, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(8, (SELECT id FROM "Players" WHERE "name"='Throma')),
(8, (SELECT id FROM "Players" WHERE "name"='Alk')),
(8, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(8, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(8, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(8, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(8, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(8, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(8, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(8, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(8, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(8, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(8, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(8, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(8, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(8, (SELECT id FROM "Players" WHERE "name"='Ez')),
(8, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(8, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(8, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(8, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(8, (SELECT id FROM "Players" WHERE "name"='Rektall')),
(8, (SELECT id FROM "Players" WHERE "name"='Shaheem')),
(8, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(8, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(8, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(8, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(8, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(8, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(8, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(8, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(8, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(8, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(8, (SELECT id FROM "Players" WHERE "name"='Need')),
(8, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(8, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(8, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(8, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'));


-- MC 8 bosses 2019-10-02 (pas de raidstats)
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- manually entered :
(9, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(9, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(9, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(9, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(9, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(9, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(9, (SELECT id FROM "Players" WHERE "name"='Ez')),
(9, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(9, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(9, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(9, (SELECT id FROM "Players" WHERE "name"='Alk')),
(9, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(9, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(9, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(9, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(9, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(9, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(9, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(9, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(9, (SELECT id FROM "Players" WHERE "name"='Synrj'))
;
-- TODO get screenshot or stream to complete attendees

-- MC first down ragna 2019-10-06
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(10, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(10, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(10, (SELECT id FROM "Players" WHERE "name"='Alk')),
(10, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(10, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(10, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(10, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(10, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(10, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(10, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(10, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(10, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(10, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(10, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(10, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(10, (SELECT id FROM "Players" WHERE "name"='Ez')),
(10, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(10, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(10, (SELECT id FROM "Players" WHERE "name"='Yx')),
(10, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(10, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(10, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(10, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(10, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(10, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(10, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(10, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(10, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(10, (SELECT id FROM "Players" WHERE "name"='Throma')),
(10, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(10, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(10, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(10, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(10, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(10, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(10, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(10, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(10, (SELECT id FROM "Players" WHERE "name"='Lums')),
(10, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;

-- Onyxia down post ragna 2019-10-06
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(11, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(11, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(11, (SELECT id FROM "Players" WHERE "name"='Alk')),
(11, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(11, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(11, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(11, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(11, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(11, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(11, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(11, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(11, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(11, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(11, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(11, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(11, (SELECT id FROM "Players" WHERE "name"='Ez')),
(11, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(11, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(11, (SELECT id FROM "Players" WHERE "name"='Yx')),
(11, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(11, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(11, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(11, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(11, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(11, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(11, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(11, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(11, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(11, (SELECT id FROM "Players" WHERE "name"='Throma')),
(11, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(11, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(11, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(11, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(11, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(11, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(11, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(11, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(11, (SELECT id FROM "Players" WHERE "name"='Lums')),
(11, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


