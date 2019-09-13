 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Raids" ("donjonId", "date")
VALUES
(1, '2019-10-10'),
(2, '2019-09-09'),
(2, '2019-11-11');

INSERT INTO "RaidPlayers" ("playerId", "raidId")
VALUES
(1, 1),
(1, 2);
