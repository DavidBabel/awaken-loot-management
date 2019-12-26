import React from "react";

import Button from "@material-ui/core/Button";
import IconButton from "@material-ui/core/IconButton";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";

import { ButtonGroup } from "@material-ui/core";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
// import VisibilityIcon from "@material-ui/icons/Visibility";
// import VisibilityOffIcon from "@material-ui/icons/VisibilityOff";
import Link from "next/link";
import ProgressBar from "../../components/summary/ProgressBar";
import { getDayMonth } from "../../lib/utils/date";
import { LootButton } from "./LootButton";
import { PlayerTableRowDatas } from "./PlayersTable";

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
  // to remove
  numberAndEye: {
    border: "1px solid",
    borderRadius: "4px",
    padding: 4,
    margin: 3,
    position: "relative",
    minWidth: "50px",
    backgroundColor: "white"
  },
  // to remove
  viewIcon: {
    // marginLeft: "2px",
    margin: 0,
    padding: 0
  },
  // to remove
  levelDescription: {
    position: "absolute",
    left: "20%",
    top: "-30%",
    width: "60%",
    height: "60%",
    backgroundColor: "white",
    fontSize: "12px"
  },
  // to remove
  allLoot: {
    marginLeft: 15,
    display: "flex",
    alignItems: "center",
    justifyContent: "center"
  },
  // to remove
  badLootPlus: {
    fontSize: "10px",
    alignSelf: "flex-start",
    marginTop: 1,
    zIndex: 5
  },
  // to remove
  allLootColor: { color: "grey", borderColor: "grey" },
  // to remove
  noLoot: { color: "rgba(0,0,0,0.3)", cursor: "auto" },
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
  lootData: any;
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

  function simpleOpenLootWindow(lootLevel: number | "all") {
    const all = lootLevel === "all";
    const lootDataToKeep = all
      ? lootData
      : lootData.filter(loot => loot.itemByItemId.lootLevel === lootLevel);

    const { top, left } = iconElem.current.getBoundingClientRect();
    return openLootWindow(
      rowData.name,
      lootDataToKeep,
      lootLevel,
      { top, left },
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
        <div className={classes.lootNumbers}>
          {[/* 4,  */ 3, 2, 1, "all"].map((lootLevel: number | "all") => (
            <LootButton
              key={`lootbutton-${rowData.name}-${lootLevel}`}
              onClick={() => simpleOpenLootWindow(lootLevel)}
              lootLevel={lootLevel}
              lootCount={rowData.totalLootByLvl[`level${lootLevel}`]}
            />
          ))}
          <div
            className={
              classes.numberAndEye +
              " " +
              classes.allLoot +
              " " +
              classes.allLootColor
            }
          >
            <div className={classes.levelDescription}>All</div>
            <span>{rowData.totalLoot}</span>
            {rowData.totalLootByLvl.level1 ? (
              <span className={classes.badLootPlus}>
                {"+" + rowData.totalLootByLvl.level1}
              </span>
            ) : (
              ""
            )}
            {rowData.totalLoot > 0 ? (
              <IconButton
                ref={iconElem}
                onClick={() => {
                  openLootWindow(
                    rowData.name,
                    lootData,
                    "all",
                    {
                      top: iconElem.current.getBoundingClientRect().top,
                      left: iconElem.current.getBoundingClientRect().left
                    },
                    classColor,
                    rowData.totalRaid
                  );
                }}
                className={classes.viewIcon + " " + classes.allLootColor}
                color="primary"
                aria-label="View loots"
              >
                {/* <VisibilityIcon /> */}
              </IconButton>
            ) : (
              <IconButton
                ref={iconElem}
                className={classes.viewIcon + " " + classes.noLoot}
                color="primary"
                aria-label="View loots"
              >
                {/* <VisibilityOffIcon /> */}
              </IconButton>
            )}
          </div>
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
