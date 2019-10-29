

INSERT INTO "ClassItem" ("classId","itemId","prio")
VALUES
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier d‘illumination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de puissance de sort'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau épais en sombrefer'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Jambières de Tempête de mana'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Robe du pouvoir volatil'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Cuissards d‘Attise-flammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Trembleterre'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Marque du Frappeur'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Médaillon de Puissance inébranlable'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Griffe droite d‘Eskhandar'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Grimoire de runes de feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de frappe rapide'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Corde de mana enflammé'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Gantelets de garde des flammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame à tranchant d‘obsidienne'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Talisman de pouvoir éphémère'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Vieux gants en cuir du Magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Bottes durcies dans le magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Spallières de la Terre profonde'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Solerets du Marcheflammes'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dague ensorceleuse'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Ecraseur cramoisi'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Garde-poignets de stabilité'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Pantalon en écailles de salamandre'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Marteau d‘Aurastone'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Déchireur de Gutgore'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Disque Drillborer'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame de brutalité'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Sceau de l‘archimagus'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Frappe-ténèbres'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Bâton de domination'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Magelame de Chante-azur'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lance-grenaille explosif'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de cautérisation'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape ignifugée'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Dent de chien du magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Drague-lave de Finkle'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Echarpe des secrets murmurés'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Epaulières de garde du feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Gants de la flamme hypnotique'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Garde-poignets de vrai vol'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Grèves du Coeur du Magma'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Spallières de croissance sauvage'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Oeil de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Lame de la perdition'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Sulfuras'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Couronne de destruction'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Anneau de Précisia'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape sang-de-dragon'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), true),


  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Essence de la Flamme pure'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Cape du Voile de brume'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Ceinturon d‘assaut'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), true),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Collier du Seigneur du Feu'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Arrache-moelle'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Prêtre'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Druide'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Mage'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Démoniste'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Voleur'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fragment de la Flamme'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chasseur'), false),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier Tank'), false),
  ((SELECT id FROM "Classes" WHERE "name"=
  'Fléau de Bonereaver'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Guerrier DPS'), true),

  ((SELECT id FROM "Classes" WHERE "name"=
  'Défenseur de Malistar'
  ),(SELECT id FROM "Items" WHERE "name"=
  'Chaman'), true)
;

-- INSERT INTO "ClassItem" ("classId","itemId","prio")
-- VALUES
--   ((SELECT id FROM "Classes" WHERE "name"=
--   'Défenseur de Malistar'
--   ),(SELECT id FROM "Items" WHERE "name"=
--   'Chaman'), true)
-- ;


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