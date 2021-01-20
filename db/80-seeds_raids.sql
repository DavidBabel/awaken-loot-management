 -- SAFE BEGIN FOR CONCAT

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
(2, '2019-10-06'), -- 11
(1, '2019-10-09'), -- 12
(2, '2019-10-13'), -- 13
(1, '2019-10-16'), -- 14
(2, '2019-10-20'), -- 15
(1, '2019-10-20'), -- 16
(2, '2019-10-21'), -- 17
(1, '2019-10-23'), -- 18
(2, '2019-10-27'), -- 19
(1, '2019-10-27'), -- 20
(2, '2019-10-28'), -- 21
(1, '2019-10-30'), -- 22
(1, '2019-10-30'), -- 23
(2, '2019-11-03'), -- 24 - all ony
(2, '2019-11-05'), -- 24 - all ony
(1, '2019-11-06'), -- 25
(1, '2021-11-07'), -- 26
(3, '2021-11-07'),
(4, '2021-11-07'),
(5, '2021-11-07');

-- 1 => Molten Core
-- 2 => Onyxia Lair
-- 3 => Blackwing Lair
-- 4 => Ahn‘Qiraj Temple
-- 5 => Naxxramas
-- 6 => Ahn‘Qiraj Ruins
-- 7 => Zul‘Gurub


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
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(4, (SELECT id FROM "Players" WHERE "name"='Abramus'), true)
-- TODO finir de notez ceux qui ont passer leur tour
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


