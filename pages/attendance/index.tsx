import { useQuery } from "@apollo/react-hooks";
import {
  Paper,
  Switch,
  TableBody,
  TableCell,
  TableHead,
  TableRow
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import React, { useState } from "react";
import { AttendanceLegende } from "../../components/attendance/AttendanceLegende";
import { AttendanceLine } from "../../components/attendance/AttendanceLine";
import { AttendanceTableRaidHeaders } from "../../components/attendance/AttendanceTableRaidHeaders";
import {
  ChangeAttendanceDialog,
  ChangeAttendanceDialogProps
} from "../../components/attendance/ChangeAttendanceDialog";
import { CustomAttendanceTable } from "../../components/attendance/CustomAttendanceTable";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { useMemberContext } from "../../lib/context/member";
import { Player, Query } from "../../lib/generatedTypes";
import { ALL_ACTIVE_PLAYERS } from "../../lib/gql/player-queries";
import { ALL_RAIDS } from "../../lib/gql/raid-queries";
import { useToggle } from "../../lib/hooks/toggle";
import { role } from "../../lib/role-level";
import { byValue } from "../../lib/utils/sorter";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      height: "calc(100vh - 160px)",
      [theme.breakpoints.down("sm")]: {
        height: "calc(100vh - 56px)"
      }
    }
  })
);

export default function PageIndex() {
  const classes = useStyles("");
  const member = useMemberContext();

  const [hideRerolls, toggleHideRerolls] = useToggle(true);

  const defaultDialog = {
    isOpen: false,
    raidPlayer: null,
    raid: null,
    player: null,
    setLoading: () => {}
  };
  const [dialogProps, setDialogProps] = useState<ChangeAttendanceDialogProps>(
    defaultDialog
  );

  const {
    loading: loadingAllRaids,
    data: dataAllRaids,
    error: errorAllRaids,
    refetch: refetchRaids
  } = useQuery<Query>(ALL_RAIDS);
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_ACTIVE_PLAYERS);

  const loading = loadingPlayers || loadingAllRaids;
  const error = errorPlayers || errorAllRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const allRaids = dataAllRaids.allRaids.nodes;
  const players = dataPlayers.allPlayers.nodes
    .filter((p: Player) => {
      if (!p.active) {
        return false;
      }
      if (p.rerollOf && hideRerolls) {
        return false;
      }
      return true;
    })
    .sort(byValue("classId"));

  return (
    <>
      <Paper className={classes.root}>
        <AttendanceLegende />
        &nbsp;&nbsp;&nbsp;&nbsp;Voir rerolls
        <Switch
          size="small"
          checked={!hideRerolls}
          onChange={toggleHideRerolls}
        />
        <CustomAttendanceTable>
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Att. %</TableCell>
              {allRaids.map(raid => (
                <AttendanceTableRaidHeaders
                  raid={raid}
                  key={`attendance-header-raid-${raid.id}`}
                />
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            {players.map((player: Player) => (
              <AttendanceLine
                key={`attendance-line-${player.id}`}
                player={player}
                openAttendanceDialog={setDialogProps}
                raids={allRaids}
                isAllowedToChange={member.level >= role.class_master}
              />
            ))}
          </TableBody>
        </CustomAttendanceTable>
      </Paper>
      <ChangeAttendanceDialog
        {...dialogProps}
        refetchRaids={refetchRaids}
        closeDialog={() => setDialogProps(defaultDialog)}
      />
    </>
  );
}
