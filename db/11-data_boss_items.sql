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
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage')),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin'));
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide')),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"=''));

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
-- ('Ceinture en cuir de dragon tendu',19396,(SELECT id FROM "Classes" WHERE "name"='')),
('Toucher du dragon',19367,(SELECT id FROM "Classes" WHERE "name"=''), 3),
('Prophète de malheur',19357,(SELECT id FROM "Classes" WHERE "name"=''), 2);
-- ('Garde-mains de transcendance',16920,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
-- ('Gantelets du jugement',16956,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
-- ('Gants Rougecroc',16907,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
-- ('Gantelets de courroux',16964,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
-- ('Gants de Vent du néant',16913,(SELECT id FROM "Classes" WHERE "name"='Mage')),
-- ('Garde-mains de Stormrage',16899,(SELECT id FROM "Classes" WHERE "name"='Druide')),
-- ('Gemme de récupération',19395,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bague de Blackrock',19397,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de traqueur de dragon',16940,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
-- ('Gants de Némésis',16928,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
-- ('Espauliers griffe-de-drake',19394,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bâton focalisateur de l‘Aile de l‘ombre',19355,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Fendoir griffe-de-drake',19353,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets des dix tempêtes',16948,(SELECT id FROM "Classes" WHERE "name"='Chaman'));

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