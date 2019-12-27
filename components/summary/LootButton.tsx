import React from "react";

import { IconButton } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import cn from "classnames";

const useStyles = makeStyles(
  {
    number: {
      border: "1px solid",
      borderRadius: "4px",
      padding: 4,
      margin: 3,
      position: "relative",
      minWidth: "50px",
      backgroundColor: "white"
    },
    levelDescription: {
      // position: "absolute",
      // left: "20%",
      // top: "-30%",
      // width: "60%",
      // height: "60%",
      // backgroundColor: "white",
      // fontSize: "12px"
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
  },
  { name: "LootButton" }
);

interface Props {
  lootLevel: number | "all";
  lootCount: number;
  lootLowLevelCount: number;
  onClick: () => void;
}

export function LootButton({
  lootCount,
  lootLowLevelCount,
  lootLevel,
  onClick
}: Props) {
  const classes = useStyles("");
  const hasLoots = lootCount > 0;
  const isAllLoot = lootLevel === "all";

  return (
    <div
      className={cn({
        ["LootButton-number"]: true,
        ["LootButton-allLoot"]: isAllLoot,
        ["LootButton-allLootColor"]: isAllLoot,
        ["LootButton-noLoot"]: !hasLoots,
        [`LootButton-level${lootLevel}`]: hasLoots
      })}
    >
      {isAllLoot && (
        <>
          <div className={classes.levelDescription}>All</div>
          <span>{lootCount - lootLowLevelCount}</span>
          {lootLowLevelCount > 0 && (
            <span className={classes.badLootPlus}>
              {"+" + lootLowLevelCount}
            </span>
          )}
        </>
      )}

      <IconButton
        onClick={() => {
          if (hasLoots) {
            onClick();
          }
        }}
        className={cn({
          ["LootButton-noLoot"]: !hasLoots,
          [`LootButton-level${lootLevel}`]: hasLoots
        })}
        color="primary"
        aria-label="View loots"
      >
        {lootCount}
      </IconButton>
    </div>
  );
}
