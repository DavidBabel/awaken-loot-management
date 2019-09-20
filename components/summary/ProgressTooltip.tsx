import React from "react";
import { makeStyles } from "@material-ui/core/styles";

interface Props {
  progress: String;
}

const useStyles = makeStyles({
  tooltip: {
    position: "absolute",
    width: "50px",
    backgroundColor: "#4D4D4D",
    color: "#fff",
    textAlign: "center",
    borderRadius: "6px",
    padding: "2px 0",
    zIndex: 1,
    left: (props: Props) => `calc(${props.progress}% - 25px)`,
    top: "-4px",
    "&::after": {
      content: "''",
      position: "absolute",
      top: "100%",
      left: "50%",
      marginLeft: "-5px",
      borderWidth: "5px",
      borderStyle: "solid",
      borderColor: "#4D4D4D transparent transparent transparent"
    }
  }
});

export default function ProgressTooltip(props) {
  const classes = useStyles(props);
  return (
    <React.Fragment>
      <span className={classes.tooltip}>{props.progress}</span>{" "}
    </React.Fragment>
  );
}
