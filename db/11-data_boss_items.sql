 -- SAFE BEGIN FOR CONCAT


-- ===========================
-- ======== MC ===============
-- ===========================

-- SELECT 1 AS "Trash";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinture de traqueur de géant',16851,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Brassards de traqueur de géant',16850,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Protège-bras de prophétie',16819,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Ceinturon de prophétie',16817,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Brassards Rageterre',16840,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Ceinture Rageterre',16838,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Brassards cénariens',16830,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Ceinture cénarienne',16828,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Ceinture de puissance',16864,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Brassards de puissance',16861,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Ceinture d‘arcaniste',16802,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Manchettes d‘arcaniste',16799,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Brassards de Gangrecoeur',16804,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Ceinture de Gangrecoeur',16806,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Brassards judiciaires',16857,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Ceinture judiciaire',16858,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Bracelets du tueur de la nuit',16825,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Ceinture du tueur de la nuit',16827,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2);


INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16851)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16850)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16819)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16817)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16840)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16838)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16830)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16828)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16864)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16861)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16802)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16799)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16804)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16806)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16857)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16858)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16825)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=1),(SELECT id FROM "Items" WHERE "wowheadId"=16827));

-- SELECT 1 AS "Lucifron";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gantelets de puissance',16863,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Gants de Gangrecoeur',16805,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Bottes cénariennes',16829,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Collier d‘illumination',17109,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Bottes d‘arcaniste',16800,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Bottes judiciaires',16859,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Bottes Rageterre',16837,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16863)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16805)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16829)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=17109)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16800)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16859)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16837)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18861));

-- SELECT 1 AS "Magmadar";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Trembleterre',17073,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières cénariennes',16835,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Pantalon de Gangrecoeur',16810,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Pantalon de prophétie',16814,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Marque du Frappeur',17069,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières d‘arcaniste',16796,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Jambières de puissance',16867,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Médaillon de Puissance inébranlable',17065,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Pantalon du tueur de la nuit',16822,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Jambières de traqueur de géant',16847,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Griffe droite d‘Eskhandar',18203,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières judiciaires',16855,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières Rageterre',16843,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Solerets du Marcheflammes',19144,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17073)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16835)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16810)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16814)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17069)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16796)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16867)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17065)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16847)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18203)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16855)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16843)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18829)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19144));

-- SELECT 1 AS "Gehennas";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants de prophétie',16812,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Bottes de traqueur de géant',16849,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Gants du tueur de la nuit',16826,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Sandales de puissance',16862,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Gantelets judiciaires',16860,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Gantelets Rageterre',16839,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2),
('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''), 3);
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16812)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16849)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16826)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16862)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16860)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16839)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Garr";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Marteau d‘Aurastone',17105,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Casque cénarien',16834,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Casque de traqueur de géant',16846,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Déchireur de Gutgore',17071,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Disque Drillborer',17066,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Lame de brutalité',18832,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Casque de puissance',16866,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Collerette de prophétie',16813,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Cornes de Gangrecoeur',16808,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Couronne d‘arcaniste',16795,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Couvre-chef du tueur de la nuit',16821,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Heaume judiciaire',16854,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Casque Rageterre',16842,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17105)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16834)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16846)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17071)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17066)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18832)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16866)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16813)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16808)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16795)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16854)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16842)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18829));

-- SELECT 1 AS "Shazzrah";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants cénariens',16831,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Gants d‘arcaniste',16801,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Gants de traqueur de géant',16852,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Bottes de prophétie',16811,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Bottes du tueur de la nuit',16824,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Mules de Gangrecoeur',16803,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2);
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16831)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16801)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16852)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16811)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16824)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16803)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Baron Geddon";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Mantelet d‘arcaniste',16797,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Spallières cénariennes',16836,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Protège-épaules de Gangrecoeur',16807,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Sceau de l‘archimagus',17110,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Spallières judiciaires',16856,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Epaulettes Rageterre',16844,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16797)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16836)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16807)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=17110)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16856)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16844)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19143));

-- SELECT 1 AS "Sulfuron Harbinger";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Frappe-ténèbres',17074,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Epaulettes de traqueur de géant',16848,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Espauliers de puissance',16868,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Mantelet de prophétie',16816,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Protège-épaules du tueur de la nuit',16823,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2);
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17074)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16848)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16868)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16816)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16823)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18878));

