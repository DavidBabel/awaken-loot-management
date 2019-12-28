import React from "react";

import Button from "@material-ui/core/Button";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";

import { ButtonGroup } from "@material-ui/core";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import Link from "next/link";
import ProgressBar from "../../components/summary/ProgressBar";
import { Loot } from "../../lib/generatedTypes";
import { getDayMonth } from "../../lib/utils/date";
import { LootButton } from "./LootButton";
import { PlayerTableRowDatas } from "./PlayersTable";

// CONFIG
const LIMIT_LOOTLEVEL_TO_COUNT = 2;
const ENABLED_LOOT_LEVELS = [4, 3, 2, 1];

const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);

const StyledTableRow = withStyles((theme: Theme) =>
  createStyles({
    root: {
      "&:nth-of-type(odd)": {
        backgroundColor: theme.palette.background.default
      },
      "& .MuiTableCell-body": {
        [theme.breakpoints.down("sm")]: {
          padding: "8px 10px"
        }
      }
    }
  })
)(TableRow);

const useStyles = makeStyles({
  progressCell: {
    width: "200px",
    margin: "auto"
  },
  lootNumbers: {
    display: "flex"
  },
  link: {
    "& button a": { textDecoration: "none", color: "#1976d2" },
    "& button:disabled a": { textDecoration: "none", color: "grey" }
  }
});

interface Props {
  rowData: PlayerTableRowDatas;
  classColor: string;
  showed: boolean;
  openLootWindow: any;
  lootData: Loot[];
}

export default function PlayerTableRow({
  rowData,
  classColor,
  showed,
  openLootWindow,
  lootData
}: Props) {
  const classes = useStyles("");
  const iconElem = React.useRef(null);

  let totalAllLoots = 0;
  let totalBadLoots = 0;
  rowData.totalLootByLevel.forEach((totalLootThisLevel, index) => {
    totalAllLoots += totalLootThisLevel;
    if (index < LIMIT_LOOTLEVEL_TO_COUNT) {
      totalBadLoots += totalLootThisLevel;
    }
  });

  function simpleOpenLootWindow(lootLevel: number | "all") {
    const all = lootLevel === "all";
    const lootDataToKeep = all
      ? lootData
      : lootData.filter(loot => loot.itemByItemId.lootLevel === lootLevel);

    const { top, right } = iconElem.current.getBoundingClientRect();
    return openLootWindow(
      rowData.name,
      lootDataToKeep,
      lootLevel,
      { top, left: right },
      classColor,
      rowData.totalRaid
    );
  }

  return (
    <StyledTableRow>
      <StyledTableCell component="th" scope="row">
        {rowData.name}
      </StyledTableCell>

      <StyledTableCell align="center">
        <div className={classes.lootNumbers} ref={iconElem}>
          {ENABLED_LOOT_LEVELS.map((lootLevel: number) => (
            <LootButton
              key={`lootbutton-${rowData.name}-${lootLevel}`}
              onClick={() => simpleOpenLootWindow(lootLevel)}
              lootLevel={lootLevel}
              lootCount={rowData.totalLootByLevel[lootLevel]}
            />
          ))}
          <LootButton
            onClick={() => simpleOpenLootWindow("all")}
            lootLevel={"all"}
            lootCount={totalAllLoots}
            lootLowLevelCount={totalBadLoots}
          />
        </div>
      </StyledTableCell>
      <StyledTableCell className={classes.progressCell} align="center">
        <ProgressBar
          classColor={classColor}
          progress={rowData.merit}
          showed={showed}
        />
      </StyledTableCell>
      <StyledTableCell align="center">{rowData.totalRaid}</StyledTableCell>
      <StyledTableCell align="center">
        {getDayMonth(rowData.lastLootDate)}
      </StyledTableCell>
      <StyledTableCell align="center">
        {getDayMonth(rowData.lastRaidDate)}
      </StyledTableCell>
      <StyledTableCell align="center" className={classes.link}>
        <ButtonGroup
          size="small"
          color="primary"
          aria-label="outlined primary button group"
        >
          <Button disabled={!rowData.hasPlayerSpe}>
            <Link
              href="/player/specialisation/[id]"
              as={`/player/specialisation/${rowData.playerId}`}
            >
              <a target="_blank">Spé</a>
            </Link>
          </Button>
          <Button>
            <a
              target="_blank"
              href={`https://ironforge.pro/players/Sulfuron/${rowData.name}`}
            >
              Stuff
            </a>
          </Button>
          <Button>
            <a
              target="_blank"
              href={`https://classic.warcraftlogs.com/character/eu/sulfuron/${rowData.name}`}
            >
              Perf
            </a>
          </Button>
          <Button>
            <Link
              href="/player/view/[id]"
              as={`/player/view/${rowData.playerId}`}
            >
              <a target="_blank">Infos</a>
            </Link>
          </Button>
        </ButtonGroup>
      </StyledTableCell>
    </StyledTableRow>
  );
}
