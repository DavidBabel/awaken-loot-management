
-- molten core hors set
INSERT INTO "ClassItem" ("itemId","classId","prio")
VALUES

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de la Terre profonde'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),


  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Défenseur de Malistar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true)
;

-- onyxia
INSERT INTO "ClassItem" ("itemId","classId","prio")
VALUES
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Tête d‘Onyxia'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chasseur'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Ancien Grimoire de Cornerstone'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Anneau de lien'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Drapé de Saphiron'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Collier d‘Eskhandar'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Chaman'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Eclat de l‘Ecaille'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Porte-mort'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Items" WHERE "name"=
  'Vis‘kag le Saigneur'
  ),(SELECT id FROM "Classes" WHERE "name"=
  'Voleur'), true)
;


-- ('Prêtre',        '#FFFFFF'),
-- ('Mage',          '#69CCF0'),
-- ('Démoniste',     '#9482C9'),
-- ('Voleur',        '#FFF569'),
-- ('Druide',        '#FF7D0A'),
-- ('Chasseur',      '#ABD473'),
-- ('Chaman',        '#0070DE'),
-- ('Guerrier Tank', '#C79C6E'),
-- ('Guerrier DPS',  '#C41F3B'),
-- ('Paladin',       '#F58CBA');