-- SELECT 1 AS "Golemagg the Incinerator";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Bâton de domination',18842,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Magelame de Chante-azur',17103,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Robe d‘arcaniste',16798,(SELECT id FROM "Classes" WHERE "name"='Mage'), 2),
('Cuirasse de traqueur de géant',16845,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 2),
('Plastron du tueur de la nuit',16820,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Robe de Gangrecoeur',16809,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 2),
('Robe de prophétie',16815,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 2),
('Cuirasse de puissance',16865,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 2),
('Lance-grenaille explosif',17072,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Lingot de sulfuron',17203,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Corselet judiciaire',16853,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 2),
('Habit cénarien',16833,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Habit Rageterre',16841,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 2);
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"=''), 2),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''), 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18842)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17103)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16798)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16845)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16820)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16809)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16815)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16865)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17072)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17203)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16853)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16833)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16841)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18820));

-- SELECT 1 AS "Majordomo Executus";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau de cautérisation',19140,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Drague-lave de Finkle',18803,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Epaulières de garde du feu',19139,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Gants de la flamme hypnotique',18808,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Grèves du Coeur du Magma',18806,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=19140)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18811)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18805)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18803)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18809)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=19139)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18703)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18808)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18812)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18806)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18646)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18810));

-- SELECT 1 AS "Ragnaros";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Jambières de Stormrage',16901,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Pantalon de Vent du néant',16915,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Lame de la perdition',18816,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau de Sulfuras',19138,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières de traqueur de dragon',16938,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Couronne de destruction',18817,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Pantalon Rougecroc',16909,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Anneau de Précisia',17063,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape sang-de-dragon',17107,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Essence de la Flamme pure',18815,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières de Némésis',16930,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Jambières de transcendance',16922,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Jambières de courroux',16962,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Cape du Voile de brume',17102,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Ceinturon d‘assaut',19137,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Collier du Seigneur du Feu',18814,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières du jugement',16954,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Arrache-moelle',17104,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Fragment de la Flamme',17082,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Fléau de Bonereaver',17076,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières des dix tempêtes',16946,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
-- manually added
('Défenseur de Malistar',17106,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Oeil de Sulfuras',17204,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16901)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16915)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18816)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19138)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16938)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18817)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16909)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17063)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17107)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18815)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16930)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16922)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16962)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17102)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19137)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18814)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16954)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17104)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17082)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17076)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16946)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17106));

-- SELECT 1 AS "Onyxia";
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Tête d‘Onyxia',18422,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Tendon de dragon noir adulte',18705,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 1),
('Ancien Grimoire de Cornerstone',17067,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Anneau de lien',18813,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Couvre-chef de Stormrage',16900,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Crâne de Némésis',16929,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Casque de traqueur de dragon',16939,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Couronne de Vent du néant',16914,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Drapé de Saphiron',17078,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Auréole de transcendance',16921,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Cagoule Rougecroc',16908,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Heaume de courroux',16963,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Collier d‘Eskhandar',18205,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Couronne du jugement',16955,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Casque des dix tempêtes',16947,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Eclat de l‘Ecaille',17064,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Porte-mort',17068,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Sac à dos en cuir d‘Onyxia',17966,(SELECT id FROM "Classes" WHERE "name"=''), 1),
-- ('Tête d‘Onyxia',18423,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Vis‘kag le Saigneur',17075,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18422)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18705)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17067)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18813)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16900)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16929)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16939)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16914)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17078)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16921)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16908)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16963)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18205)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16955)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16947)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17064)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17068)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18423)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17075)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17966));


-- added after crawl
INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Casque du donneur de vie',18870,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Liens du Cherchevent',18564,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Liens du Cherchevent',18563,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18870)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18564)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18563)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17204)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18875));


-- ===========================
-- ======== BWL ==============
-- ===========================


-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Maillet draconique',19358,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Cape de puissance draconique',19436,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Bottes de la pensée pure',19437,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Vengeresse draconique',19354,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Bottes de blizzard de Ringo',19438,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Pourpoint d‘ombre entrelacé',19439,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Trancheuse du destin',19362,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Récolteur d‘essence',19435,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Anneau de sombre domination',19434,(SELECT id FROM "Classes" WHERE "name"=''), 4);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19358)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19436)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19437)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19354)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19438)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19439)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19362)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19435)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=3),(SELECT id FROM "Items" WHERE "wowheadId"=19434));



-- SELECT 1 AS "Razorgore";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Manchettes de transcendance',16926,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Brassards de traqueur de dragon',16935,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Brassards Rougecroc',16911,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Bracelets de courroux',16959,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Gants de l‘évolution rapide',19369,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Gemme imprégnée d‘arcanes',19336,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 1),
('Le Livre noir',19337,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Manchettes de Vent du néant',16918,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Mantelet de la cabale de l‘Aile noire',19370,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Brassards de Némésis',16934,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Brassards de Stormrage',16904,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Manchettes du jugement',16951,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Brise-échine',19335,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Brassards des dix tempêtes',16943,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('La lame indomptée',19334,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16926)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16935)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16911)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16959)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19369)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19336)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19337)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16918)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19370)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16934)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16904)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16951)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19335)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=16943)),
((SELECT id FROM "Bosses" WHERE "name"='Razorgore'),(SELECT id FROM "Items" WHERE "wowheadId"=19334));


-- SELECT 1 AS "Vaelastrasz";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Baudrier de courroux',16960,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Ceinture de Stormrage',16903,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Ceinture Rougecroc',16910,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Ceinture de Némésis',16933,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Ceinture de Vent du néant',16818,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Pendentif du dragon déchu',19371,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gemme de vivacité d‘esprit',19339,(SELECT id FROM "Classes" WHERE "name"='Mage'), 4),
('Ceinture de transcendance',16925,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Ceinture de traqueur de dragon',16936,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Heaume de la rage infinie',19372,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Rune de transformation',19340,(SELECT id FROM "Classes" WHERE "name"='Druide'), 2),
('Lame croc-de-dragon',19346,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Ceinture du jugement',16952,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Ceinture des dix tempêtes',16944,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Protecteur en écailles de dragon rouge',19348,(SELECT id FROM "Classes" WHERE "name"=''), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16960)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16903)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16910)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16933)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16818)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19371)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19339)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16925)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16936)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19372)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19340)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19346)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16952)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=16944)),
((SELECT id FROM "Bosses" WHERE "name"='Vaelastrasz'),(SELECT id FROM "Items" WHERE "wowheadId"=19348));


-- SELECT 1 AS "Broodlord Lashlayer";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Bottes de Vent du néant',16912,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Espauliers de rejeton noir',19373,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Sandales de courroux',16965,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Bottes de Némésis',16927,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Bottes de transcendance',16919,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Bottes de traqueur de dragon',16941,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Totem venimeux',19342,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 2),
('Bottes Rougecroc',16906,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Gemme donneuse de vie',19341,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 4),
('Sandales du jugement',16957,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Bottes de Stormrage',16898,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Brassards de précision des arcanes',19374,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Frappe-coeur',19350,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Maladath, lame runique du Vol noir',19351,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bottes des dix tempêtes',16949,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16912)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19373)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16965)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16927)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16919)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16941)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19342)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16906)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19341)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16957)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16898)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19374)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19350)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=19351)),
((SELECT id FROM "Bosses" WHERE "name"='Broodlord Lashlayer'),(SELECT id FROM "Items" WHERE "wowheadId"=16949));


-- SELECT 1 AS "Firemaw";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Robe de cendre noire',19399,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Etreinte Gueule-de-feu',19400,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Griffe du drake noir',19365,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Cape gueule-de-feu',19398,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Parchemin de lumière aveuglante',19343,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Cuissards du croisé déchu',19402,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Cristal d‘alignement sur la nature',19344,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3),
('Cuissards rivetés de Primaliste',19401,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gantelets des dix tempêtes',16948,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19399)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19400)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19365)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19398)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19343)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19402)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19344)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19401)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Firemaw'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));

-- SELECT 1 AS "Ebonroc";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Egide de préservation',19345,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Anneau de Concentration forcée',19403,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Gants de la flamme d‘ébène',19407,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Talisman croc-de-drake',19406,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Rempart béni de Malfurion',19405,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Canon à main Souffle-de-dragon',19368,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 0),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 0),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 0),
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 0),
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 0),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0);
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 0),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 0),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19345)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19403)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19407)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19406)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19405)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19368)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Ebonroc'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));


