 -- SAFE BEGIN FOR CONCAT
-- SELECT 1 AS "Trash";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Ceinture de traqueur de géant',16851,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Brassards de traqueur de géant',16850,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Protège-bras de prophétie',16819,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Ceinturon de prophétie',16817,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Brassards Rageterre',16840,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Ceinture Rageterre',16838,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Brassards cénariens',16830,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Ceinture cénarienne',16828,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Ceinture de puissance',16864,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Brassards de puissance',16861,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Ceinture d‘arcaniste',16802,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Manchettes d‘arcaniste',16799,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Brassards de Gangrecoeur',16804,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Ceinture de Gangrecoeur',16806,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Brassards judiciaires',16857,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Ceinture judiciaire',16858,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Bracelets du tueur de la nuit',16825,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Ceinture du tueur de la nuit',16827,(SELECT id FROM "Classes" WHERE "name"='Voleur'));


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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gantelets de puissance',16863,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Gants de Gangrecoeur',16805,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Bottes cénariennes',16829,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Collier d‘illumination',17109,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes d‘arcaniste',16800,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Bottes judiciaires',16859,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Bottes Rageterre',16837,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Trembleterre',17073,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières cénariennes',16835,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Gangrecoeur',16810,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Pantalon de prophétie',16814,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Marque du Frappeur',17069,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières d‘arcaniste',16796,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Jambières de puissance',16867,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Médaillon de Puissance inébranlable',17065,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon du tueur de la nuit',16822,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Jambières de traqueur de géant',16847,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Griffe droite d‘Eskhandar',18203,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières judiciaires',16855,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières Rageterre',16843,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"='')),
('Solerets du Marcheflammes',19144,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants de prophétie',16812,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes de traqueur de géant',16849,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Gants du tueur de la nuit',16826,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Sandales de puissance',16862,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Gantelets judiciaires',16860,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Gantelets Rageterre',16839,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

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
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Garr";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Marteau d‘Aurastone',17105,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque cénarien',16834,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Casque de traqueur de géant',16846,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Déchireur de Gutgore',17071,(SELECT id FROM "Classes" WHERE "name"='')),
('Disque Drillborer',17066,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame de brutalité',18832,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque de puissance',16866,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Collerette de prophétie',16813,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cornes de Gangrecoeur',16808,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Couronne d‘arcaniste',16795,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Couvre-chef du tueur de la nuit',16821,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume judiciaire',16854,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque Rageterre',16842,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants cénariens',16831,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Gants d‘arcaniste',16801,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Gants de traqueur de géant',16852,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Bottes de prophétie',16811,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes du tueur de la nuit',16824,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Mules de Gangrecoeur',16803,(SELECT id FROM "Classes" WHERE "name"='Démoniste'));
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Mantelet d‘arcaniste',16797,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Spallières cénariennes',16836,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Protège-épaules de Gangrecoeur',16807,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Sceau de l‘archimagus',17110,(SELECT id FROM "Classes" WHERE "name"='')),
('Spallières judiciaires',16856,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Epaulettes Rageterre',16844,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Frappe-ténèbres',17074,(SELECT id FROM "Classes" WHERE "name"='')),
('Epaulettes de traqueur de géant',16848,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Espauliers de puissance',16868,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Mantelet de prophétie',16816,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Protège-épaules du tueur de la nuit',16823,(SELECT id FROM "Classes" WHERE "name"='Voleur'));
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Bâton de domination',18842,(SELECT id FROM "Classes" WHERE "name"='')),
('Magelame de Chante-azur',17103,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe d‘arcaniste',16798,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Cuirasse de traqueur de géant',16845,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Plastron du tueur de la nuit',16820,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Robe de Gangrecoeur',16809,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Robe de prophétie',16815,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cuirasse de puissance',16865,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Lance-grenaille explosif',17072,(SELECT id FROM "Classes" WHERE "name"='')),
('Lingot de sulfuron',17203,(SELECT id FROM "Classes" WHERE "name"='')),
('Corselet judiciaire',16853,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Habit cénarien',16833,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Habit Rageterre',16841,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Anneau de cautérisation',19140,(SELECT id FROM "Classes" WHERE "name"='')),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"='')),
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"='')),
('Drague-lave de Finkle',18803,(SELECT id FROM "Classes" WHERE "name"='')),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"='')),
('Epaulières de garde du feu',19139,(SELECT id FROM "Classes" WHERE "name"='')),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Gants de la flamme hypnotique',18808,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"='')),
('Grèves du Coeur du Magma',18806,(SELECT id FROM "Classes" WHERE "name"='')),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''));

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
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Jambières de Stormrage',16901,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Vent du néant',16915,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Lame de la perdition',18816,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de Sulfuras',19138,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de traqueur de dragon',16938,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de destruction',18817,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon Rougecroc',16909,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Anneau de Précisia',17063,(SELECT id FROM "Classes" WHERE "name"='')),
('Cape sang-de-dragon',17107,(SELECT id FROM "Classes" WHERE "name"='')),
('Essence de la Flamme pure',18815,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Némésis',16930,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Jambières de transcendance',16922,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Jambières de courroux',16962,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Cape du Voile de brume',17102,(SELECT id FROM "Classes" WHERE "name"='')),
('Ceinturon d‘assaut',19137,(SELECT id FROM "Classes" WHERE "name"='')),
('Collier du Seigneur du Feu',18814,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières du jugement',16954,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Arrache-moelle',17104,(SELECT id FROM "Classes" WHERE "name"='')),
('Fragment de la Flamme',17082,(SELECT id FROM "Classes" WHERE "name"='')),
('Fléau de Bonereaver',17076,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières des dix tempêtes',16946,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
-- manually added
('Défenseur de Malistar',17106,(SELECT id FROM "Classes" WHERE "name"=''));

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
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16946));

-- SELECT 1 AS "Onyxia";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Tête d‘Onyxia',18422,(SELECT id FROM "Classes" WHERE "name"='')),
('Tendon de dragon noir adulte',18705,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Ancien Grimoire de Cornerstone',17067,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de lien',18813,(SELECT id FROM "Classes" WHERE "name"='')),
('Couvre-chef de Stormrage',16900,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Crâne de Némésis',16929,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Casque de traqueur de dragon',16939,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de Vent du néant',16914,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Drapé de Saphiron',17078,(SELECT id FROM "Classes" WHERE "name"='')),
('Auréole de transcendance',16921,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cagoule Rougecroc',16908,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume de courroux',16963,(SELECT id FROM "Classes" WHERE "name"='Guerrier Tank')),
('Collier d‘Eskhandar',18205,(SELECT id FROM "Classes" WHERE "name"='')),
('Couronne du jugement',16955,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque des dix tempêtes',16947,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Eclat de l‘Ecaille',17064,(SELECT id FROM "Classes" WHERE "name"='')),
('Porte-mort',17068,(SELECT id FROM "Classes" WHERE "name"='')),
('Sac à dos en cuir d‘Onyxia',17966,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Tête d‘Onyxia',18423,(SELECT id FROM "Classes" WHERE "name"='')),
('Vis‘kag le Saigneur',17075,(SELECT id FROM "Classes" WHERE "name"=''));

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
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17075));
