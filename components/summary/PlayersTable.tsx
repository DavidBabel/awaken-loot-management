import React from "react";

import {
  Button,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow
} from "@material-ui/core";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";
import KeyboardArrowDownIcon from "@material-ui/icons/KeyboardArrowDown";
import KeyboardArrowUpIcon from "@material-ui/icons/KeyboardArrowUp";
import { Player } from "../../lib/generatedTypes";
import { byDate, byValue } from "../../lib/utils/sorter";
import PlayerTableRow from "./PlayerTableRow";

const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);

interface Props {
  showed: boolean;
  classColor: string;
  players: Player[];
  maxMeritValue: number;
  openLootWindow: any;
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

type ColumnName =
  | "Pseudo"
  | "Merit"
  | "Total Loot"
  | "Total raid"
  | "Last loot"
  | "Last raid";

export default function PlayersTable(props: Props) {
  const classes = useStyles(props);

  const rowsData = props.players.map((player: Player) => {
    let maxMerit = 0;
    let totalLoot = 0;
    const totalRaid = player.raidPlayersByPlayerId.nodes.length;
    player.playerMeritsByPlayerId.nodes.map(merit => {
      if (merit.validated) {
        maxMerit += merit.meritByMeritId.value;
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
    const dateOptions = {
      year: "numeric",
      month: "long",
      day: "numeric"
    };
    return createData(
      player.name,
      Math.round((maxMerit * 100) / props.maxMeritValue),
      totalLoot,
      totalRaid,
      lastLootDate
        ? lastLootDate.toLocaleDateString("en-EN", dateOptions)
        : "Aucun",
      lastRaidDate
        ? lastRaidDate.toLocaleDateString("en-EN", dateOptions)
        : "Aucun",
      player.id,
      [...player.lootsByPlayerId.nodes].sort((a: any, b: any) => {
        if (new Date(a.raidByRaidId.date) > new Date(b.raidByRaidId.date)) {
          return -1;
        }
        if (new Date(b.raidByRaidId.date) > new Date(a.raidByRaidId.date)) {
          return 1;
        }
        return 0;
      })
    );
  });
  rowsData.sort((a, b) => b.merit - a.merit);
  const [rows, setRows] = React.useState(rowsData);
  const [orderedBy, setOrderedBy] = React.useState<ColumnName>("Merit");
  const [orderedDESC, setOrderedDESC] = React.useState(false);

  function orderBy(colName: ColumnName) {
    const newRows = [...rows];
    let currentlyOrderedDesc = orderedDESC;
    if (colName === orderedBy) {
      currentlyOrderedDesc = !orderedDESC;
    }
    if (colName === "Merit") {
      newRows.sort(byValue("merit", currentlyOrderedDesc));
    } else if (colName === "Total raid") {
      newRows.sort(byValue("totalRaid", currentlyOrderedDesc));
    } else if (colName === "Total Loot") {
      newRows.sort(byValue("totalLoot", currentlyOrderedDesc));
    } else if (colName === "Pseudo") {
      newRows.sort((a, b) => {
        if (a.name > b.name) {
          return currentlyOrderedDesc ? -1 : 1;
        }
        if (b.name > a.name) {
          return currentlyOrderedDesc ? 1 : -1;
        }
        return 0;
      });
    } else if (colName === "Last loot") {
      newRows.sort(byDate("lastLootDate", currentlyOrderedDesc));
    } else if (colName === "Last raid") {
      newRows.sort(byDate("lastRaidDate", currentlyOrderedDesc));
    }
    if (colName === orderedBy) {
      setOrderedDESC(prevState => !prevState);
    }
    setOrderedBy(colName);
    setRows(newRows);
  }

  function sortArrow(columnName: string) {
    if (!columnName) {
      return "";
    }
    return orderedBy === columnName && orderedDESC ? (
      <KeyboardArrowUpIcon />
    ) : (
      <KeyboardArrowDownIcon />
    );
  }

  return (
    <Paper className={classes.root}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            {[
              "Pseudo",
              "Merit",
              "Total Loot",
              "Total raid",
              "Last loot",
              "Last raid",
              ""
            ].map((columnName: ColumnName) => (
              <StyledTableCell key={columnName} align="center">
                {" "}
                <Button
                  className={classes.headButton}
                  variant={"text"}
                  onClick={() => {
                    orderBy(columnName);
                  }}>
                  {columnName}
                  {sortArrow(columnName)}
                </Button>
              </StyledTableCell>
            ))}
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
                lootData={row.playerLoots}
                openLootWindow={props.openLootWindow}
              />
            ))}
          </React.Fragment>
        </TableBody>
      </Table>
    </Paper>
  );
}
