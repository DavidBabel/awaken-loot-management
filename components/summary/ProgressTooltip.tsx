import { makeStyles } from "@material-ui/core/styles";
import React from "react";

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
    left: "calc(0% - 25px)",
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

interface Props {
  progress: number;
  showed: boolean;
}

export default function ProgressTooltip(props: Props) {
  const classes = useStyles(props);
  const tooltipElem = React.useRef(null);
  const progress = Math.max(0, props.progress);
  React.useEffect(() => {
    if (props.showed) {
      if (tooltipElem.current.animate) {
        tooltipElem.current.animate(
          [{ left: "calc(0% - 25px)" }, { left: `calc(${progress}% - 25px)` }],
          {
            duration: 500,
            iterations: 1,
            easing: "ease-out",
            fill: "both"
          }
        );
      } else {
        tooltipElem.current.style.left = `calc(${progress}% - 25px)`;
      }
    }
  }, [props.showed]);
  return (
    <React.Fragment>
      <span ref={tooltipElem} className={classes.tooltip}>
        {progress + "%"}
      </span>{" "}
    </React.Fragment>
  );
}
