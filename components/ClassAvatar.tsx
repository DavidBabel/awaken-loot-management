import Avatar from "@material-ui/core/Avatar";
import Grid from "@material-ui/core/Grid";
import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import { getClassImageUrl } from "../lib/utils/image";

const useStyles = makeStyles({
  avatar: {
    margin: 10,
    position: "relative"
  },
  prio: {
    padding: 2,
    position: "absolute",
    borderRadius: "4px",
    backgroundColor: "#EF5858",
    color: "white",
    fontSize: "10px",
    top: "5px"
  }
});
interface Props {
  children?: React.ReactNode;
  playerClass: string;
  prio?: boolean;
}
export default function classAvatar({ children, playerClass, prio }: Props) {
  const classes = useStyles("");

  return (
    <Grid container={true} justify="center" alignItems="center">
      {children}
      <Avatar
        alt={playerClass + "avatar"}
        src={getClassImageUrl(playerClass)}
        className={classes.avatar}
      />
      {prio && <div className={classes.prio}>PRIO</div>}
    </Grid>
  );
}
