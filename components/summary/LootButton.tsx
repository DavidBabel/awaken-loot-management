import React from "react";

// import { IconButton } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import cn from "classnames";

const useStyles = makeStyles(
  {
    // root: {
    //   position: "relative"
    // },
    number: {
      cursor: "pointer",
      border: "1px solid",
      // borderRadius: 4,
      // padding: 4,
      // margin: 3,
      position: "relative",
      minWidth: 30,
      backgroundColor: "white"
    },
    levelDescription: {
      position: "absolute",
      right: -1,
      top: "-55%",
      width: 20,
      height: 15,
      backgroundColor: "grey",
      fontSize: 10,
      borderRadius: 4
    },
    allLoot: {
      // marginLeft: 5,
      display: "flex",
      alignItems: "center",
      justifyContent: "center"
    },
    badLootPlus: {
      fontSize: 10,
      alignSelf: "flex-start",
      marginTop: 1,
      zIndex: 5
    },
    level3: {
      fontSize: 15,
      color: "white",
      backgroundColor: "#a335ee",
      borderColor: "#a335ee"
    },
    level2: {
      fontSize: 15,
      color: "white",
      backgroundColor: "#0070dd",
      borderColor: "#0070dd"
    },
    level1: {
      fontSize: 15,
      color: "white",
      backgroundColor: "#1ad900",
      borderColor: "#1ad900"
    },
    levelall: {
      fontSize: 15,
      color: "white",
      backgroundColor: "grey",
      borderColor: "grey"
    },
    // allLootColor: {   fontSize: 15, color: "grey", borderColor: "grey" },
    noLoot: { fontSize: 15, color: "rgba(0,0,0,0.3)", cursor: "auto" },
    link: {
      "& button a": { textDecoration: "none", color: "#1976d2" },
      "& button:disabled a": { textDecoration: "none", color: "grey" }
    }
  },
  { name: "MuiLootButton" }
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
        ["MuiLootButton-number"]: true,
        ["MuiLootButton-allLoot"]: isAllLoot,
        ["MuiLootButton-allLootColor"]: isAllLoot,
        ["MuiLootButton-noLoot"]: !hasLoots,
        [`MuiLootButton-level${lootLevel}`]: hasLoots
      })}
    >
      <div
        onClick={() => {
          if (hasLoots) {
            onClick();
          }
        }}
        className={cn({
          ["MuiLootButton-noLoot"]: !hasLoots,
          [`MuiLootButton-level${lootLevel}`]: hasLoots
        })}
        color="primary"
        aria-label="View loots"
      >
        {isAllLoot ? (
          <>
            <div className={classes.levelDescription}>All</div>
            <span>{lootCount - lootLowLevelCount}</span>
            {lootLowLevelCount > 0 && (
              <span className={classes.badLootPlus}>
                {"+" + lootLowLevelCount}
              </span>
            )}
          </>
        ) : (
          lootCount
        )}
      </div>
    </div>
  );
}
