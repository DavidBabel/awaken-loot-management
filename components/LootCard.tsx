import { Loot } from '../lib/generatedTypes';

export function LootCard({
  raidByRaidId: { date },
  playerByPlayerId: {
    name,
    classByClassId: { color }
  }
}: Loot) {
  return (
    <div>
      <div>{date}</div>
      <div style={{ color: color }}>{name}</div>
    </div>
  );
}
