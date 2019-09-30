import { Loot } from "../../lib/generatedTypes";

function LootLine(loot: Loot) {
  return (
    <div>
      {JSON.stringify(loot)}

      <hr />
    </div>
  );
}

interface Props {
  loots: Loot[];
}

export function LootList({ loots }: Props) {
  return (
    <div>
      {loots.map((loot, i) => (
        <LootLine key={`itemloot-${4}-${i}`} {...loot} />
      ))}
    </div>
  );
}
