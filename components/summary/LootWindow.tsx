import Button from "@material-ui/core/Button";
import { makeStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import CloseIcon from "@material-ui/icons/Close";
import VisibilityIcon from "@material-ui/icons/Visibility";
import Link from "next/link";
import React, { useEffect } from "react";
import { Loot } from "../../lib/generatedTypes";
import { getDurationBetween } from "../../lib/utils/date";
import {
  lootColorLevel1,
  lootColorLevel2,
  lootColorLevel3,
  lootColorLevel4,
  lootColorLevel5,
  lootColorLevel6
} from "../../lib/utils/loot-colors";
import { refreshWowhead } from "../../lib/utils/wowhead-refresh";

interface ElementPosition {
  top: number;
  left: number;
}

export interface LootWindowProps {
  playerName: string;
  lootData: Loot[];
  lootLvl: number | "all";
  iconClientPos: ElementPosition;
  classColor: string;
  totalRaid: number;
}
interface Props extends LootWindowProps {
  onMobile: boolean;
  closeLootWindow: (playerName: string, lootLvl: number | "all") => void;
}

const useStyles = makeStyles({
  root: {
    position: "absolute",
    top: "0px",
    left: "0px",
    width: (props: Props) => (props.onMobile ? "100%" : "auto"),
    height: (props: Props) => (props.onMobile ? "100%" : "auto"),
    backgroundColor: "#E6E8EB",
    border: "solid 2px",
    boxShadow: "2px 2px 15px -1px rgba(0,0,0,0.75)",
    zIndex: 10000,
    "& .MuiTableCell-head": {
      backgroundColor: "white"
    }
  },
  tableWrapper: {
    maxHeight: (props: Props) => (props.onMobile ? "100vh" : 300),
    overflow: "auto",
    "& a": {
      textDecoration: "none"
    },
    "& a span": {
      margin: "0px 15px 0px 0px"
    }
  },
  header: {
    position: "relative",
    backgroundColor: (props: Props) => props.classColor,
    color: "#4D4D4D",
    fontWeight: "bold",
    width: "100%",
    textAlign: "center",
    height: "30px",
    lineHeight: "30px",
    cursor: "move",
    borderRadius: "1px 1px 0px 0px"
  },
  cross: {
    position: "absolute",
    top: "2px",
    left: "2px",
    cursor: "pointer",
    backgroundColor: "#E6E8EB",
    height: "24px",
    borderRadius: "50%",
    "& :hover": {
      color: "#bf1313"
    }
  },

  raidButtonCell: {
    "& *": { textAlign: "center", margin: "0px!important" },
    padding: "5px!important",

    "& span": {
      textTransform: "none",
      whiteSpace: "nowrap",
      fontSize: (props: Props) => (props.onMobile ? 12 : 14)
    },
    "& a": {
      textDecoration: "none"
    },
    "& .MuiSvgIcon-root": {
      marginLeft: "5px",
      fontSize: 18
    }
  },
  wowHeadItem: {
    position: "relative",
    padding: 0,
    "& a": {
      display: (props: Props) => (props.onMobile ? "flex" : "auto"),
      alignItems: "center"
    },
    "& span:nth-child(1)": {
      marginLeft: 20
    },
    "& span:nth-child(2)": {
      paddingLeft: (props: Props) => (props.onMobile ? 10 : 0),
      width: "100%"
    }
  },
  pastilleLootLvl: {
    position: "absolute",
    width: "12px",
    height: 12,
    left: "5px",
    top: 0,
    bottom: 0,
    margin: "auto",
    borderRadius: "50%",
    border: "4px solid",
    zIndex: 1
  },
  lootlevel6: { borderColor: lootColorLevel6 },
  lootlevel5: { borderColor: lootColorLevel5 },
  lootlevel4: { borderColor: lootColorLevel4 },
  lootlevel3: { borderColor: lootColorLevel3 },
  lootlevel2: { borderColor: lootColorLevel2 },
  lootlevel1: { borderColor: lootColorLevel1 },
  allLoot: { borderColor: "grey" }
});
export default function LootWindow(props: Props) {
  const classes = useStyles(props);
  const {
    closeLootWindow,
    playerName,
    lootLvl,
    iconClientPos,
    lootData,
    totalRaid,
    onMobile
  } = props;
  const lootWindowElem = React.useRef(null);
  const headerElem = React.useRef(null);

  function makeDraggable(elem: HTMLElement) {
    let pos1 = 0;
    let pos2 = 0;
    let pos3 = 0;
    let pos4 = 0;
    headerElem.current.onmousedown = dragMouseDown;
    function dragMouseDown(e: MouseEvent) {
      e.preventDefault();
      pos3 = e.clientX;
      pos4 = e.clientY;
      document.onmouseup = closeDragElement;
      document.onmousemove = elementDrag;
    }

    function elementDrag(e: MouseEvent) {
      e.preventDefault();
      pos1 = pos3 - e.clientX;
      pos2 = pos4 - e.clientY;
      pos3 = e.clientX;
      pos4 = e.clientY;
      elem.style.top = elem.offsetTop - pos2 + "px";
      elem.style.left = elem.offsetLeft - pos1 + "px";
    }

    function closeDragElement() {
      document.onmouseup = null;
      document.onmousemove = null;
    }
  }
  function closeWindow() {
    if (lootWindowElem.current.animate) {
      lootWindowElem.current.animate(
        [
          { transform: "scale(1)", opacity: 1 },
          { transform: "scale(0.1)", opacity: 0 }
        ],
        {
          duration: 250,
          iterations: 1,
          easing: "ease-out",
          fill: "both"
        }
      );
      setTimeout(() => {
        closeLootWindow(playerName, lootLvl);
      }, 250);
    } else {
      closeLootWindow(playerName, lootLvl);
    }
  }

  useEffect(() => {
    if (!onMobile) {
      makeDraggable(lootWindowElem.current);
      lootWindowElem.current.style.top = iconClientPos.top + "px";
      lootWindowElem.current.style.left = iconClientPos.left + 50 + "px";
    }
    if (lootWindowElem.current.animate) {
      lootWindowElem.current.animate(
        [
          { transform: "scale(0.1)", opacity: 0 },
          { transform: "scale(1)", opacity: 1 }
        ],
        {
          duration: 250,
          iterations: 1,
          easing: "ease-out",
          fill: "both"
        }
      );
    }
  }, []);
  useEffect(refreshWowhead);

  function getLootLevelLabel(lootLevel: number | "all") {
    let lootLevelLabel = "médiocre";

    switch (lootLevel) {
      case "all":
        return "Tous les loots";
        break;
      case 2:
        lootLevelLabel = "normale";
        break;
      case 3:
        lootLevelLabel = "haute";
        break;
      case 4:
        lootLevelLabel = "très haute";
        break;
      case 5:
        lootLevelLabel = "exceptionnelle";
        break;
      case 6:
        lootLevelLabel = "endgame rare";
        break;
    }

    return "Qualité: " + lootLevelLabel;
  }

  return (
    <div
      className={classes.root + " " + classes[`lootlevel${lootLvl}`]}
      ref={lootWindowElem}
    >
      <div className={classes.header} ref={headerElem}>
        {`${playerName.toUpperCase()} (${getLootLevelLabel(
          lootLvl
        )}) - Total Raid: ${totalRaid}`}
        <div className={classes.cross} onClick={closeWindow}>
          <CloseIcon color="primary" />
        </div>
      </div>
      <div className={classes.tableWrapper}>
        <Table size="small" stickyHeader={true} aria-label="sticky table">
          <TableHead>
            <TableRow>
              <TableCell>Item</TableCell>
              <TableCell>Raid</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {lootData.map(loot => (
              <TableRow
                key={
                  "lootedItem" +
                  loot.raidByRaidId.date +
                  loot.itemByItemId.wowheadId
                }
              >
                <TableCell className={classes.wowHeadItem}>
                  <div
                    className={
                      classes.pastilleLootLvl +
                      " " +
                      classes[`lootlevel${loot.itemByItemId.lootLevel}`]
                    }
                  />
                  <a
                    onClick={e => {
                      e.preventDefault();
                    }}
                    href={`https://fr.classic.wowhead.com/item=${loot.itemByItemId.wowheadId}`}
                  >
                    {loot.itemByItemId.name}
                  </a>
                </TableCell>
                <TableCell className={classes.raidButtonCell}>
                  <Link
                    href="/raid/edit/[id]"
                    as={`/raid/edit/${loot.raidByRaidId.id}`}
                  >
                    <a target="_blank">
                      <Button variant="outlined" color="primary">
                        {`Il y a ${getDurationBetween(
                          new Date().toString(),
                          loot.raidByRaidId.date
                        )} jours`}
                        {!onMobile && <VisibilityIcon />}
                      </Button>
                    </a>
                  </Link>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