-- SELECT 1 AS "Flamegor";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Voile de la pensée pure',19430,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cercle de la force appliquée',19432,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Jambières en tisse-braise',19433,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Scarabée d‘obstruction de Styleen',19431,(SELECT id FROM "Classes" WHERE "name"=''), 4),
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Toucher du dragon',19367,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Prophète de malheur',19357,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 0),
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 0),
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 0),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage'), 0),
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide'), 0),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 0),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 0),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Gantelets des dix tempêtes',16948,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19430)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19432)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19433)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19431)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19396)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19367)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19357)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16920)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16956)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16907)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16964)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16913)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16899)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19395)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19397)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16940)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16928)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19394)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19355)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=19353)),
((SELECT id FROM "Bosses" WHERE "name"='Flamegor'),(SELECT id FROM "Items" WHERE "wowheadId"=16948));


-- SELECT 1 AS "Chromaggus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Mantelet de Vent du néant',16917,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Protège-épaules en cuir de dragon tendu',19389,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Spallières de traqueur de dragon',16937,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Torsade d‘Angelista',19388,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Espauliers de courroux',16961,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Bottes chromatiques',19387,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Espauliers de Stormrage',16902,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Espauliers de transcendance',16924,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Gants en cuir de dragon tendu',19390,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Spallières de Némésis',16932,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Spallières Rougecroc',16832,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Geta chatoyantes',19391,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cape brochée d‘élémentium',19386,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Ceinturon du croisé déchu',19392,(SELECT id FROM "Classes" WHERE "name"=''), 1),
('Jambières surpuissantes',19385,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Spallières du jugement',16953,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Epée trempée chromatiquement',19352,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Griffe de Chromaggus',19347,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Sangle rivetée de Primaliste',19393,(SELECT id FROM "Classes" WHERE "name"=''), 2),
('Ashjre‘thul, arbalète de châtiment',19361,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bouclier en élémentium renforcé',19349,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Epaulettes des dix tempêtes',16945,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16917)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19389)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16937)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19388)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16961)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19387)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16902)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16924)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19390)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16932)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16832)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19391)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19386)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19392)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19385)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16953)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19352)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19347)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19393)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19361)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=19349)),
((SELECT id FROM "Bosses" WHERE "name"='Chromaggus'),(SELECT id FROM "Items" WHERE "wowheadId"=16945));


