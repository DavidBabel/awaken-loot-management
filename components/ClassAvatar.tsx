import Avatar from "@material-ui/core/Avatar";
import Grid from "@material-ui/core/Grid";
import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import { getClassImageUrl } from "../lib/utils/image";

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
    <Grid container={true} justify="center" alignItems="center">
      <Avatar
        alt={playerClass + "avatar"}
        src={getClassImageUrl(playerClass)}
        className={classes.avatar}
      />
    </Grid>
  );
}
