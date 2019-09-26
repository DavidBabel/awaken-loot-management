import { RaidPlayer } from '../generatedTypes';

export function raidPlayerByClass(player1: RaidPlayer, player2: RaidPlayer) {
  const p1Class = player1.playerByPlayerId.classByClassId.id;
  const p2Class = player2.playerByPlayerId.classByClassId.id;
  if (p1Class === p2Class) {
    return player1.playerByPlayerId.name < player2.playerByPlayerId.name
      ? -1
      : 1;
  }
  return p1Class - p2Class;
}