-- SELECT 1 AS "Nefarian";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Tête de Nefarian',19002,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cape du seigneur des couvées',19378,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bottes de la Flamme d‘ombre',19381,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Chaîne de Therazane',19380,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuirasse de traqueur de dragon',16942,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 3),
('Robe de Vent du néant',16916,(SELECT id FROM "Classes" WHERE "name"='Mage'), 3),
('Bague de rétorsion d‘Archimtiros',19376,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Cuirasse de courroux',16966,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank'), 3),
('Plastron Rougecroc',16905,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 3),
('Robe de Némésis',16931,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 3),
('Robe de transcendance',16923,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 3),
('Anneau d‘élémentium pur',19382,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Larme de Neltharion',19379,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Robe de Stormrage',16897,(SELECT id FROM "Classes" WHERE "name"='Druide'), 3),
('Mish‘undare, coiffure du flagelleur mental',19375,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Talisman de perfidie de Prestor',19377,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Bâton de la Flamme d‘ombre',19356,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cuirasse du jugement',16958,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 3),
('Ashkandi, Grande épée de la Confrérie',19364,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Crul‘shorukh, Trancheuse du chaos',19363,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Lok‘amir il Romathis',19360,(SELECT id FROM "Classes" WHERE "name"=''), 4),
('Cuirasse des dix tempêtes',16950,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 3);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19002)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19378)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19381)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19380)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16942)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16916)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19376)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16966)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16905)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16931)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16923)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19382)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19379)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16897)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19375)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19377)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19356)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16958)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19364)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19363)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=19360)),
((SELECT id FROM "Bosses" WHERE "name"='Nefarian'),(SELECT id FROM "Items" WHERE "wowheadId"=16950));

-- SELECT 1 AS "=======================";

-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau du chaos de Rytssin',21836,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Atours d‘ascension royale',21838,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants de l‘immortel',21888,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Marteau de guerre d‘anubisath',21837,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Neretzek, le Buveur de sang',21856,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Fragment de l‘étoile tombée',21891,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants de la prophétie rachetée',21889,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Gants du prophète déchu',21890,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0),
('Plans : Lame feuille-de-saule',22389,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21836)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21838)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21888)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21837)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21856)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21891)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21889)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=21890)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=4),(SELECT id FROM "Items" WHERE "wowheadId"=22389));



