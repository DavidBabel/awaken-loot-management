import { Player, RaidPlayer } from "../../lib/generatedTypes";

export function getFirstRaidDate(player: Player) {
  let firstRaidDate = new Date();
  player.raidPlayersByPlayerId.nodes.forEach((raid: RaidPlayer) => {
    const currentRaidDate = new Date(raid.raidByRaidId.date);
    if (currentRaidDate < firstRaidDate) {
      firstRaidDate = currentRaidDate;
    }
  });
  return firstRaidDate;
}
