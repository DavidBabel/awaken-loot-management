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
import { formatDate } from "../../lib/utils/date";
import { byAlphabet, byDate, byValue } from "../../lib/utils/sorter";
import PlayerTableRow from "./PlayerTableRow";

const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);

export interface PlayerTableRowDatas {
  name: string;
  merit: number;
  totalLoot: number;
  totalLootByLvl: LootsByLvl;
  totalRaid: number;
  lastLootDate: string;
  lastRaidDate: string;
  playerId: number;
  playerLoots: any;
  hasPlayerSpe: boolean;
}

interface Props {
  showed: boolean;
  classColor: string;
  players: Player[];
  maxMeritValue: number;
  openLootWindow: any;
}
interface LootsByLvl {
  level1: number;
  level2: number;
  level3: number;
}
const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",
    height: "100%",
    [theme.breakpoints.down("sm")]: {
      height: "calc(100vh - 130px)"
    },
    marginTop: "10px",
    overflowX: "auto",
    "& .MuiTableCell-head": {
      backgroundColor: (props: Props) => `${props.classColor}`,
      color: "black"
    }
  },
  tableWrapper: {
    maxHeight: "calc(100vh - 200px)",
    [theme.breakpoints.down("sm")]: {
      maxHeight: "calc(100vh - 130px)"
    },
    overflow: "auto"
  },
  table: {
    minWidth: 700
  },
  headButton: {
    fontSize: "12px"
  },
  shown: {
    opacity: 1
  },
  hidden: {
    opacity: 0
  }
}));

type ColumnName =
  | "Pseudo"
  | "Merites"
  | "Total Loot"
  | "Total raids"
  | "Last loot"
  | "Last raid";

export default function PlayersTable(props: Props) {
  const classes = useStyles(props);

  const rowsData = props.players.map(
    (player: Player): PlayerTableRowDatas => {
      let maxMerit = 0;
      let totalLootLevel1 = 0;
      let totalLootLevel2 = 0;
      let totalLootLevel3 = 0;
      // let totalLootLevel4 = 0;
      let totalLoot = 0;
      const totalRaid = [...player.raidPlayersByPlayerId.nodes].filter(
        raid => !raid.passed
      ).length;
      player.playerMeritsByPlayerId.nodes.forEach(merit => {
        if (merit.validated) {
          maxMerit += merit.meritByMeritId.value;
        }
      });
      player.lootsByPlayerId.nodes.forEach(loot => {
        if (loot.active) {
          if (loot.itemByItemId.lootLevel === 1) {
            totalLootLevel1 += 1;
          } else if (loot.itemByItemId.lootLevel === 2) {
            totalLootLevel2 += 1;
          } else if (loot.itemByItemId.lootLevel === 3) {
            totalLootLevel3 += 1;
          }
        }
      });
      totalLoot = totalLootLevel3 + totalLootLevel2;
      let lastRaidDate = new Date("2010-01-01"); // je pars d'une date reculée
      if (totalRaid === 0) {
        lastRaidDate = null;
      } else {
        [...player.raidPlayersByPlayerId.nodes]
          .filter(raid => !raid.passed)
          .forEach(raid => {
            const currentRaidDate = new Date(raid.raidByRaidId.date);
            if (currentRaidDate > lastRaidDate) {
              lastRaidDate = currentRaidDate;
            }
          });
      }

      let lastLootDate = new Date("2010-01-01"); // je pars d'une date reculée
      player.lootsByPlayerId.nodes.forEach(loot => {
        if (loot.itemByItemId.lootLevel !== 1 && loot.active) {
          const currentLootDate = new Date(loot.raidByRaidId.date);
          if (currentLootDate > lastLootDate) {
            lastLootDate = currentLootDate;
          }
        }
      });
      if (lastLootDate === new Date("2010-01-01")) {
        lastLootDate = null;
      }

      // const dateOptions = {
      //   year: "numeric",
      //   month: "long",
      //   day: "numeric"
      // };
      return {
        name: player.name,
        merit: Math.round((maxMerit * 100) / props.maxMeritValue),
        totalLoot,
        totalLootByLvl: {
          level1: totalLootLevel1,
          level2: totalLootLevel2,
          level3: totalLootLevel3
        },
        totalRaid,
        lastLootDate: lastLootDate ? formatDate(lastLootDate) : "Aucun",
        lastRaidDate: lastRaidDate ? formatDate(lastRaidDate) : "Aucun",
        playerId: player.id,
        hasPlayerSpe: Boolean(player.specialisation),
        playerLoots: [...player.lootsByPlayerId.nodes]
          .sort((a: any, b: any) => {
            if (new Date(a.raidByRaidId.date) > new Date(b.raidByRaidId.date)) {
              return -1;
            }
            if (new Date(b.raidByRaidId.date) > new Date(a.raidByRaidId.date)) {
              return 1;
            }
            return 0;
          })
          .filter(loot => loot.active)
      };
    }
  );
  rowsData.sort((a, b) => b.merit - a.merit);
  const [rows, setRows] = React.useState(rowsData);
  const [orderedBy, setOrderedBy] = React.useState<ColumnName>("Total Loot");
  const [orderedDESC, setOrderedDESC] = React.useState(true);

  function orderBy(colName: ColumnName) {
    const newRows = [...rows];
    let currentlyOrderedDesc = orderedDESC;
    if (colName === orderedBy) {
      currentlyOrderedDesc = !orderedDESC;
    }
    if (colName === "Merites") {
      newRows.sort(byValue("merit", currentlyOrderedDesc));
    } else if (colName === "Total raids") {
      newRows.sort(byValue("totalRaid", currentlyOrderedDesc));
    } else if (colName === "Total Loot") {
      newRows.sort(byValue("totalLoot", currentlyOrderedDesc));
    } else if (colName === "Pseudo") {
      newRows.sort(byAlphabet("name", currentlyOrderedDesc));
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
      <KeyboardArrowUpIcon
        className={orderedBy === columnName ? classes.shown : classes.hidden}
      />
    ) : (
      <KeyboardArrowDownIcon
        className={orderedBy === columnName ? classes.shown : classes.hidden}
      />
    );
  }
  React.useEffect(() => {
    orderBy("Total Loot");
  }, []);
  return (
    <Paper className={classes.root}>
      <div className={classes.tableWrapper}>
        <Table className={classes.table} stickyHeader={true}>
          <TableHead>
            <TableRow>
              {[
                "Pseudo",
                "Total Loot",
                "Merites",
                "Total raids",
                "Last loot",
                "Last raid",
                "Infos"
              ].map((columnName: ColumnName, index: number) => (
                <StyledTableCell key={"col" + index + columnName}>
                  <Button
                    className={classes.headButton}
                    variant={"text"}
                    onClick={() => {
                      orderBy(columnName);
                    }}
                  >
                    {columnName}
                    {sortArrow(columnName)}
                  </Button>
                </StyledTableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableBody>
            <>
              {rows.map((row: PlayerTableRowDatas) => (
                <PlayerTableRow
                  key={`player-table-${row.name}`}
                  rowData={row}
                  classColor={props.classColor}
                  showed={props.showed}
                  lootData={row.playerLoots}
                  openLootWindow={props.openLootWindow}
                />
              ))}
            </>
          </TableBody>
        </Table>
      </div>
    </Paper>
  );
}