-- SELECT 1 AS "The Prophet Skeram";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel"))
VALUES
('Bottes de la volonté inexorable',21706,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Garde-poignets en écailles de hanneton',21708,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Jambières d‘immersion',21698,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape de concentré de haine',21701,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Epaulières du barrage',21699,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Plastron d‘annihilation',21814,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de pensée foisonnante',21707,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Pendentif du gardien qiraji',21700,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Amulette de vile sauvegarde',21702,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes de la prophétie rédemptrice',21704,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bâton des prophètes qiraji',21128,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Marteau de Ji‘zhi',21703,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes du prophète déchu',21705,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21706)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21708)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21698)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21701)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21699)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21814)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21707)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21700)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21702)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21704)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21128)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21703)),
((SELECT id FROM "Bosses" WHERE "name"='The Prophet Skeram'),(SELECT id FROM "Items" WHERE "wowheadId"=21705));

-- SELECT 1 AS "Battleguard Sartura";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinture qiraji en peau épaisse',21675,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Robe du garde de guerre',21671,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes recomposées',21648,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Collier de pureté',21678,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants de coercition',21672,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Casque des lianes rampantes',21669,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets de détermination inébranlable',21674,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jambières de l‘essaim purulent',21676,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Insigne de garde-essaim',21670,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Pouvoir de Sartura',21666,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cuissards de lumière flamboyante',21667,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Griffe de silithide',21673,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jambières de fureur qiraji en écailles',21668,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21675)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21671)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21648)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21678)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21672)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21669)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21674)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21676)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21670)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21666)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21667)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21673)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21668)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Battleguard Sartura'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "Fankriss the Unyielding";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Robe du saint gardien',21663,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Corselet en carapace de silithide',21652,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes de tunnelière de la ruche',21645,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape des secrets inexprimables',21627,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Collier barbelé',21664,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Espauliers de l‘Implacable',21639,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Fétiche du ravageur des sables',21647,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de vengeance cruelle',21665,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jambières de ravageur des sables en écailles',21651,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Guisarme du ravageur des sables',21635,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Libram de grâce',22402,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ancien éventreur qiraji',21650,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Totem de vie',22396,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21663)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21652)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21645)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21627)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21664)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21639)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21647)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21665)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21651)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21635)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=22402)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21650)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=22396)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Fankriss the Unyielding'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "Princess Huhuran";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Manchettes de domination qiraji',20932,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Manchettes de commandement qiraji',20928,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau du martyr',21620,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets en peau de guêpe',21617,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Garde-poignets de profanateur de ruche',21618,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape de la Ruche d‘or',21621,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants du messie',21619,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Aiguillon d‘Huhuran',21616,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=20932)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=20928)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21620)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21617)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21618)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21621)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21619)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21616)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Princess Huhuran'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "Silithid Royalty";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gilet d‘exécution rapide',21680,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau du dévoré',21681,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Scarabée pétrifié',21685,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Baguette de noblesse qiraji',21603,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de la puissance phrénique',21686,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de ténèbres d‘Ukko',21687,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets couverts de bile',21682,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de la croisade du désert',21683,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet de la fureur du désert',21684,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes du héros déchu',21688,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Charme d‘Angelista',21690,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants d‘Ebru',21689,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets éclaboussés de vase',21691,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Robe du triumvirat',21696,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Ceinture de la triade',21692,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Semblance du dévoreur',21693,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Cape de la trinité',21697,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Toucher d‘Angelista',21695,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Mantelet ternaire',21694,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21680)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21681)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21685)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21603)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21686)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21687)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21682)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21683)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21684)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21688)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21690)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21689)),
((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21691));
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21696)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21692)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21693)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21697)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21695)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21694)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
-- ((SELECT id FROM "Bosses" WHERE "name"='Silithid Royalty'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));


