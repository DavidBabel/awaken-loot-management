 -- SAFE BEGIN FOR CONCAT

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Hakken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes d‘arcaniste')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de traqueur de géant')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 1,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'))
-- ( 1,
--   (SELECT id FROM "Players" WHERE "name"=
--   'Bartok'), -- TODO pseudo exact ou BTO ?
--   (SELECT id FROM "Items" WHERE "name"=
--   'Lame à tranchant d‘obsidienne')),

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Hanzaplast'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Beudinio'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières cénariennes')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Kresmi'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants cénariens')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Rektall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Sprawl'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 2,
  (SELECT id FROM "Players" WHERE "name"=
  'Titanesque'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'))
-- ( 2, TODO
--   (SELECT id FROM "Players" WHERE "name"=
--   '?????'),
--   (SELECT id FROM "Items" WHERE "name"=
--   'loot sulfuron')),

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 3,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de dragon'))
-- TODO autres loots sur onyxia ?
  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de traqueur de géant')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de Gangrecoeur')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes Rageterre')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de puissance')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Gidgud'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets Rageterre')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de puissance')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Teimdall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collerette de prophétie')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières cénariennes')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Suprême'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 4,
  (SELECT id FROM "Players" WHERE "name"=
  'Traqùs'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de traqueur de géant'))

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Rektall'),
  (SELECT id FROM "Items" WHERE "name"=
  'Crâne de Némésis')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes')),
( 5,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'))

  ;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards cénariens')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mantelet de prophétie')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de traqueur de géant')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Plastron du tueur de la nuit')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Ikith'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation')),
( 6,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'))


  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Hakken'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tendon de dragon noir adulte')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque des dix tempêtes')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur')),
( 7,
  (SELECT id FROM "Players" WHERE "name"=
  'Oscuro'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'))

  ;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 8,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre'))

  ;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Allyssamyr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Nøwad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières Rageterre')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sandales de puissance')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Trackass'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-bras de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Zapikote'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne d‘arcaniste')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de Gangrecoeur')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants d‘arcaniste')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinturon de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Trackass'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mantelet de prophétie')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Plastron du tueur de la nuit')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Habit cénarien')),
( 9,
  (SELECT id FROM "Players" WHERE "name"=
  'Thorsen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘arcaniste'))

  ;



INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de puissance')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture du tueur de la nuit')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'L‘Oeil de la divinité')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de courroux')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Stormrage')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume')),
( 10,
  (SELECT id FROM "Players" WHERE "name"=
  'Abramus'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'))
;


INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Adblock'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tendon de dragon noir adulte')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Auréole de transcendance')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc')),
( 11,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards Rageterre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de traqueur de géant')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Nøwad'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Lums'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef du tueur de la nuit')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Suprême'),
  (SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère')),
-- TODO add lien de cherchevent
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Throma'),
  (SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Deiv'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de prophétie')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants cénariens')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Synrj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Brassards cénariens')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Espauliers de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Alk'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulettes de traqueur de géant')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de puissance')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Feuille ancienne pétrifiée')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Zapikote'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture d‘arcaniste')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kenyâ'),
  (SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Kaarr'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon Rougecroc')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Paffë'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de Stormrage')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle')),
( 12,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'))

;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
-- raid devilhunter
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Jonasran'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Capriseum'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
-- raid Lums
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Skwäsh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Auréole de transcendance')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Capoul'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ikith'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 13,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
-- raid devilhunter
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Lykwette'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de puissance')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Capriseum'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ràys'),
  (SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Yx'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bracelets du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Need'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collerette de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Kusogakî'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Qweakzor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Casque de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Knh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Lums'),
  (SELECT id FROM "Items" WHERE "name"=
  'Epaulettes Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Minatrix'),
  (SELECT id FROM "Items" WHERE "name"=
  'Gants d‘arcaniste')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Mules de Gangrecoeur')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture cénarienne')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Protège-épaules du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Boblemoche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Robe de Gangrecoeur')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Nozil'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuirasse de traqueur de géant')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Tàel'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Karaelys'),
  (SELECT id FROM "Items" WHERE "name"=
  'L‘Oeil de la divinité')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Throma'),
  (SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Psykøhazard'),
  (SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Callumlolz'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon Rougecroc')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Jambières de courroux')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Krigen'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon')),
-- raid elgor
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Brebouche'),
  (SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Ragegoriath'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture de puissance')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Elgor'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Øupla'),
  (SELECT id FROM "Items" WHERE "name"=
  'Bottes du tueur de la nuit')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Skau'),
  (SELECT id FROM "Items" WHERE "name"=
  'Pantalon de prophétie')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Ceinture Rageterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Gidgud'),
  (SELECT id FROM "Items" WHERE "name"=
  'Trembleterre')),
( 14,
  (SELECT id FROM "Players" WHERE "name"=
  'Keiki'),
  (SELECT id FROM "Items" WHERE "name"=
  'Habit Rageterre'))
;

INSERT INTO "Loots" ("raidId", "playerId", "itemId")
VALUES
-- raid devilhunter
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Abramus'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couronne de Vent du néant')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Knh'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Devilhunter'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Brosko'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia')),

-- raid deiv
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Cagoule Rougecroc')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Tephrite'),
  (SELECT id FROM "Items" WHERE "name"=
  'Couvre-chef de Stormrage')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Ladj'),
  (SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Mergueztguez'),
  (SELECT id FROM "Items" WHERE "name"=
  'Sac à dos en cuir d‘Onyxia')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Thünberg'),
  (SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille')),
( 15,
  (SELECT id FROM "Players" WHERE "name"=
  'Cocobanjo'),
  (SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'))
;