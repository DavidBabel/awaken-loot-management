import React from "react";
import { makeStyles } from "@material-ui/core/styles";

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
    left: "0%",
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
  const tooltipElem = React.useRef(null);
  React.useEffect(() => {
    if (props.showed) {
      if (tooltipElem.current.animate) {
        tooltipElem.current.animate(
          [{ left: "0%" }, { left: `calc(${props.progress}% - 25px)` }],
          {
            duration: 1000,
            iterations: 1,
            easing: "ease-out",
            fill: "both"
          }
        );
      } else {
        tooltipElem.current.style.left = `calc(${props.progress}% - 25px)`;
      }
    }
  });
  return (
    <React.Fragment>
      <span ref={tooltipElem} className={classes.tooltip}>
        {props.progress}
      </span>{" "}
    </React.Fragment>
  );
}
