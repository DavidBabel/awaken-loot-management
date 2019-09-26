 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Raids" ("donjonId", "date")
VALUES
(1, '2019-09-19'), -- 1
(1, '2019-09-22'), -- 2
(2, '2019-09-24'), -- 3
(1, '2019-09-25'); -- 4


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
-- TODO notez ceux qui ont passer leur tour
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true),
-- (4, (SELECT id FROM "Players" WHERE "name"=''), true)
;