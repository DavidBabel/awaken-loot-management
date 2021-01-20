import { TableRow } from "@material-ui/core";
import { Player, Raid, RaidPlayer } from "../../lib/generatedTypes";
import { AttendanceCell } from "./AttendanceCell";
import { ChangeAttendanceDialogCallback } from "./ChangeAttendanceDialog";
import { getFirstRaidDate } from "./helpers";
import { PlayerAttendanceName } from "./PlayerAttendanceName";
// import { PlayerAttendancePercentage } from "./PlayerAttendancePercentage";
import { RaidStatusKey, raidStatusList } from "./raid-status";

interface Props {
  player: Player;
  raids: Raid[];
  isAllowedToChange: boolean;
  openAttendanceDialog: ChangeAttendanceDialogCallback;
}

export function AttendanceLine({
  player,
  raids,
  isAllowedToChange,
  openAttendanceDialog
}: Props) {
  const firstRaidDate = getFirstRaidDate(player);
  // let raidsNb = 0;
  const raidLinkIds = [];
  // const totalRaidPlayed = player.raidPlayersByPlayerId.nodes.length;
  const raidLinkedIdsPresent = [];
  raids.forEach(raid => {
    if (
      raid.raidPlayersByRaidId.nodes.length > 0 &&
      new Date(raid.date) < new Date() &&
      new Date(raid.date) >= firstRaidDate
    ) {
      if (!raid.linkBetweenRaids) {
        // raidsNb++;
      } else {
        if (raidLinkIds.indexOf(raid.linkBetweenRaids) === -1) {
          raidLinkIds.push(raid.linkBetweenRaids);
          // raidsNb++;
        }
      }
    }
    raid.raidPlayersByRaidId.nodes.forEach(raidPlayer => {
      if (raidPlayer && raidPlayer.playerByPlayerId.id === player.id) {
        if (raid.linkBetweenRaids) {
          if (raidLinkedIdsPresent.indexOf(raid.linkBetweenRaids) === -1) {
            raidLinkedIdsPresent.push(raid.linkBetweenRaids);
          } else {
            // raidsNb++; // rare cas ou le joueur est présent dans plusieur raid linké entre eux
          }
        }
      }
    });
  });

  return (
    <TableRow key={`attendance-table-row${player.id + player.name}`}>
      <PlayerAttendanceName player={player} />
      {/* <PlayerAttendancePercentage
        totalRaidPlayed={totalRaidPlayed}
        totalRaids={raidsNb}
      /> */}
      {raids.map((raid: Raid) => {
        const currentRaidPlayer = raid.raidPlayersByRaidId.nodes.find(
          (rp: RaidPlayer) => rp.playerByPlayerId.id === player.id
        );

        let status: RaidStatusKey = "absent";

        if (new Date(raid.date) < firstRaidDate) {
          status = "pasDansGuilde";
        } else if (currentRaidPlayer) {
          status = "present";
          if (currentRaidPlayer.status > 0) {
            status = raidStatusList[currentRaidPlayer.status].key;
          }
        } else if (
          raid.linkBetweenRaids &&
          raidLinkedIdsPresent.includes(raid.linkBetweenRaids)
        ) {
          status = "inAnotherId";
        } else if (new Date(raid.date) > new Date()) {
          status = "raidFutur";
        }

        return (
          <AttendanceCell
            canChange={isAllowedToChange}
            status={status}
            onClick={(setLoading: any) => {
              if (isAllowedToChange) {
                openAttendanceDialog({
                  setLoading,
                  isOpen: true,
                  raidPlayer: currentRaidPlayer,
                  player,
                  raid
                });
              }
            }}
            key={`cell-attendance-${player.id}-${raid.id}`}
          />
        );
      })}
    </TableRow>
  );
}
