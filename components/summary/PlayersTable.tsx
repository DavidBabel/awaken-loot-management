import React from "react";

import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import PlayerTableRow from "../../components/summary/PlayerTableRow";
import Paper from "@material-ui/core/Paper";
import Button from "@material-ui/core/Button";
import KeyboardArrowDownIcon from "@material-ui/icons/KeyboardArrowDown";
import KeyboardArrowUpIcon from "@material-ui/icons/KeyboardArrowUp";


const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);
interface Props {
  classColor: String;
}
const useStyles = makeStyles({
  root: {
    width: "100%",
    marginTop: "10px",
    overflowX: "auto",
    "& .MuiTableCell-head": {
      backgroundColor: (props: Props) => `${props.classColor}`,
      color: "black"
    }
  },
  table: {
    minWidth: 700
  },
  headButton: {
    fontSize: "12px"
  }
});

function createData(
  name: string,
  merit: number,
  totalLoot: number,
  totalRaid: number,
  lastLootDate: string,
  lastRaidDate: string,
  playerId: number,
  playerLoots: any
) {
  return {
    name,
    merit,
    totalLoot,
    totalRaid,
    lastLootDate,
    lastRaidDate,
    playerId,
    playerLoots
  };
}
export default function PlayersTable(props) {
  const classes = useStyles(props);

  const rowsData = props.players.map(player => {
    let totalMerit = 0;
    let totalLoot = 0;
    const totalRaid = player.raidPlayersByPlayerId.nodes.length;
    player.playerMeritsByPlayerId.nodes.map(merit => {
      if (merit.validated) {
        totalMerit += merit.meritByMeritId.value;
      }
    });
    player.lootsByPlayerId.nodes.map(loot => {
      if (loot.active) {
        totalLoot += 1;
      }
    });
    let lastRaidDate = new Date("2010-01-01"); // je pars d'une date reculée
    if (totalRaid === 0) {
      lastRaidDate = null;
    } else {
      player.raidPlayersByPlayerId.nodes.map(raid => {
        const currentRaidDate = new Date(raid.raidByRaidId.date);
        if (currentRaidDate > lastRaidDate) {
          lastRaidDate = currentRaidDate;
        }
      });
    }

    let lastLootDate = new Date("2010-01-01"); // je pars d'une date reculée
    if (totalLoot === 0) {
      lastLootDate = null;
    } else {
      player.lootsByPlayerId.nodes.map(loot => {
        const currentLootDate = new Date(loot.raidByRaidId.date);
        if (currentLootDate > lastLootDate) {
          lastLootDate = currentLootDate;
        }
      });
    }
    let dateOptions = {
      year: "numeric",
      month: "long",
      day: "numeric"
    };
    return createData(
      player.name,
      Math.round((totalMerit * 100) / props.maxMeritValue),
      totalLoot,
      totalRaid,
      lastLootDate
        ? lastLootDate.toLocaleDateString("en-EN", dateOptions)
        : "Aucun",
      lastRaidDate
        ? lastRaidDate.toLocaleDateString("en-EN", dateOptions)
        : "Aucun",
      player.id,
      player.lootsByPlayerId.nodes
    );
  });
  rowsData.sort((a, b) => b.merit - a.merit);
  const [rows, setRows] = React.useState(rowsData);
  const [orderedBy, setOrderedBy] = React.useState("merit");
  const [orderedDESC, setOrderedDESC] = React.useState(false);

  function orderBy(colName: string) {
    let newRows = [...rows];
    let currentlyOrderedDesc = orderedDESC;
    if (colName === orderedBy) {
      currentlyOrderedDesc = !orderedDESC;
    }
    if (colName === "merit") {
      newRows.sort((a, b) =>
        currentlyOrderedDesc ? a.merit - b.merit : b.merit - a.merit
      );
    } else if (colName === "totalRaid") {
      newRows.sort((a, b) =>
        currentlyOrderedDesc
          ? a.totalRaid - b.totalRaid
          : b.totalRaid - a.totalRaid
      );
    } else if (colName === "totalLoot") {
      newRows.sort((a, b) =>
        currentlyOrderedDesc
          ? a.totalLoot - b.totalLoot
          : b.totalLoot - a.totalLoot
      );
    } else if (colName === "name") {
      newRows.sort((a, b) => {
        if (a.name > b.name) {
          return currentlyOrderedDesc ? -1 : 1;
        }
        if (b.name > a.name) {
          return currentlyOrderedDesc ? 1 : -1;
        }
        return 0;
      });
    } else if (colName === "lastLootDate") {
      newRows.sort((a, b) => {
        if (
          new Date(a.lastLootDate) > new Date(b.lastLootDate) ||
          a.lastLootDate === "Aucun"
        ) {
          return currentlyOrderedDesc ? -1 : 1;
        }
        if (
          new Date(b.lastLootDate) > new Date(a.lastLootDate) ||
          b.lastLootDate === "Aucun"
        ) {
          return currentlyOrderedDesc ? 1 : -1;
        }
        return 0;
      });
    } else if (colName === "lastRaidDate") {
      newRows.sort((a, b) => {
        if (
          new Date(a.lastRaidDate) > new Date(b.lastRaidDate) ||
          a.lastRaidDate === "Aucun"
        ) {
          return currentlyOrderedDesc ? -1 : 1;
        }
        if (
          new Date(b.lastRaidDate) > new Date(a.lastRaidDate) ||
          b.lastRaidDate === "Aucun"
        ) {
          return currentlyOrderedDesc ? 1 : -1;
        }
        return 0;
      });
    }
    if (colName === orderedBy) {
      setOrderedDESC(prevState => !prevState);
    }
    setOrderedBy(colName);
    setRows(newRows);
  }

  return (
    <Paper className={classes.root}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <StyledTableCell align="left">
              {" "}
              <Button
                className={classes.headButton}
                variant={orderedBy === "name" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("name");
                }}
              >
                Pseudo
                {orderedBy === "name" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center">
              {" "}
              <Button
                className={classes.headButton}
                variant={orderedBy === "merit" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("merit");
                }}
              >
                Merit
                {orderedBy === "merit" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center">
              <Button
                className={classes.headButton}
                variant={orderedBy === "totalLoot" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("totalLoot");
                }}
              >
                Total Loot
                {orderedBy === "totalLoot" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center">
              <Button
                className={classes.headButton}
                variant={orderedBy === "totalRaid" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("totalRaid");
                }}
              >
                Total Raid
                {orderedBy === "totalRaid" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center">
              {" "}
              <Button
                className={classes.headButton}
                variant={orderedBy === "lastLootDate" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("lastLootDate");
                }}
              >
                Last loot
                {orderedBy === "lastLootDate" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center">
              {" "}
              <Button
                className={classes.headButton}
                variant={orderedBy === "lastRaidDate" ? "outlined" : "text"}
                onClick={() => {
                  orderBy("lastRaidDate");
                }}
              >
                Last raid
                {orderedBy === "lastRaidDate" ? (
                  orderedDESC ? (
                    <KeyboardArrowDownIcon />
                  ) : (
                    <KeyboardArrowUpIcon />
                  )
                ) : (
                  ""
                )}
              </Button>
            </StyledTableCell>
            <StyledTableCell align="center"></StyledTableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          <React.Fragment>
            {rows.map(row => (
              <PlayerTableRow
                key={row.name}
                rowData={row}
                classColor={props.classColor}
                showed={props.showed}
                lootsData={row.playerLoots}
              />
            ))}
          </React.Fragment>
        </TableBody>
      </Table>
    </Paper>
  );
}
