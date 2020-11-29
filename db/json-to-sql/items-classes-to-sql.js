const fs = require("fs");

const insertTemplate = `
-- safe comment
-- THIS FILE IS GENERATED
INSERT INTO "ClassItem" ("itemId","classId","prio","comment")
VALUES`;

function oneLine(itemName, classe, prio, comment) {
  comment = comment ? `'${comment}'` : "NULL";
  return `
  ((SELECT id FROM "Items" WHERE "name"=
  '${itemName}'
  ),(SELECT id FROM "Classes" WHERE "name"=
  '${classe}'), ${String(prio)}, ${comment}),`;
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
let currentComment = "";

lines.forEach(line => {
  line = line.trim();
  if (line === "" || line.startsWith("#")) {
    return;
  }
  const split = line.split(",");
  if (split.length === 1) {
    const [itemName, comment] = line.split("|");
    currentComment = comment || "";
    currentItem = itemName
      .trim()
      .replace(/'/g, "‘")
      .replace(/\./g, ",");
    output += `
`;
    return;
  }
  const [classe, prio] = split;
  output += oneLine(
    currentItem,
    classe.trim(),
    prio.trim(),
    currentComment.trim()
  );
});

// tslint:disable-next-line:no-console
console.log(replaceLast(output, ",", ";"));

fs.writeFileSync(
  __dirname + "/items-classes.sql",
  replaceLast(output, ",", ";")
);