-- Full MC - 2019-10-09
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(12, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(12, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(12, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(12, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(12, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(12, (SELECT id FROM "Players" WHERE "name"='Alk')),
(12, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(12, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(12, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(12, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(12, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(12, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(12, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(12, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(12, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(12, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(12, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(12, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(12, (SELECT id FROM "Players" WHERE "name"='Ez')),
(12, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(12, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(12, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(12, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(12, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(12, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(12, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(12, (SELECT id FROM "Players" WHERE "name"='Nøwad')),
(12, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(12, (SELECT id FROM "Players" WHERE "name"='Throma')),
(12, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(12, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(12, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(12, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(12, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(12, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(12, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(12, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(12, (SELECT id FROM "Players" WHERE "name"='Lums')),
(12, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(12, (SELECT id FROM "Players" WHERE "name"='Tad'))
;
INSERT INTO "RaidPlayers" ("raidId", "playerId", "passed")
VALUES
(12, (SELECT id FROM "Players" WHERE "name"='Ikith'), true);


-- double id onyxia - 2019-10-13
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- raid Devilhunter
(13, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(13, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(13, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(13, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(13, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(13, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(13, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(13, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(13, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(13, (SELECT id FROM "Players" WHERE "name"='Ez')),
(13, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(13, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(13, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(13, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(13, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(13, (SELECT id FROM "Players" WHERE "name"='Throma')),
(13, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(13, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(13, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(13, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(13, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(13, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(13, (SELECT id FROM "Players" WHERE "name"='Tad')),
(13, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- raid Lums
(13, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(13, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(13, (SELECT id FROM "Players" WHERE "name"='Alk')),
(13, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(13, (SELECT id FROM "Players" WHERE "name"='Hakken')),
(13, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(13, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(13, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(13, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(13, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(13, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(13, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(13, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(13, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(13, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(13, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(13, (SELECT id FROM "Players" WHERE "name"='Synrj')),
(13, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(13, (SELECT id FROM "Players" WHERE "name"='Skau')),
(13, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(13, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(13, (SELECT id FROM "Players" WHERE "name"='Lums'));

-- double id MC + Pickup Elgor - 2019-10-16
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- raid Devilhunter
(14, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(14, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(14, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(14, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(14, (SELECT id FROM "Players" WHERE "name"='Alk')),
(14, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(14, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(14, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(14, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(14, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(14, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(14, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(14, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(14, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(14, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(14, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(14, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(14, (SELECT id FROM "Players" WHERE "name"='Ez')),
(14, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(14, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(14, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(14, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(14, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(14, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(14, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(14, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(14, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(14, (SELECT id FROM "Players" WHERE "name"='Throma')),
(14, (SELECT id FROM "Players" WHERE "name"='Knh')),
(14, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(14, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(14, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(14, (SELECT id FROM "Players" WHERE "name"='Need')),
(14, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(14, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(14, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(14, (SELECT id FROM "Players" WHERE "name"='Lums')),
(14, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(14, (SELECT id FROM "Players" WHERE "name"='Tad')),
(14, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- raid Elgor
(14, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(14, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Mmeeuh')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Leugimdetroy')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Orcgasmïk')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Désølé')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Hydroxyde')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Linze')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Løbø')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Phoen')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Skyral')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Xidie')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Troispoules')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Alphaketa')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Coldgaze')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Jeunecitron')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Mebs')),
(14, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(14, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Jây')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Pitbuff')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Ragegueg')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Relma')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Aragonia')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Dukine')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Paulotemple')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Soralock')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Dùf')),
(14, (SELECT id FROM "Players" WHERE "name"='Elgor')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Underik')),
(14, (SELECT id FROM "Players" WHERE "name"='Capoul')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Djowcoco')),
(14, (SELECT id FROM "Players" WHERE "name"='Easìer')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Kikootoubib')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Maestrya')),
(14, (SELECT id FROM "Players" WHERE "name"='Skau')),
(14, (SELECT id FROM "Players" WHERE "name"='Flash')),
(14, (SELECT id FROM "Players" WHERE "name"='Keiki'))
-- (14, (SELECT id FROM "Players" WHERE "name"='Slov')),
-- (14, (SELECT id FROM "Players" WHERE "name"='Øups'))

;


-- double id onyxia - 2019-10-20
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- Raid deiv
(15, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(15, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(15, (SELECT id FROM "Players" WHERE "name"='Alk')),
(15, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(15, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(15, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(15, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(15, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(15, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(15, (SELECT id FROM "Players" WHERE "name"='Ez')),
(15, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(15, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(15, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(15, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(15, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(15, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(15, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(15, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(15, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(15, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(15, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(15, (SELECT id FROM "Players" WHERE "name"='Need')),
(15, (SELECT id FROM "Players" WHERE "name"='Lums')),
(15, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(15, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- Raid devilhunter
(15, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(15, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(15, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(15, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(15, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(15, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(15, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(15, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(15, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(15, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(15, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(15, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(15, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(15, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(15, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(15, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(15, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(15, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(15, (SELECT id FROM "Players" WHERE "name"='Throma')),
(15, (SELECT id FROM "Players" WHERE "name"='Knh')),
(15, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(15, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(15, (SELECT id FROM "Players" WHERE "name"='Skau')),
(15, (SELECT id FROM "Players" WHERE "name"='Flash')),
(15, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(15, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(15, (SELECT id FROM "Players" WHERE "name"='Kenyâ'))
;


-- fin MC elgor - 2019-10-20
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(16, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(16, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(16, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Relma')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Leugimdetroy')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Orcgasmïk')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Dohlol')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Désølé')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Linze')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Loanagain')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Lollÿ')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Løbø')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Phoen')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Pyrobolt')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Skyral')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Troispoules')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Alphaketa')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Atréides')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Coldgaze')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Jeunecitron')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Mebs')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Sopalin')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Swyyt')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Wishmaster')),
(16, (SELECT id FROM "Players" WHERE "name"='Øupla')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Aragonia')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Paulotemple')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Soralock')),
(16, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(16, (SELECT id FROM "Players" WHERE "name"='Capoul')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Djowcoco')),
(16, (SELECT id FROM "Players" WHERE "name"='Easìer')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Kikootoubib')),
(16, (SELECT id FROM "Players" WHERE "name"='Skau')),
(16, (SELECT id FROM "Players" WHERE "name"='Flash')),
(16, (SELECT id FROM "Players" WHERE "name"='Gidgud')),
(16, (SELECT id FROM "Players" WHERE "name"='Keiki'))
-- (16, (SELECT id FROM "Players" WHERE "name"='Pitbuff')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Ragegueg')),
-- (16, (SELECT id FROM "Players" WHERE "name"='Slov')),
;

-- double id onyxia - 2019-10-17
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
-- devilhunter
(17, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(17, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(17, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(17, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(17, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(17, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(17, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(17, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(17, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(17, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(17, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(17, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(17, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(17, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(17, (SELECT id FROM "Players" WHERE "name"='Elgor')),
(17, (SELECT id FROM "Players" WHERE "name"='Felrik')),
(17, (SELECT id FROM "Players" WHERE "name"='Oscuro')),
(17, (SELECT id FROM "Players" WHERE "name"='Knh')),
(17, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(17, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(17, (SELECT id FROM "Players" WHERE "name"='Skau')),
(17, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(17, (SELECT id FROM "Players" WHERE "name"='Mergueztguez')),
(17, (SELECT id FROM "Players" WHERE "name"='Thünberg')),
-- ragegoriath
(17, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(17, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(17, (SELECT id FROM "Players" WHERE "name"='Alk')),
(17, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(17, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(17, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(17, (SELECT id FROM "Players" WHERE "name"='Minatrix')),
(17, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(17, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(17, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(17, (SELECT id FROM "Players" WHERE "name"='Ez')),
(17, (SELECT id FROM "Players" WHERE "name"='Yx')),
(17, (SELECT id FROM "Players" WHERE "name"='Néstor')),
(17, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(17, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(17, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(17, (SELECT id FROM "Players" WHERE "name"='Brosko')),
(17, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(17, (SELECT id FROM "Players" WHERE "name"='Throma')),
(17, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(17, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(17, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
(17, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(17, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(17, (SELECT id FROM "Players" WHERE "name"='Flash')),
(17, (SELECT id FROM "Players" WHERE "name"='Lums')),
(17, (SELECT id FROM "Players" WHERE "name"='Tad'))
;


-- RAID 1 ragnaros (soir du bug) 23/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(18, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(18, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(18, (SELECT id FROM "Players" WHERE "name"='Ladj')),
(18, (SELECT id FROM "Players" WHERE "name"='Alk')),
(18, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(18, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(18, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(18, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(18, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(18, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(18, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(18, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(18, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(18, (SELECT id FROM "Players" WHERE "name"='Caëdo')),
(18, (SELECT id FROM "Players" WHERE "name"='Ez')),
(18, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(18, (SELECT id FROM "Players" WHERE "name"='Kheya')),
(18, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(18, (SELECT id FROM "Players" WHERE "name"='Yx')),
(18, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(18, (SELECT id FROM "Players" WHERE "name"='Boblemoche')),
(18, (SELECT id FROM "Players" WHERE "name"='Kgr')),
(18, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(18, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(18, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(18, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(18, (SELECT id FROM "Players" WHERE "name"='Throma')),
(18, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(18, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(18, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(18, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(18, (SELECT id FROM "Players" WHERE "name"='Skau')),
(18, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(18, (SELECT id FROM "Players" WHERE "name"='Flash')),
(18, (SELECT id FROM "Players" WHERE "name"='Keiki')),
(18, (SELECT id FROM "Players" WHERE "name"='Kenyâ')),
(18, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


-- Onyxia Raid 1 : 27/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(19, (SELECT id FROM "Players" WHERE "name"='Brebouche')),
(19, (SELECT id FROM "Players" WHERE "name"='Throma')),
(19, (SELECT id FROM "Players" WHERE "name"='Alk')),
(19, (SELECT id FROM "Players" WHERE "name"='Nozil')),
(19, (SELECT id FROM "Players" WHERE "name"='Paren')),
(19, (SELECT id FROM "Players" WHERE "name"='Abramus')),
(19, (SELECT id FROM "Players" WHERE "name"='Allyssamyr')),
(19, (SELECT id FROM "Players" WHERE "name"='Capriseum')),
(19, (SELECT id FROM "Players" WHERE "name"='Ikith')),
(19, (SELECT id FROM "Players" WHERE "name"='Owhlord')),
(19, (SELECT id FROM "Players" WHERE "name"='Zapikote')),
(19, (SELECT id FROM "Players" WHERE "name"='Zzeus')),
(19, (SELECT id FROM "Players" WHERE "name"='Caëdo')),
(19, (SELECT id FROM "Players" WHERE "name"='Cocobanjo')),
(19, (SELECT id FROM "Players" WHERE "name"='Ez')),
(19, (SELECT id FROM "Players" WHERE "name"='Jonasran')),
(19, (SELECT id FROM "Players" WHERE "name"='Ràys')),
(19, (SELECT id FROM "Players" WHERE "name"='Yx')),
(19, (SELECT id FROM "Players" WHERE "name"='Øupla')),
(19, (SELECT id FROM "Players" WHERE "name"='Hyknoz')),
(19, (SELECT id FROM "Players" WHERE "name"='Kgr')),
(19, (SELECT id FROM "Players" WHERE "name"='Psykøhazard')),
(19, (SELECT id FROM "Players" WHERE "name"='Rassis')),
(19, (SELECT id FROM "Players" WHERE "name"='Tàel')),
(19, (SELECT id FROM "Players" WHERE "name"='Weezy')),
(19, (SELECT id FROM "Players" WHERE "name"='Angelus')),
(19, (SELECT id FROM "Players" WHERE "name"='Bobbyz')),
(19, (SELECT id FROM "Players" WHERE "name"='Krigen')),
(19, (SELECT id FROM "Players" WHERE "name"='Kusogakî')),
(19, (SELECT id FROM "Players" WHERE "name"='Paffë')),
(19, (SELECT id FROM "Players" WHERE "name"='Tephrite')),
(19, (SELECT id FROM "Players" WHERE "name"='Karaelys')),
(19, (SELECT id FROM "Players" WHERE "name"='Munuxi')),
(19, (SELECT id FROM "Players" WHERE "name"='Skau')),
(19, (SELECT id FROM "Players" WHERE "name"='Skwäsh')),
(19, (SELECT id FROM "Players" WHERE "name"='Mergueztguez'))
;


-- MC sauvetage Raid 2 : 27/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(20, (SELECT id FROM "Players" WHERE "name"='Krijgs')),
(20, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(20, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(20, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Powpit')),
(20, (SELECT id FROM "Players" WHERE "name"='Volzam')),
(20, (SELECT id FROM "Players" WHERE "name"='Zebaww')),
(20, (SELECT id FROM "Players" WHERE "name"='Adblock')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Anahita')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Dumbledog')),
(20, (SELECT id FROM "Players" WHERE "name"='Romek')),
(20, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Malstep')),
(20, (SELECT id FROM "Players" WHERE "name"='Gkz')),
(20, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Lihàtarekt')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Qaen')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Shåðøw')),
(20, (SELECT id FROM "Players" WHERE "name"='Sopalin')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Yuzumi')),
(20, (SELECT id FROM "Players" WHERE "name"='Néstor')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Osdryon')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Rendalfllag')),
(20, (SELECT id FROM "Players" WHERE "name"='Suprême')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Waira')),
(20, (SELECT id FROM "Players" WHERE "name"='Brosko')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Skedone')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Warning')),
(20, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(20, (SELECT id FROM "Players" WHERE "name"='Knh')),
(20, (SELECT id FROM "Players" WHERE "name"='Xihfu')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Bayne')),
(20, (SELECT id FROM "Players" WHERE "name"='Deiv')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Doky')),
(20, (SELECT id FROM "Players" WHERE "name"='Need')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Splendo')),
(20, (SELECT id FROM "Players" WHERE "name"='Trackass')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Daggot')),
-- (20, (SELECT id FROM "Players" WHERE "name"='Gengrous')),
(20, (SELECT id FROM "Players" WHERE "name"='Tad'))
;



-- Onyxia Raid 1 : 28/10
INSERT INTO "RaidPlayers" ("raidId", "playerId")
VALUES
(21, (SELECT id FROM "Players" WHERE "name"='Lykwette')),
(21, (SELECT id FROM "Players" WHERE "name"='Devilhunter')),
(21, (SELECT id FROM "Players" WHERE "name"='Qweakzor')),
(21, (SELECT id FROM "Players" WHERE "name"='Adblock')),
(21, (SELECT id FROM "Players" WHERE "name"='Romek')),
(21, (SELECT id FROM "Players" WHERE "name"='Thorsen')),
(21, (SELECT id FROM "Players" WHERE "name"='Callumlolz')),
(21, (SELECT id FROM "Players" WHERE "name"='Gkz')),
(21, (SELECT id FROM "Players" WHERE "name"='Kaarr')),
(21, (SELECT id FROM "Players" WHERE "name"='Rupt')),
(21, (SELECT id FROM "Players" WHERE "name"='Squeeze')),
(21, (SELECT id FROM "Players" WHERE "name"='Suprême')),
(21, (SELECT id FROM "Players" WHERE "name"='Ané')),
(21, (SELECT id FROM "Players" WHERE "name"='Felrik')),
(21, (SELECT id FROM "Players" WHERE "name"='Ragegoriath')),
(21, (SELECT id FROM "Players" WHERE "name"='Capoul')),
(21, (SELECT id FROM "Players" WHERE "name"='Deiv')),
(21, (SELECT id FROM "Players" WHERE "name"='Easìer')),
(21, (SELECT id FROM "Players" WHERE "name"='Need')),
(21, (SELECT id FROM "Players" WHERE "name"='Trackass')),
(21, (SELECT id FROM "Players" WHERE "name"='Lums')),
(21, (SELECT id FROM "Players" WHERE "name"='Tad')),
(21, (SELECT id FROM "Players" WHERE "name"='Thünberg'))
;
