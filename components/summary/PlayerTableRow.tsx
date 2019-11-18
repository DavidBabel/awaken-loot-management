import Button from "@material-ui/core/Button";
import IconButton from "@material-ui/core/IconButton";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";

import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import VisibilityIcon from "@material-ui/icons/Visibility";
import VisibilityOffIcon from "@material-ui/icons/VisibilityOff";
import Link from "next/link";
import React from "react";
import ProgressBar from "../../components/summary/ProgressBar";
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
  numberAndEye: {
    border: "1px solid",
    borderRadius: "4px",
    padding: 4,
    margin: 3,
    position: "relative",
    minWidth: "50px",
    backgroundColor: "white"
  },
  viewIcon: {
    marginLeft: "2px",
    padding: 0
  },
  levelDescription: {
    position: "absolute",
    left: "20%",
    top: "-30%",
    width: "60%",
    height: "60%",
    backgroundColor: "white",
    fontSize: "12px"
  },
  allLoot: {
    marginLeft: 15,
    display: "flex",
    alignItems: "center",
    justifyContent: "center"
  },
  badLootPlus: {
    fontSize: "10px",
    alignSelf: "flex-start",
    marginTop: 1,
    zIndex: 5
  },
  epic: { color: "#a335ee", borderColor: "#a335ee" },
  rare: { color: "#0070dd", borderColor: "#0070dd" },
  commun: { color: "#1ad900", borderColor: "#1ad900" },
  allLootColor: { color: "grey", borderColor: "grey" },
  noLoot: { color: "rgba(0,0,0,0.3)", cursor: "auto" },
  link: { "& a": { textDecoration: "none", color: "white" } }
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
  return (
    <StyledTableRow>
      <StyledTableCell component="th" scope="row">
        {rowData.name}
      </StyledTableCell>
      {false && (
        <StyledTableCell className={classes.progressCell} align="center">
          <ProgressBar
            classColor={classColor}
            progress={rowData.merit}
            showed={showed}
          />
        </StyledTableCell>
      )}
      <StyledTableCell align="center">
        <div className={classes.lootNumbers}>
          <div className={classes.numberAndEye + " " + classes.epic}>
            {rowData.totalLootByLvl.level3}
            {rowData.totalLootByLvl.level3 > 0 ? (
              <IconButton
                ref={iconElem}
                onClick={() => {
                  openLootWindow(
                    rowData.name,
                    lootData.filter(loot => loot.itemByItemId.lootLevel === 3),
                    3,
                    {
                      top: iconElem.current.getBoundingClientRect().top,
                      left: iconElem.current.getBoundingClientRect().left
                    },
                    classColor
                  );
                }}
                className={classes.viewIcon + " " + classes.epic}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityIcon />
              </IconButton>
            ) : (
              <IconButton
                ref={iconElem}
                className={classes.viewIcon + " " + classes.noLoot}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityOffIcon />
              </IconButton>
            )}
          </div>
          <div className={classes.numberAndEye + " " + classes.rare}>
            {rowData.totalLootByLvl.level2}
            {rowData.totalLootByLvl.level2 > 0 ? (
              <IconButton
                ref={iconElem}
                onClick={() => {
                  openLootWindow(
                    rowData.name,
                    lootData.filter(loot => loot.itemByItemId.lootLevel === 2),
                    2,
                    {
                      top: iconElem.current.getBoundingClientRect().top,
                      left: iconElem.current.getBoundingClientRect().left
                    },
                    classColor
                  );
                }}
                className={classes.viewIcon + " " + classes.rare}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityIcon />
              </IconButton>
            ) : (
              <IconButton
                ref={iconElem}
                className={classes.viewIcon + " " + classes.noLoot}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityOffIcon />
              </IconButton>
            )}
          </div>
          <div className={classes.numberAndEye + " " + classes.commun}>
            {rowData.totalLootByLvl.level1}
            {rowData.totalLootByLvl.level1 > 0 ? (
              <IconButton
                ref={iconElem}
                onClick={() => {
                  openLootWindow(
                    rowData.name,
                    lootData.filter(loot => loot.itemByItemId.lootLevel === 1),
                    1,
                    {
                      top: iconElem.current.getBoundingClientRect().top,
                      left: iconElem.current.getBoundingClientRect().left
                    },
                    classColor
                  );
                }}
                className={classes.viewIcon + " " + classes.commun}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityIcon />
              </IconButton>
            ) : (
              <IconButton
                ref={iconElem}
                className={classes.viewIcon + " " + classes.noLoot}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityOffIcon />
              </IconButton>
            )}
          </div>
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
                    classColor
                  );
                }}
                className={classes.viewIcon + " " + classes.allLootColor}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityIcon />
              </IconButton>
            ) : (
              <IconButton
                ref={iconElem}
                className={classes.viewIcon + " " + classes.noLoot}
                color="primary"
                aria-label="View loots"
              >
                <VisibilityOffIcon />
              </IconButton>
            )}
          </div>
        </div>
      </StyledTableCell>
      <StyledTableCell align="center">{rowData.totalRaid}</StyledTableCell>
      <StyledTableCell align="center">{rowData.lastLootDate}</StyledTableCell>
      <StyledTableCell align="center">{rowData.lastRaidDate}</StyledTableCell>
      <StyledTableCell align="center" className={classes.link}>
        <Link href="/player/view/[id]" as={`/player/view/${rowData.playerId}`}>
          <a target="_blank">
            <Button variant="contained" color="primary">
              Details
            </Button>
          </a>
        </Link>
      </StyledTableCell>
      <StyledTableCell align="center" className={classes.link}>
        <Link href={`https://ironforge.pro/players/Sulfuron/${rowData.name}/`}>
          <a target="_blank">
            <Button variant="contained" color="primary">
              Stuff
            </Button>
          </a>
        </Link>
      </StyledTableCell>
    </StyledTableRow>
  );
}
