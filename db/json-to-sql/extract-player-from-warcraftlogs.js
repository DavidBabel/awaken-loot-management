// tslint:disable:object-literal-sort-keys
// -- 1 - Prêtre
// -- 2 - Mage
// -- 3 - Démoniste
// -- 4 - Voleur
// -- 5 - Druide
// -- 6 - Chasseur
// -- 7 - Chaman
// -- 8 - Guerrier Tank
// -- 9 - Guerrier DPS
// -- 10 - Paladin

classes = {
  Warrior: "to_replace_9_or_8",
  Hunter: 6,
  Mage: 2,
  Rogue: 4,
  Warlock: 3,
  Druid: 5,
  Priest: 1,
  Shaman: 7
};

// TODO manage war tank by name, fallback on DD

copy(
  Array.from(
    new Set(
      Array.from($(".composition-table .composition-entry a")).map(x => {
        let spaces = "";
        for (let i = x.innerText.length; i < 13; i++) {
          spaces += " ";
        }
        return `('${x.innerText}'${spaces}, ${
          classes[x.className]
        },  'player', null),`;
      })
    )
  ).join("\n")
);
