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
import React, { useContext } from "react";
import MemberContext from "../../lib/context/member";
import { Loot, Player } from "../../lib/generatedTypes";
import { role } from "../../lib/role-level";
import { formatDate } from "../../lib/utils/date";
import { byAlphabet, byDate, byValue } from "../../lib/utils/sorter";
import PlayerTableRow, { LIMIT_LOOTLEVEL_TO_COUNT } from "./PlayerTableRow";

export const TABLE_SMALL_CASES = [false, false, false, true, true, true, true];

const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);

export interface PlayerTableRowDatas {
  name: string;
  rerollOf: string;
  isHybrid: boolean;
  className: string;
  merit: number;
  totalCountableLoot: number;
  lootPerRaid: number;
  totalLootByLevel: number[];
  totalRaid: number;
  lastLootDate: string;
  lastRaidDate: string;
  playerId: number;
  playerLoots: Loot[];
  hasPlayerSpe: boolean;
}

interface Props {
  shouldHideReroll: boolean;
  showed: boolean;
  classColor: string;
  players: Player[];
  maxMeritValue: number;
  openLootWindow: any;
}

const useStyles = makeStyles(theme => {
  const arrowIcon = {
    marginLeft: -3,
    marginRight: -5,
    width: 20,
    height: 20
  };
  return {
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
      opacity: 1,
      ...arrowIcon
    },
    hidden: {
      opacity: 0,
      ...arrowIcon
    }
  };
});

type ColumnName =
  | "Pseudo"
  | "Total Loot"
  | "Merites"
  | "Total raids"
  | "%Loot/raid"
  | "Last loot"
  | "Last raid"
  | "Infos";

export default function PlayersTable(props: Props) {
  const classes = useStyles(props);
  const member = useContext(MemberContext);

  const columns: ColumnName[] = [
    "Pseudo",
    "Total Loot",
    "Merites",
    "Total raids",
    "Last loot",
    "Last raid",
    "Infos"
  ];
  if (member.level >= role.class_master) {
    columns.splice(4, 0, "%Loot/raid");
  }

  const rowsData = props.players.map(
    (player: Player): PlayerTableRowDatas => {
      let maxMerit = 0;
      let totalCountableLoot = 0;
      const totalLootByLevel = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
      const alreadyLooted: number[] = [];

      const totalRaid = [...player.raidPlayersByPlayerId.nodes].filter(
        raid => !raid.passed
      ).length;
      player.playerMeritsByPlayerId.nodes.forEach(merit => {
        if (merit.validated) {
          maxMerit += merit.meritByMeritId.value;
        }
      });

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
        if (loot.active) {
          const item = loot.itemByItemId;
          if (!alreadyLooted.includes(item.id)) {
            alreadyLooted.push(item.id);
            const currentLootLevel = loot.itemByItemId.lootLevel;
            totalLootByLevel[currentLootLevel] += 1;
            if (currentLootLevel >= LIMIT_LOOTLEVEL_TO_COUNT) {
              totalCountableLoot += 1;
            }
          }
          if (loot.itemByItemId.lootLevel !== 1) {
            const currentLootDate = new Date(loot.raidByRaidId.date);
            if (currentLootDate > lastLootDate) {
              lastLootDate = currentLootDate;
            }
          }
        }
      });

      if (lastLootDate === new Date("2010-01-01")) {
        lastLootDate = null;
      }

      return {
        name: player.name,
        rerollOf: player.rerollOf,
        isHybrid: player.classByClassId.id > 10,
        className: player.classByClassId.name,
        merit: Math.round((maxMerit * 100) / props.maxMeritValue),
        totalCountableLoot,
        totalLootByLevel,
        lootPerRaid:
          totalRaid > 0
            ? Math.round((totalCountableLoot / totalRaid) * 100)
            : 0,
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
    switch (colName) {
      case "Merites":
        newRows.sort(byValue("merit", currentlyOrderedDesc));
        break;
      case "Total raids":
        newRows.sort(byValue("totalRaid", currentlyOrderedDesc));
        break;
      case "%Loot/raid":
        newRows.sort(byValue("lootPerRaid", currentlyOrderedDesc));
        break;
      case "Total Loot":
        newRows.sort(byValue("totalCountableLoot", currentlyOrderedDesc));
        break;
      case "Pseudo":
        newRows.sort(byAlphabet("name", currentlyOrderedDesc));
        break;
      case "Last loot":
        newRows.sort(byDate("lastLootDate", currentlyOrderedDesc));
        break;
      case "Last raid":
        newRows.sort(byDate("lastRaidDate", currentlyOrderedDesc));
        break;
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
    const classArrow =
      orderedBy === columnName ? classes.shown : classes.hidden;

    return orderedBy === columnName && orderedDESC ? (
      <KeyboardArrowUpIcon className={classArrow} />
    ) : (
      <KeyboardArrowDownIcon className={classArrow} />
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
              {columns.map((columnName: ColumnName, index: number) => (
                <StyledTableCell
                  key={"summary-col" + index + columnName}
                  padding={TABLE_SMALL_CASES[index] ? "none" : "default"}
                  // style={TABLE_SMALL_CASES[index] ? { fontSize: '4px !important' } : {}}
                >
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
              {rows
                .filter(p => {
                  if (p.rerollOf && props.shouldHideReroll) {
                    return false;
                  }
                  return true;
                })
                .map((row: PlayerTableRowDatas) => (
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