-- SELECT 1 AS "Viscidus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Manchettes de commandement qiraji',20928,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Manchettes de domination qiraji',20932,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets de Kalimdor',21624,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de fureur qiraji',21677,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Idole de santé',22399,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Fémur de silithide aiguisé',21622,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jambières couvertes de vase',21626,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Broche scarabée',21625,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=20928)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=20932)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21624)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21677)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=22399)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21622)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21626)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21625)),
((SELECT id FROM "Bosses" WHERE "name"='Viscidus'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "The Twin Emperors";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Diadème de Vek‘lor',20930,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes de l‘épiphanie',21600,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants de dévastation de Vek‘lor',21599,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinture royale qiraji',21598,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Brassards d‘exécution quiraji',21602,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Sceptre royal de Vek‘lor',21597,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de l‘empereur Vek‘lor',21601,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Diadème de Vek‘nilash',20926,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gants du temple caché',21605,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinture régénérante de Vek‘nilash',21609,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Amulette de Vek‘nilash',21608,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bracelets de rédemption royale',21604,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinture de l‘empereur déchu',21606,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Vengeance de Kalimdor',21679,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Torsade de l‘empereur déchu',21607,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=20930)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21600)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21599)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21598)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21602)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21597)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21601)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=20926)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21605)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21609)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21608)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21604)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21606)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21679)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21607)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21232)),
((SELECT id FROM "Bosses" WHERE "name"='The Twin Emperors'),(SELECT id FROM "Items" WHERE "wowheadId"=21237));

-- SELECT 1 AS "Ouro";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Peau du Grand ver des sables',20931,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Peau intacte d‘Ouro',20927,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Larve du Grand ver',23557,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Chapeau égaré de Don Rigoberto',21615,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('La Carapace du fouisseur',23558,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Brassards de fouisseur',21611,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bouclier en écailles de ver',21610,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Jom Gabbar',23570,(SELECT id FROM "Classes" WHERE "name"=''), 0);
-- ('Tenue de parade impériale qiraji',21237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Armes impériales qiraji',21232,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=20931)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=20927)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23557)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21615)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23558)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21611)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21610)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=23570)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21237)),
((SELECT id FROM "Bosses" WHERE "name"='Ouro'),(SELECT id FROM "Items" WHERE "wowheadId"=21232));

-- SELECT 1 AS "C‘thun";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Oeil de C‘Thun',21221,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Carcasse du Dieu très ancien',20933,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Carapace du Dieu très ancien',20929,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Corde de pédoncule cintrée',22730,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape de clarté',21583,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau du tueur de dieu',21596,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets d‘annihilation',21581,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gantelets du sombre orage',21585,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Marque de C‘Thun',22732,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape du Dévoré',22731,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Tentacule de C‘Thun vaincu',21579,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Torsade du Dieu très ancien',21582,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinture d‘agonie sans fin',21586,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Sceptre du faux prophète',21839,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Sombre doloire de la démence',21134,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Aiguillon de la mort',21126,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21221)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=20933)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=20929)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22730)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21583)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21596)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21581)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21585)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22732)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=22731)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21579)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21582)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21586)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21839)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21134)),
((SELECT id FROM "Bosses" WHERE "name"='C‘thun'),(SELECT id FROM "Items" WHERE "wowheadId"=21126));


-- ======================= NAXX =======================

-- SELECT 1 AS "Trashs";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Anneau de la flamme éternelle',23237,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Atours de nécrochevalier',23069,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Ceinture du Grand croisé',23666,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Ceinturon de furie élémentaire',23663,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Espauliers de furie élémentaire',23664,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0),
('Jambières de furie élémentaire',23665,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0),
('Jambières du Grand croisé',23668,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Présage funeste',23044,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Servobras égaré',23221,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Spallières du Grand croisé',23667,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Targe stygienne',23238,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Tunique en peau de goule',23226,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23237)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23069)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23666)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23663)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23664)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23665)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23668)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23044)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23221)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23667)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23238)),
((SELECT id FROM "Bosses" WHERE "name"='Trashs' AND "donjonId"=5),(SELECT id FROM "Items" WHERE "wowheadId"=23226));


-- SELECT 1 AS "Anub‘Rekhan";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Bague des prières inexaucées',22939,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Larme de givre',22935,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Gemme de Nérubis',22937,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape en soie de démon des cryptes',22938,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Garde-poignets de vengeance',22936,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22939)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22935)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22937)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22938)),
((SELECT id FROM "Bosses" WHERE "name"='Anub‘Rekhan'),(SELECT id FROM "Items" WHERE "wowheadId"=22936));


-- SELECT 1 AS "Grande veuve Faerlina";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
-- ('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('L‘Etreinte de la veuve',22942,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Protège-épaules polaires',22941,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Remords de la veuve',22806,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Espauliers plaie-de-glace',22940,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Pendentif de la pierre pernicieuse',22943,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22942)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22941)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22806)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22940)),
((SELECT id FROM "Bosses" WHERE "name"='Grande veuve Faerlina'),(SELECT id FROM "Items" WHERE "wowheadId"=22943));


-- SELECT 1 AS "Maexxna";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Gants désacralisés',22371,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Garde-mains désacralisés',22364,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Gantelets désacralisés',22357,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Baiser de l‘araignée',22954,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Lame en peine',22807,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Pendentif des noms oubliés',22947,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Croc de Maexxna',22804,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Robe de toile cristalline',23220,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22371)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22364)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22357)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22954)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22807)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22947)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=22804)),
((SELECT id FROM "Bosses" WHERE "name"='Maexxna'),(SELECT id FROM "Items" WHERE "wowheadId"=23220));


