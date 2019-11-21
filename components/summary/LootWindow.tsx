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
import React from "react";
import { useEffect } from "react";
import { Loot } from "../../lib/generatedTypes";

declare global {
  interface Window {
    $WowheadPower: any;
  }
}

interface ElementPosition {
  top: number;
  left: number;
}
interface Props {
  key: string;
  playerName: string;
  lootData: Loot;
  lootLvl: number | "all";
  iconClientPos: ElementPosition;
  classColor: string;
  totalRaid: number;
  closeLootWindow(playerName: string, lootLvl: number): any;
}

const useStyles = makeStyles({
  root: {
    position: "absolute",
    backgroundColor: "#E6E8EB",
    borderRadius: "4px",
    border: "solid 2px",
    boxShadow: "2px 2px 15px -1px rgba(0,0,0,0.75)",
    zIndex: 10000,
    "& .MuiTableCell-head": {
      backgroundColor: "white"
    }
  },
  tableWrapper: {
    maxHeight: 300,
    overflow: "auto",
    "& a": {
      textDecoration: "none"
    },
    "& a span": {
      margin: "0px 5px 0px 0px"
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
    right: "2px",
    cursor: "pointer",
    backgroundColor: "#E6E8EB",
    height: "24px",
    borderRadius: "50%",
    "& :hover": {
      color: "#bf1313"
    }
  },
  raidButtonCell: {
    "& a": {
      textDecoration: "none"
    },
    "& .MuiSvgIcon-root": {
      marginLeft: "5px"
    }
  },
  wowHeadItem: {
    position: "relative",
    "& span:nth-child(1)": { marginLeft: 20 }
  },
  pastilleLootLvl: {
    position: "absolute",
    width: 12,
    height: 12,
    left: "12px",
    top: 0,
    bottom: 0,
    margin: "auto",
    borderRadius: "50%",
    border: "4px solid",
    zIndex: 1
  },
  epic: { backgroundColor: "a335ee!important", borderColor: "#a335ee" },
  rare: { borderColor: "#0070dd!important", backgroundColor: "0070dd" },
  commun: { borderColor: "#1ad900!important", backgroundColor: "1ad900" },
  allLoot: { borderColor: "grey" }
});
export default function LootWindow(props) {
  const classes = useStyles(props);
  const {
    closeLootWindow,
    playerName,
    lootLvl,
    iconClientPos,
    lootData,
    totalRaid
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
    makeDraggable(lootWindowElem.current);
    lootWindowElem.current.style.top = iconClientPos.top + "px";
    lootWindowElem.current.style.left = iconClientPos.left + 50 + "px";
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
  useEffect(() => {
    if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
      try {
        window.$WowheadPower.refreshLinks();
      } catch (e) {}
    }
  });
  return (
    <div
      className={
        classes.root +
        " " +
        (lootLvl === 1
          ? classes.commun
          : lootLvl === 2
          ? classes.rare
          : lootLvl === 3
          ? classes.epic
          : classes.allLoot)
      }
      ref={lootWindowElem}
    >
      <div className={classes.header} ref={headerElem}>
        {`${playerName.toUpperCase()} (${
          lootLvl === 1
            ? "Qualité: médriocre"
            : lootLvl === 2
            ? "Qualité: normale"
            : lootLvl === 3
            ? "Qualité: haute"
            : "Tous les loots"
        }) - Total Raid: ${totalRaid}`}
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
                      classes.root +
                      " " +
                      (loot.itemByItemId.lootLevel === 1
                        ? classes.commun
                        : loot.itemByItemId.lootLevel === 2
                        ? classes.rare
                        : loot.itemByItemId.lootLevel === 3
                        ? classes.epic
                        : classes.allLoot)
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
                      <Button variant="contained" color="primary">
                        {loot.raidByRaidId.date}
                        <VisibilityIcon />
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
