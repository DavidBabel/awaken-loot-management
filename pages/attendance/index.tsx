import React from "react";
import { createStyles, Theme, makeStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";

import { useQuery } from "@apollo/react-hooks";
import { Query } from "../../lib/generatedTypes";
import { ALL_RAIDS } from "../../lib/gql/raid-queries";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { LoadingAndError } from "../../components/LoadingAndErrors";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "calc(100vw - 300px)"
    },
    paper: {
      marginTop: theme.spacing(3),
      width: "100%",
      height: "calc(100vh - 120px)",
      overflowX: "auto",
      marginBottom: theme.spacing(2)
    },
    table: {
      minWidth: 650,
      "& .MuiTableCell-head": {
        backgroundColor: "#242424",
        color: "white"
      },
      "& .MuiTableCell-root": {
        border: "solid 1px #212121"
      },
      "& th.MuiTableCell-body": {
        backgroundColor: "#242424"
      }
    },
    attPerc: {
      backgroundColor: "#242424",
      color: "white"
    },
    absent: {
      backgroundColor: "#b00000"
    },
    present: {
      backgroundColor: "#106010"
    }
  })
);

export default function PageIndex() {
  const classes = useStyles("");

  const {
    loading: loadingAllRaids,
    data: dataAllRaids,
    error: errorAllRaids
  } = useQuery<Query>(ALL_RAIDS);
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_PLAYERS);

  const loading = loadingPlayers || loadingAllRaids;
  const error = errorPlayers || errorAllRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const allRaids = dataAllRaids.allRaids.nodes;
  const players = dataPlayers.allPlayers.nodes;
  console.log(allRaids, players);
  players.sort((a, b) => {
    // Ordre alphabetique
    if (a.name > b.name) {
      return 1;
    }
    if (b.name > a.name) {
      return -1;
    }
    return 0;
  });
  return (
    <div className={classes.root}>
      <Paper className={classes.paper}>
        <Table className={classes.table} size="small" stickyHeader>
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Att. %</TableCell>
              {allRaids.map(raid => {
                if (raid.raidPlayersByRaidId.nodes.length > 0) {
                  return (
                    <TableCell align="center" key={raid.id}>
                      {raid.donjonByDonjonId.shortName}
                      {<br></br>}
                      {new Date(raid.date).toLocaleDateString("en-EN", {
                        year: "numeric",
                        month: "short",
                        day: "numeric"
                      })}
                    </TableCell>
                  );
                }
                return null;
              })}
            </TableRow>
          </TableHead>
          <TableBody>
            {players.map(player => (
              <TableRow key={player.name}>
                <TableCell
                  style={{ color: player.classByClassId.color }}
                  component="th"
                  scope="row"
                >
                  {player.name}
                </TableCell>
                <TableCell className={classes.attPerc}>%</TableCell>
                {allRaids.map(raid => {
                  if (raid.raidPlayersByRaidId.nodes.length > 0) {
                    let absent = true;
                    raid.raidPlayersByRaidId.nodes.forEach(raidPlayer => {
                      if (
                        raidPlayer &&
                        raidPlayer.playerByPlayerId.id === player.id
                      ) {
                        absent = false;
                      }
                    });
                    return (
                      <TableCell
                        key={player.id + raid.id}
                        className={absent ? classes.absent : classes.present}
                      ></TableCell>
                    );
                  }
                  return null;
                })}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </Paper>
    </div>
  );
}
