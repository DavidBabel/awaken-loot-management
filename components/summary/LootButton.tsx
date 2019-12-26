import React from "react";

import { IconButton } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles({
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
    // marginLeft: "2px",
    margin: 0,
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
  level3: { fontSize: 16, color: "white", backgroundColor: "#a335ee" },
  level2: { fontSize: 16, color: "white", backgroundColor: "#0070dd" },
  level1: { fontSize: 16, color: "white", backgroundColor: "#1ad900" },
  levelall: { fontSize: 16, color: "grey", backgroundColor: "grey" },
  // allLootColor: { color: "grey", borderColor: "grey" },
  noLoot: { fontSize: 16, color: "rgba(0,0,0,0.3)", cursor: "auto" },
  link: {
    "& button a": { textDecoration: "none", color: "#1976d2" },
    "& button:disabled a": { textDecoration: "none", color: "grey" }
  }
});

interface Props {
  lootLevel: number | "all";
  lootCount: number;
  onClick: () => void;
}

export function LootButton({ lootCount, lootLevel, onClick }: Props) {
  const classes = useStyles("");
  const hasLoots = lootCount > 0;
  const color = hasLoots ? classes[`level${lootLevel}`] : classes.noLoot;

  return (
    <div className={classes.numberAndEye + " " + color}>
      <IconButton
        onClick={() => {
          if (hasLoots) {
            onClick();
          }
        }}
        className={classes.viewIcon + " " + color}
        color="primary"
        aria-label="View loots"
      >
        {lootCount}
      </IconButton>
    </div>
  );
}
