import { makeStyles } from "@material-ui/core/styles";
import React from "react";
import ProgressTooltip from "../../components/summary/ProgressTooltip";

interface Props {
  classColor: string;
  progress: number;
  showed: boolean;
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
    width: "160px",
    borderRadius: "4px",
    border: "1px solid transparent",
    backgroundColor: "#4D4D4D"
  },
  filler: {
    width: "0%",
    backgroundColor: (props: Props) => `${props.classColor}`,
    height: "100%",
    borderRadius: "2px"
  }
});

export default function ProgressBar(props: Props) {
  const classes = useStyles(props);
  const fillerElem = React.useRef(null);
  const progress = Math.max(0, props.progress);
  React.useEffect(() => {
    if (props.showed) {
      if (fillerElem.current.animate) {
        fillerElem.current.animate(
          [{ width: "0%" }, { width: `${progress}%` }],
          {
            duration: 500,
            iterations: 1,
            easing: "ease-out",
            fill: "both"
          }
        );
      } else {
        fillerElem.current.style.width = `${progress}%`;
      }
    }
  }, [props.showed]);
  return (
    <div className={classes.container}>
      <ProgressTooltip showed={props.showed} progress={progress} />
      <div className={classes.bar}>
        <div ref={fillerElem} className={classes.filler} />
      </div>
    </div>
  );
}
