import {
  createStyles,
  makeStyles,
  TableCell,
  TableRow,
  Theme
} from "@material-ui/core";
import SettingsIcon from "@material-ui/icons/Settings";
import { Player, Raid } from "../../lib/generatedTypes";
import { getFirstRaidDate } from "./helpers";
import { PlayerAttendanceName } from "./PlayerAttendanceName";
import { PlayerAttendancePercentage } from "./PlayerAttendancePercentage";

interface Props {
  player: Player;
  raids: Raid[];
  openSnackBar: (msg: string, action: "error" | "success") => void;
  isAllowedToChange: boolean;
}

// TODO backend authorisations
const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    // TODO old, to remove
    absent: {
      backgroundColor: "#b00000"
    },
    present: {
      backgroundColor: "#106010"
    },
    inAnotherId: {
      backgroundColor: "#474747"
    },
    rotation: {
      backgroundColor: "#b09000"
    },
    inscritAbsent: {
      backgroundColor: "#800080"
    },
    pasDansGuilde: {
      backgroundColor: "#242424"
    }
  })
);

export function AttendanceLine({
  player,
  raids,
  openSnackBar,
  isAllowedToChange
}: Props) {
  const classes = useStyles("");

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
      {raids.map(raid => {
        if (raid.raidPlayersByRaidId.nodes.length > 0) {
          let absent = true;
          let inAnotherId = false;
          const enRotation = false;
          let pasEncoreDansGuilde = false;

          if (new Date(raid.date) >= firstRaidDate) {
            raid.raidPlayersByRaidId.nodes.forEach(raidPlayer => {
              if (raidPlayer && raidPlayer.playerByPlayerId.id === player.id) {
                absent = false;
                // if (raidPlayer.passed) {
                //   enRotation = true;
                // }
              }
            });
          } else {
            pasEncoreDansGuilde = true;
            absent = false;
          }
          if (absent) {
            if (
              raid.linkBetweenRaids &&
              raidLinkedIdsPresent.indexOf(raid.linkBetweenRaids) !== -1
            ) {
              inAnotherId = true;
              absent = false;
            }
          }
          return (
            <TableCell
              onClick={() => {
                if (isAllowedToChange) {
                  openSnackBar("Coucou", "success");
                }
              }}
              key={`cell-attendance-${player.id}-${raid.id}`}
              // style={{backgroundColor: /* raidPlayer.status */}}
              className={
                absent
                  ? classes.absent
                  : inAnotherId
                  ? classes.inAnotherId
                  : enRotation
                  ? classes.rotation
                  : pasEncoreDansGuilde
                  ? classes.pasDansGuilde
                  : classes.present
              }
            >
              {isAllowedToChange && <SettingsIcon />}
            </TableCell>
          );
        }
        return null;
      })}
    </TableRow>
  );
}
