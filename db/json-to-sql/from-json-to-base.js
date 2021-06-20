const path = require("path");

console.log(process.argv);
const bossName = process.argv[2];
const bossLoots = require(path
  .join(__dirname, process.argv[3])
  .replace("json-to-sql/db/", ""));
const bossId = `(SELECT id FROM "Bosses" WHERE "name"='${bossName}')`;

const items = bossLoots.map(loot => {
  return `('${loot.text.replace("'", "‘")}',${loot.id})`;
});

const bossItems = bossLoots.map(loot => {
  const itemId = `(SELECT id FROM "Items" WHERE "wowheadId"=${loot.id})`;
  return `(${bossId},${itemId})`;
});

const request = `
INSERT INTO "Items" ("name","wowheadId")
VALUES
${items.join(",\n")};

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
${bossItems.join(",\n")};
`;

console.log(`SELECT 1 AS "${bossName}";\n`, request);
