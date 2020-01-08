import { TableRow } from "@material-ui/core";
import { Player, Raid, RaidPlayer } from "../../lib/generatedTypes";
import { OpenSnackBar } from "../../lib/hooks/snackbar";
import { AttendanceCell } from "./AttendanceCell";
import { ChangeAttendanceDialogCallback } from "./ChangeAttendanceDialog";
import { getFirstRaidDate } from "./helpers";
import { PlayerAttendanceName } from "./PlayerAttendanceName";
import { PlayerAttendancePercentage } from "./PlayerAttendancePercentage";
import { RaidStatusKey, raidStatusList } from "./raid-status";

interface Props {
  player: Player;
  raids: Raid[];
  openSnackBar: OpenSnackBar;
  isAllowedToChange: boolean;
  openAttendanceDialog: ChangeAttendanceDialogCallback;
}

export function AttendanceLine({
  player,
  raids,
  openSnackBar,
  isAllowedToChange,
  openAttendanceDialog
}: Props) {
  const firstRaidDate = getFirstRaidDate(player);
  let raidsNb = 0;
  const raidLinkIds = [];
  const totalRaidPlayed = player.raidPlayersByPlayerId.nodes.length;
  const raidLinkedIdsPresent = [];
  raids.forEach(raid => {
    if (
      raid.raidPlayersByRaidId.nodes.length > 0 &&
      new Date(raid.date) >= firstRaidDate
    ) {
      if (!raid.linkBetweenRaids) {
        raidsNb++;
      } else {
        if (raidLinkIds.indexOf(raid.linkBetweenRaids) === -1) {
          raidLinkIds.push(raid.linkBetweenRaids);
          raidsNb++;
        }
      }
    }
    raid.raidPlayersByRaidId.nodes.forEach(raidPlayer => {
      if (raidPlayer && raidPlayer.playerByPlayerId.id === player.id) {
        if (raid.linkBetweenRaids) {
          if (raidLinkedIdsPresent.indexOf(raid.linkBetweenRaids) === -1) {
            raidLinkedIdsPresent.push(raid.linkBetweenRaids);
          } else {
            raidsNb++; // rare cas ou le joueur est présent dans plusieur raid linké entre eux
          }
        }
      }
    });
  });

  return (
    <TableRow key={player.id + player.name}>
      <PlayerAttendanceName player={player} />
      <PlayerAttendancePercentage
        totalRaidPlayed={totalRaidPlayed}
        totalRaids={raidsNb}
      />
      {raids.map((raid: Raid) => {
        if (raid.raidPlayersByRaidId.nodes.length > 0) {
          let currentRaidPlayer = raid.raidPlayersByRaidId.nodes.find(
            (rp: RaidPlayer) => rp.playerByPlayerId.id === player.id
          );

          // DO NOT WORK HERE
          if (currentRaidPlayer?.status === -1) {
            currentRaidPlayer = null;
          }

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
          }

          return (
            <AttendanceCell
              canChange={isAllowedToChange}
              status={status}
              onClick={() => {
                if (isAllowedToChange) {
                  openAttendanceDialog({
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
        }
        return null;
      })}
    </TableRow>
  );
}
