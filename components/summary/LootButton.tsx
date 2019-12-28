import React from "react";

// import { IconButton } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import cn from "classnames";
import {
  lootColorLevel1,
  lootColorLevel2,
  lootColorLevel3,
  lootColorLevel4
} from "../../lib/utils/loot-colors";

const useStyles = makeStyles(
  {
    buttonContainer: {
      cursor: "pointer",
      fontWeight: "bold",
      border: "1px solid transparent",
      position: "relative",
      paddingTop: 2,
      paddingBottom: 1,
      minWidth: 30,
      backgroundColor: "white",
      fontSize: 15,
      color: "white"
    },
    description: {
      position: "absolute",
      right: -1,
      top: "-55%",
      width: 30,
      height: 15,
      backgroundColor: "grey",
      fontSize: 10,
      borderRadius: 4
    },
    exposant: {
      fontSize: 10,
      position: "absolute",
      right: 0,
      top: 0
    },
    level4: {
      backgroundColor: lootColorLevel4
    },
    level3: {
      backgroundColor: lootColorLevel3
    },
    level2: {
      backgroundColor: lootColorLevel2
    },
    level1: {
      backgroundColor: lootColorLevel1
    },
    levelAllNumber: {
      position: "absolute",
      right: 14,
      textAlign: "right"
    },
    noLoot: {
      color: "rgba(0,0,0,0.3)",
      border: "1px solid rgba(0,0,0,0.15)"
    },
    levelall: {
      marginLeft: 5,
      marginRight: 6,
      backgroundColor: "grey",
      color: "white",
      minWidth: 40
    }
  },
  { name: "MuiLootButton" }
);

interface Props {
  lootLevel: number | "all";
  lootCount: number;
  lootLowLevelCount?: number;
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

  function handleClick() {
    if (hasLoots) {
      onClick();
    }
  }

  return (
    <div
      onClick={handleClick}
      className={cn("MuiLootButton-buttonContainer", {
        ["MuiLootButton-noLoot"]: !hasLoots,
        [`MuiLootButton-level${lootLevel}`]: hasLoots || isAllLoot
      })}
    >
      {isAllLoot ? (
        <>
          <div className={classes.description}>Total</div>
          <span className={classes.levelAllNumber}>
            {lootCount - lootLowLevelCount}
          </span>
          {lootLowLevelCount > 0 && (
            <span className={classes.exposant}>{"+" + lootLowLevelCount}</span>
          )}
        </>
      ) : (
        lootCount
      )}
    </div>
  );
}
