copy(
  Array.from(
    new Set(
      Array.from($(".composition-table .composition-entry a")).map(
        x => `('${x.innerText}'         , ${x.className},  'player'),`
      )
    )
  ).join("\n")
);
