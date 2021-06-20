SELECT 1 AS "Haut Roi Maulgar";

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Espauliers du héros déchu',29762, 2),
('Espauliers du champion déchu',29763, 2),
('Espauliers du défenseur déchu',29764, 2),
('Poignets de guerre flèchelame',28795, 2),
('Cape brutale de l‘ogre-magi',28797, 2),
('Marteau des naaru',28800, 2),
('Ceinture d‘inspiration divine',28799, 2),
('Heaume de guerre de Maulgar',28801, 2),
('Masque maléfique des ombres',28796, 2),
('Sautoir du repentir',31321, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29762)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29763)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=29764)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28795)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28797)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28800)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28799)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28801)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=28796)),
((SELECT id FROM "Bosses" WHERE "name"='Haut Roi Maulgar'),(SELECT id FROM "Items" WHERE "wowheadId"=31321));

SELECT 1 AS "Gruul le Tue-dragon";

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Jambières du héros déchu',29765, 2),
('Jambières du champion déchu',29766, 2),
('Jambières du défenseur déchu',29767, 2),
('Bottes des Cisailles',28810, 2),
('Ceinture cousue de Gronn',28828, 2),
('Dent de Gruul',28822, 2),
('Capuche du souffle de la nature',28803, 2),
('Collier de Cho‘gall',28804, 2),
('Gantelets de la perfection martiale',28824, 2),
('Shuriken de négation',28826, 2),
('Trophée Epine-de-dragon',28830, 2),
('Défendeur de l‘héritage aldori',28825, 2),
('Oeil de Gruul',28823, 2),
('Gantelets du tueur de dragon',28827, 2),
('Hache des seigneurs gronns',28794, 2),
('Lame-magus Saignegueule',28802, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29765)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29766)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=29767)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28810)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28828)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28822)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28803)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28804)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28824)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28826)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28830)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28825)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28823)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28827)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28794)),
((SELECT id FROM "Bosses" WHERE "name"='Gruul le Tue-dragon'),(SELECT id FROM "Items" WHERE "wowheadId"=28802));

SELECT 1 AS "Magtheridon";

INSERT INTO "Items" ("name","wowheadId","lootLevel","doesNotCount")
VALUES
('Sacoche de seigneur des abîmes',34845, 1, true);

INSERT INTO "Items" ("name","wowheadId","lootLevel")
VALUES
('Tête de Magtheridon',32385, 2),
('Corselet du héros déchu',29755, 2),
('Corselet du défenseur déchu',29753, 2),
('Bâton coeur-de-cristal à impulsions',28782, 2),
('Grand heaume de tonnerre',28775, 2),
('Oeil de Magtheridon',28789, 2),
('Talisman karaborien',28781, 2),
('Ceinturon du puits sans fond',28779, 2),
('Corselet du champion déchu',29754, 2),
('Baguette d‘oblitération érédar',28783, 2),
('Cape du traqueur des puits',28777, 2),
('Ceinturon du puits de la terreur',28778, 2),
('Gants langue-de-vipère',28776, 2),
('Couteau de brèche de la fosse',28774, 2),
('Egide du redresseur de torts',29458, 2),
('Protège-mains de dévoreur d‘âmes',28780, 2);

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=34845)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=32385)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29755)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29753)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28782)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28775)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28789)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28781)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28779)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29754)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28783)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28777)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28778)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28776)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28774)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=29458)),
((SELECT id FROM "Bosses" WHERE "name"='Magtheridon'),(SELECT id FROM "Items" WHERE "wowheadId"=28780));


