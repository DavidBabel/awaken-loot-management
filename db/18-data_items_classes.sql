

INSERT INTO "ClassItem" ("classId","itemId","prio")
VALUES
  ((SELECT id FROM "Classes" WHERE "name"=
  ''
  ),(SELECT id FROM "Items" WHERE "name"=
  '')),

;