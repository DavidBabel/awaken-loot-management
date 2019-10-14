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
      Array.from($("#attendance-table_wrapper tr td.sorting_1")).map(x => {
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
