import React from "react";
import ProgressTooltip from "../../components/summary/ProgressTooltip";
import { makeStyles } from "@material-ui/core/styles";

interface Props {
  classColor: String;
  progress: String;
}
const useStyles = makeStyles({
  container: {
    position: "relative",
    display: "flex",
    flexDirection: "column",
    height: "40px",
    justifyContent: "flex-end"
  },
  bar: {
    position: "relative",
    height: "10px",
    width: "300px",
    borderRadius: "4px",
    border: "1px solid transparent",
    backgroundColor: "#4D4D4D"
  },
  filler: {
    width: (props: Props) => `${props.progress}%`,
    backgroundColor: (props: Props) => `${props.classColor}`,
    height: "100%",
    borderRadius: "2px"
  }
});

export default function ProgressBar(props) {
  const classes = useStyles(props);

  return (
    <div className={classes.container}>
      <ProgressTooltip progress={props.progress} />
      <div className={classes.bar}>
        <div className={classes.filler}></div>
      </div>
    </div>
  );
}
