const fs = require("fs");

const insertTemplate = `
-- safe comment
-- THIS FILE IS GENERATED
INSERT INTO "ClassItem" ("itemId","classId","prio")
VALUES`;

function oneLine(itemName, classe, prio) {
  return `
  ((SELECT id FROM "Items" WHERE "name"=
  '${itemName}'
  ),(SELECT id FROM "Classes" WHERE "name"=
  '${classe}'), ${String(prio)}),`;
}

function replaceLast(x, y, z) {
  var a = x.split("");
  a[x.lastIndexOf(y)] = z;
  return a.join("");
}

const itemClassesDatas = String(
  fs.readFileSync(__dirname + "/items-classes.csv", {
    encoding: "UTF-8"
  })
);

const lines = itemClassesDatas.split("\n");
let output = insertTemplate;
let currentItem;

lines.forEach(line => {
  line = line.trim();
  if (line === "" || line.startsWith("#")) {
    return;
  }
  const split = line.split(",");
  if (split.length === 1) {
    currentItem = split[0]
      .trim()
      .replace(/'/g, "‘")
      .replace(/\./g, ",");
    output += `
`;
    return;
  }
  const [classe, prio] = split;
  output += oneLine(currentItem, classe.trim(), prio.trim());
});

// tslint:disable-next-line:no-console
console.log(replaceLast(output, ",", ";"));

fs.writeFileSync(
  __dirname + "/items-classes.sql",
  replaceLast(output, ",", ";")
);