-- SELECT 1 AS "Noth le Porte-peste";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Cape du Fléau',23030,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Coeur frigide de Noth',23029,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bague de l‘inévitable',23031,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bague du grêlon',23028,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Hachette de l‘os brisé',22816,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Libram de lumière',23006,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Totem de l‘eau courante',23005,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22356)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23030)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23029)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23031)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23028)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=22816)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23006)),
((SELECT id FROM "Bosses" WHERE "name"='Noth le Porte-peste'),(SELECT id FROM "Items" WHERE "wowheadId"=23005));


-- SELECT 1 AS "Heigan l‘Impur";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
-- ('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Cuissots de carnage',23068,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Camail glacécaille',23033,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Chapeau de précepteur',23035,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Heaume plaie-de-glace',23019,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Collier de nécropsie',23036,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23068)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23033)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=22356)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23035)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23019)),
((SELECT id FROM "Bosses" WHERE "name"='Heigan l‘Impur'),(SELECT id FROM "Items" WHERE "wowheadId"=23036));


-- SELECT 1 AS "Horreb";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Cuissards désacralisés',22359,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Cuissots désacralisés',22352,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Jambières désacralisées',22366,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Bague des forces contre-nature',23038,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('L‘oeil de Nérub',23039,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de ferveur spirituelle',23037,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bâton de soufre',22800,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Reflet d‘Horreb',23042,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22359)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22352)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22366)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23038)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23039)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23037)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=22800)),
((SELECT id FROM "Bosses" WHERE "name"='Horreb'),(SELECT id FROM "Items" WHERE "wowheadId"=23042));


-- SELECT 1 AS "Le Recousu";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Cape de suture',22960,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bague de réanimation',22961,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Baguette des Parques',22820,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cisailleuse',22815,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Le Porte-peste',22818,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22960)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22961)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22820)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22815)),
((SELECT id FROM "Bosses" WHERE "name"='Le Recousu'),(SELECT id FROM "Items" WHERE "wowheadId"=22818));


-- SELECT 1 AS "Grobbulus";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
-- ('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
-- ('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Spallières glacécaille',22967,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Injecteur de toxines',22810,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('La fin des rêves',22988,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Rosée du crépuscule',22803,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Mantelet glacial',22968,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22967)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22810)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22988)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22803)),
((SELECT id FROM "Bosses" WHERE "name"='Grobbulus'),(SELECT id FROM "Items" WHERE "wowheadId"=22968));


-- SELECT 1 AS "Gluth";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Claymore de puissance impie',22813,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Collier perdu de Gluth',22981,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Main de pouvoir digérée',22994,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Espauliers désacralisés',22354,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Pacte de la mort',23075,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Mantelet couvert de gel',22983,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Ceinturon désacralisé',22363,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
-- ('Manchettes désacralisées',22369,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Brassards désacralisées',22355,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
-- ('Spallières désacralisées',22361,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Protège-épaules désacralisés',22368,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0);
-- ('Ceinture désacralisée',22370,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Protège-poignets désacralisés',22362,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
-- ('Sangle désacralisée',22356,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22813)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22981)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22994)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22354)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=23075)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22983)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22363)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22369)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22355)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22361)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22368)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22370)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22362)),
((SELECT id FROM "Bosses" WHERE "name"='Gluth'),(SELECT id FROM "Items" WHERE "wowheadId"=22356));


-- SELECT 1 AS "Thaddius";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Heaume désacralisé',22353,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Couvre-chef désacralisé',22360,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Diadème désacralisé',22367,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Jambières de polarité',23070,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Pic du crépuscule',22801,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Oeil de diminution',23001,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Fustigatrice',22808,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Thorax d‘abomination blindé',23000,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22353)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22360)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22367)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23070)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22801)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23001)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=22808)),
((SELECT id FROM "Bosses" WHERE "name"='Thaddius'),(SELECT id FROM "Items" WHERE "wowheadId"=23000));


