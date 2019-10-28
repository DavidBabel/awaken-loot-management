

INSERT INTO "ClassItem" ("classId","itemId")
VALUES
  ((SELECT id FROM "Classes" WHERE "name"=
  ''
  ),(SELECT id FROM "Items" WHERE "name"=
  '')),

;