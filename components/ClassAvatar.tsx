import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Avatar from "@material-ui/core/Avatar";
import Grid from "@material-ui/core/Grid";

const useStyles = makeStyles({
  avatar: {
    margin: 10
  }
});
interface Props {
  playerClass: string;
}
export default function classAvatar({ playerClass }: Props) {
  const classes = useStyles("");

  return (
    <Grid container justify="center" alignItems="center">
      <Avatar
        alt={playerClass + "avatar"}
        src={`/static/img/class/${playerClass}.jpg`}
        className={classes.avatar}
      />
    </Grid>
  );
}