-- SELECT 1 AS "Instructeur Razuvious";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
-- ('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Baguette de la mort murmurante',23009,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Chevalière du défenseur déchu',23018,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Idole de longévité',23004,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Ceinturon du mentor',23219,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Voile de l‘éclipse',23017,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Iblis, lame du Séraphin déchu',23014,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23009)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23018)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23004)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23219)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23017)),
((SELECT id FROM "Bosses" WHERE "name"='Instructeur Razuvious'),(SELECT id FROM "Items" WHERE "wowheadId"=23014));


-- SELECT 1 AS "Gothik le Moissonneur";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
-- ('Sandales désacralisées',22372,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
-- ('Bottes désacralisées',22365,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0),
('Coiffure glaciale',23032,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Manchettes du moissonneur d‘âmes',23021,(SELECT id FROM "Classes" WHERE "name"=''), 0),
-- ('Solerets désacralisés',22358,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Torque de sadique',23023,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Bottes de déplacement',23073,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Casque polaire',23020,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22372)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22365)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23032)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23021)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=22358)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23023)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23073)),
((SELECT id FROM "Bosses" WHERE "name"='Gothik le Moissonneur'),(SELECT id FROM "Items" WHERE "wowheadId"=23020));


-- SELECT 1 AS "Les quatre cavaliers";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Cordâme',22811,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cordialité du pardon',23027,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cuirasse désacralisée',22349,(SELECT id FROM "Classes" WHERE "name"='Guerrier, Voleur'), 0),
('Jambières de l‘Apocalypse',23071,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Maillet du croisé racheté',22809,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Porte-cendres corrompue',22691,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Robe désacralisée',22351,(SELECT id FROM "Classes" WHERE "name"='Démoniste, Mage, Prêtre'), 0),
('Sceau des damnés',23025,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Tunique désacralisée',22350,(SELECT id FROM "Classes" WHERE "name"='Chaman, Chasseur, Druide, Paladin'), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22811)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23027)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22349)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23071)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22809)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22691)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22351)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=23025)),
((SELECT id FROM "Bosses" WHERE "name"='Les quatre cavaliers'),(SELECT id FROM "Items" WHERE "wowheadId"=22350));


-- SELECT 1 AS "Saphiron";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Pouvoir du Fléau',23548,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Puissance du Fléau',23545,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Oeil du mort',23047,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Voile d‘assujettissement',23045,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Griffe du wyrm de givre',23242,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Le Visage de la mort',23043,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Blason de tueur',23041,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Oeil droit de Saphiron',23048,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Glyphe de déviation',23040,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('L‘essence contenue de Saphiron',23046,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Cape de la nécropole',23050,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Oeil gauche de Saphiron',23049,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23548)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23545)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23047)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23045)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23242)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23043)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23041)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23048)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23040)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23046)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23050)),
((SELECT id FROM "Bosses" WHERE "name"='Saphiron'),(SELECT id FROM "Items" WHERE "wowheadId"=23049));


-- SELECT 1 AS "Kel‘Thuzad";

INSERT INTO "Items" ("name","wowheadId","classId","lootLevel")
VALUES
('Le phylactère de Kel‘Thuzad',22520,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de la faucheuse d‘os',23060,(SELECT id FROM "Classes" WHERE "name"='Voleur'), 0),
('Gemme des innocents enchaînés',23057,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Puissance de Menethil',22798,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de rédemption',23066,(SELECT id FROM "Classes" WHERE "name"='Paladin'), 0),
('Anneau du cuirassier',23059,(SELECT id FROM "Classes" WHERE "name"='Guerrier'), 0),
('Anneau de Brise-terre',23065,(SELECT id FROM "Classes" WHERE "name"='Chaman'), 0),
('Détrôneuse',22802,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Talisman bouillonnant de Stormrage',23053,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de givrefeu',23062,(SELECT id FROM "Classes" WHERE "name"='Mage'), 0),
('Anneau de traqueur des cryptes',23067,(SELECT id FROM "Classes" WHERE "name"='Chasseur'), 0),
('Cherche-âme',22799,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Marteau du Néant distordu',23056,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de foi',23061,(SELECT id FROM "Classes" WHERE "name"='Prêtre'), 0),
('Doigt du destin',22821,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de pestecoeur',23063,(SELECT id FROM "Classes" WHERE "name"='Démoniste'), 0),
('Gressil, Aube de la ruine',23054,(SELECT id FROM "Classes" WHERE "name"=''), 0),
('Anneau de marcherêve',23064,(SELECT id FROM "Classes" WHERE "name"='Druide'), 0),
('Bouclier de condamnation',22819,(SELECT id FROM "Classes" WHERE "name"=''), 0);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22520)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23060)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23057)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22798)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23066)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23059)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23065)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22802)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23053)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23062)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23067)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22799)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23056)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23061)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22821)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23063)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23054)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=23064)),
((SELECT id FROM "Bosses" WHERE "name"='Kel‘Thuzad'),(SELECT id FROM "Items" WHERE "wowheadId"=22819));

