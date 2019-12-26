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
      height: "calc(100vh - 160px)",
      [theme.breakpoints.down("sm")]: {
        height: "calc(100vh - 56px)"
      }
    },
    tableWrapper: {
      position: "relative",
      height: "100%",
      overflow: "auto",
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "rgba(0,0,0,0.6)",
        borderRadius: "2px"
      },
      "&::-webkit-scrollbar-track": {
        boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)",
        backgroundColor: "rgba(0,0,0,0.2)"
      },
      "&::-webkit-scrollbar": {
        width: "10px",
        height: "10px",
        [theme.breakpoints.down("sm")]: {
          width: "5px",
          height: "5px"
        }
      }
    },
    table: {
      "& *": {
        [theme.breakpoints.down("sm")]: {
          fontSize: 12
        }
      },
      minWidth: 650,
      "& .MuiTableCell-head": {
        backgroundColor: "#242424",
        color: "white",
        minWidth: 20
      },
      "& .MuiTableCell-root": {
        border: "solid 1px #212121",
        padding: "5px 5px"
      },
      "& .MuiTableCell-body": {
        position: "relative"
      },
      "& td.MuiTableCell-root:not(.perc-cell)": {
        cursor: "pointer",
        padding: 0
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
    legende: {
      display: "flex",
      [theme.breakpoints.down("sm")]: {
        display: "none"
      },
      alignItems: "center",
      justifyContent: "center",
      flexWrap: "wrap",
      "& div": {
        margin: 5
      },
      "& span": {
        marginRight: 10
      }
    },
    legendeItem: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center"
    },
    legendeSquare: {
      width: 40,
      height: 30,
      border: "2px solid #212121"
    },
    attPercentage: {
      minWidth: 60,
      [theme.breakpoints.down("sm")]: {
        minWidth: 46
      },
      backgroundColor: "#242424",
      color: "white"
    },
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

  return (
    <Paper className={classes.root}>
      <div className={classes.legende}>
        <div className={classes.legendeItem}>
          <div className={classes.legendeSquare + " " + classes.present} />
          <span>Présent</span>
        </div>
        <div className={classes.legendeItem}>
          <div className={classes.legendeSquare + " " + classes.absent} />
          <span>Absent</span>
        </div>
        <div className={classes.legendeItem}>
          <div className={classes.legendeSquare + " " + classes.inAnotherId} />
          <span>Présent dans un raid lié</span>
        </div>
        <div className={classes.legendeItem}>
          <div className={classes.legendeSquare + " " + classes.rotation} />
          <span>En rotation / Backup</span>
        </div>
        <div className={classes.legendeItem}>
          <div
            className={classes.legendeSquare + " " + classes.inscritAbsent}
          />
          <span>Inscrit mais absent</span>
        </div>
        <div className={classes.legendeItem}>
          <div
            className={classes.legendeSquare + " " + classes.pasDansGuilde}
          />
          <span>Pas encore en raid</span>
        </div>
      </div>
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
                      {/*
                      TODO restore that without toLocaleDateString
                      {new Date(raid.date).toLocaleDateString("en-EN", {
                        year: "numeric",
                        month: "short",
                        day: "numeric"
                      })} */}
                    </TableCell>
                  );
                }
                return null;
              })}
            </TableRow>
          </TableHead>
          <TableBody>
            {players.map(player => {
              let firstRaidDate = new Date();
              player.raidPlayersByPlayerId.nodes.forEach(raid => {
                const currentRaidDate = new Date(raid.raidByRaidId.date);
                if (currentRaidDate < firstRaidDate) {
                  firstRaidDate = currentRaidDate;
                }
              });
              let raidsNb = 0;
              const raidLinkIds = [];
              const totalRaidPlayed = player.raidPlayersByPlayerId.nodes.length;
              const raidLinkedIdsPresent = [];
              allRaids.forEach(raid => {
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
                  if (
                    raidPlayer &&
                    raidPlayer.playerByPlayerId.id === player.id
                  ) {
                    if (raid.linkBetweenRaids) {
                      if (
                        raidLinkedIdsPresent.indexOf(raid.linkBetweenRaids) ===
                        -1
                      ) {
                        raidLinkedIdsPresent.push(raid.linkBetweenRaids);
                      } else {
                        raidsNb++; // rare cas ou le joueur est présent dans plusieur raid linké entre eux (exemple: easier)
                      }
                    }
                  }
                });
              });

              return (
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
                    {totalRaidPlayed === 0
                      ? "0 %"
                      : `${Math.round((totalRaidPlayed * 100) / raidsNb)} %`}
                  </TableCell>
                  {allRaids.map(raid => {
                    if (raid.raidPlayersByRaidId.nodes.length > 0) {
                      let absent = true;
                      let inAnotherId = false;
                      let enRotation = false;
                      let pasEncoreDansGuilde = false;

                      if (new Date(raid.date) >= firstRaidDate) {
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
                      } else {
                        pasEncoreDansGuilde = true;
                        absent = false;
                      }
                      if (absent) {
                        if (
                          raid.linkBetweenRaids &&
                          raidLinkedIdsPresent.indexOf(
                            raid.linkBetweenRaids
                          ) !== -1
                        ) {
                          inAnotherId = true;
                          absent = false;
                        }
                      }
                      return (
                        <TableCell
                          onClick={() => {
                            Router.push("/raid/edit/" + raid.id);
                          }}
                          key={player.id + raid.id}
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
                          <VisibilityIcon />
                        </TableCell>
                      );
                    }
                    return null;
                  })}
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </div>
    </Paper>
  );
}
