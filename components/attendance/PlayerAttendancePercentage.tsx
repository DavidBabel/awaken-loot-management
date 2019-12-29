import React from "react";

import { createStyles, makeStyles, TableCell, Theme } from "@material-ui/core";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    attPercentage: {
      minWidth: 60,
      [theme.breakpoints.down("sm")]: {
        minWidth: 46
      },
      backgroundColor: "#242424",
      color: "white"
    }
  })
);

interface Props {
  totalRaidPlayed: number;
  totalRaids: number;
}

export function PlayerAttendancePercentage({
  totalRaidPlayed,
  totalRaids
}: Props) {
  const classes = useStyles("");

  return (
    <TableCell className={classes.attPercentage + " perc-cell"}>
      {totalRaidPlayed === 0
        ? "0 %"
        : `${Math.round((totalRaidPlayed * 100) / totalRaids)} %`}
    </TableCell>
  );
}
