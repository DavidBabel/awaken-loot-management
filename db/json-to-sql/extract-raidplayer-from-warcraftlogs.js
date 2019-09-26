copy(
  Array.from(
    new Set(
      Array.from($(".composition-table .composition-entry a")).map(
        x => `(2, (SELECT id FROM "Players" WHERE "name"='${x.innerText}')),`
      )
    )
  ).join("\n")
);
