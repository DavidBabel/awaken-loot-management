import Paper from "@material-ui/core/Paper";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import VisibilityIcon from "@material-ui/icons/Visibility";
import Link from "next/link";
import Router from "next/router";
import React from "react";

import { useQuery } from "@apollo/react-hooks";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Player, Query } from "../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { ALL_RAIDS } from "../../lib/gql/raid-queries";
import { byValue } from "../../lib/utils/sorter";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      height: "calc(100vh - 140px)"
    },
    tableWrapper: {
      height: "100%",
      overflow: "auto",
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "rgba(0,0,0,0.6)",
        borderRadius: "2px"
      },
      "&::-webkit-scrollbar-track": {
        boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)"
      },
      "&::-webkit-scrollbar": {
        width: "10px"
      }
    },
    table: {
      minWidth: 650,
      "& .MuiTableCell-head": {
        backgroundColor: "#242424",
        color: "white"
      },
      "& .MuiTableCell-root": {
        border: "solid 1px #212121",
        position: "relative",
        padding: "5px 5px"
      },
      "& td.MuiTableCell-root:not(.perc-cell)": {
        cursor: "pointer"
      },
      "& .MuiTableCell-root:hover .MuiSvgIcon-root": {
        visibility: "visible",
        opacity: "1",
        transition: "opacity 0.2s ease-in-out"
      },
      "& .MuiSvgIcon-root": {
        position: "absolute",
        height: "100%",
        width: "24px",
        top: 0,
        padding: 0,
        left: 0,
        right: 0,
        margin: "auto",
        visibility: "hidden",
        opacity: "0",
        transition: "opacity 0.3s ease-in-out"
      },
      "& th.MuiTableCell-body": {
        backgroundColor: "#242424"
      }
    },
    attPercentage: {
      minWidth: 60,
      backgroundColor: "#242424",
      color: "white"
    },
    absent: {
      backgroundColor: "#b00000"
    },
    present: {
      backgroundColor: "#106010"
    },
    rotation: {
      backgroundColor: "#b09000"
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
  const players = dataPlayers.allPlayers.nodes
    .filter((p: Player) => p.active)
    .sort(byValue("classId"));
  let raidsNb = 0;
  allRaids.forEach(raid => {
    if (raid.raidPlayersByRaidId.nodes.length > 0) {
      raidsNb++;
    }
  });

  return (
    <Paper className={classes.root}>
      <div className={classes.tableWrapper}>
        <Table className={classes.table} stickyHeader={true}>
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell>Att. %</TableCell>
              {allRaids.map(raid => {
                if (raid.raidPlayersByRaidId.nodes.length > 0) {
                  return (
                    <TableCell align="center" key={raid.id}>
                      {raid.donjonByDonjonId.shortName}
                      <br />
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
              <TableRow key={player.id + player.name}>
                <TableCell component="th" scope="row">
                  <Link
                    href="/player/view/[id]"
                    as={`/player/view/${player.id}`}
                  >
                    <a
                      target="_blank"
                      style={{
                        color: player.classByClassId.color,
                        textDecoration: "none"
                      }}
                    >
                      {player.name}
                    </a>
                  </Link>
                </TableCell>
                <TableCell className={classes.attPercentage + " perc-cell"}>
                  {player.raidPlayersByPlayerId.nodes.length === 0
                    ? "0 %"
                    : `${Math.round(
                        (player.raidPlayersByPlayerId.nodes.length * 100) /
                          raidsNb
                      )} %`}
                </TableCell>
                {allRaids.map(raid => {
                  if (raid.raidPlayersByRaidId.nodes.length > 0) {
                    let absent = true;
                    let enRotation = false;
                    raid.raidPlayersByRaidId.nodes.forEach(raidPlayer => {
                      if (
                        raidPlayer &&
                        raidPlayer.playerByPlayerId.id === player.id
                      ) {
                        absent = false;
                        if (raidPlayer.passed) {
                          enRotation = true;
                        }
                      }
                    });
                    return (
                      <TableCell
                        onClick={() => {
                          Router.push("/raid/edit/" + raid.id);
                        }}
                        key={player.id + raid.id}
                        className={
                          absent
                            ? classes.absent
                            : enRotation
                            ? classes.rotation
                            : classes.present
                        }
                      >
                        <VisibilityIcon />
                      </TableCell>
                    );
                  }
                  return null;
                })}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </Paper>
  );
}
