const fs = require("fs");

const insertTemplate = `
-- safe comment
-- THIS FILE IS GENERATED
-- from https://docs.google.com/document/d/1UzSvjPjsRW7RX_ujcFQht6_Tg5SwTlRMLQxzN9Oq71Q/edit

INSERT INTO "ClassItem" ("itemId", "classId", "comment")
VALUES`;

function oneLine(itemName, classe, comment) {
  comment = comment ? `'${comment}'` : "NULL";
  return `
((SELECT id FROM "Items" WHERE "name"=
'${itemName}'
),(SELECT id FROM "Classes" WHERE "name"=
'${classe}'), ${comment}),`;
}

function replaceLast(x, y, z) {
  var a = x.split("");
  a[x.lastIndexOf(y)] = z;
  return a.join("");
}

const classesMacros = {
  Guerrier: ["Guerrier DPS", "Guerrier Tank"],
  Paladin: ["Paladin Tank", "Paladin Heal", "Paladin Ret"],
  Chaman: ["Chaman Heal", "Chaman Amélio", "Chaman Elem"],
  Druide: ["Druide Heal", "Druide Féral", "Druide Equi"],
  Prêtre: ["Prêtre Heal", "Prêtre Ombre"],
  Caster: ["Chaman Elem", "Druide Equi", "Mage", "Démoniste", "Prêtre Ombre"],
  DPS: [
    "Guerrier DPS",
    "Paladin Ret",
    "Chaman Amélio",
    "Chasseur",
    "Voleur",
    "Druide Féral"
  ],
  Heal: ["Prêtre Heal", "Druide Heal", "Chaman Heal", "Paladin Heal"],
  Tank: ["Guerrier Tank", "Paladin Tank", "Druide Féral"]
  // Tous: [
  //   "Guerrier Tank",
  //   "Guerrier DPS",
  //   "Paladin Tank",
  //   "Paladin Heal",
  //   "Paladin Ret",
  //   "Chaman Heal",
  //   "Chaman Amélio",
  //   "Chaman Elem",
  //   "Druide Heal",
  //   "Druide Féral",
  //   "Druide Equi",
  //   "Voleur",
  //   "Prêtre Heal",
  //   "Prêtre Ombre",
  //   "Mage",
  //   "Démoniste",
  //   "Chasseur"
  // ]
};

const itemClassesDatas = String(
  fs.readFileSync(__dirname + "/items-classes.csv", {
    encoding: "UTF-8"
  })
);

const lines = itemClassesDatas.split("\n");
let output = insertTemplate;
let currentItem;
let currentComment = "";

lines.forEach(itemOrClass => {
  itemOrClass = itemOrClass.trim();
  if (
    itemOrClass === "" ||
    itemOrClass === "Tous" ||
    itemOrClass.startsWith("#")
  ) {
    return;
  }
  const isNewItem = itemOrClass.startsWith("-");
  if (isNewItem) {
    const item = itemOrClass.replace("-", "");
    const [itemName, comment] = item.split("|");
    currentComment = comment || "";
    currentItem = itemName
      .trim()
      .replace(/'/g, "‘")
      .replace(/\./g, ",");
    output += `
`;
    return;
  }
  const classe = itemOrClass;
  const classesToAdd = classesMacros[classe] ? classesMacros[classe] : [classe];

  output += `
-- ${currentItem}`;
  classesToAdd.forEach(currentClass => {
    output += oneLine(currentItem, currentClass.trim(), currentComment.trim());
  });
});

const finalResult = replaceLast(output, ",", ";");

// tslint:disable-next-line:no-console
console.log(finalResult);

fs.writeFileSync(__dirname + "/items-classes.sql", finalResult);
