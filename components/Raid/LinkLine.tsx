import { makeStyles } from "@material-ui/core/styles";
import { useEffect, useState } from "react";

const useStyles = makeStyles({
  verticalLine: {
    position: "absolute",
    borderLeft: "1px solid #F50057"
  },
  horizontalLine: {
    position: "absolute",
    borderTop: "1px solid #F50057"
  }
});

export default function LinkLine({
  raidIds,
  decalage
}: {
  raidIds: number[];
  decalage: number;
}) {
  const classes = useStyles("");
  const [state, setState] = useState({
    min: 0,
    max: Infinity,
    lineHeight: 0,
    left: 0,
    btnsOffsetsTop: [],
    btnHeight: 0
  });
  useEffect(() => {
    const btns = [];
    raidIds.forEach(raidId => {
      btns.push(document.querySelector(`.unlink-btn-${raidId}`));
    });
    let max = 0;
    let min = Infinity;
    let left = 0;
    let height = 0;
    const btnsOffsetsTop = [];
    btns.forEach(btn => {
      if (btn.offsetTop > max) {
        max = btn.offsetTop;
      }
      if (btn.offsetTop < min) {
        min = btn.offsetTop;
      }
      left = btn.offsetLeft;
      height = btn.offsetHeight;
      btnsOffsetsTop.push(btn.offsetTop);
    });
    setState({
      min: min + height * 0.5,
      max: max + height * 0.5,
      lineHeight: max - min,
      left,
      btnsOffsetsTop,
      btnHeight: height
    });
  }, [raidIds]);
  return (
    <>
      <div
        className={classes.verticalLine}
        style={{
          height: state.lineHeight + "px",
          left: state.left - 20 - decalage * 10 + "px",
          top: state.min + "px"
        }}
      />
      {state.btnsOffsetsTop.map(btnOffsetTop => (
        <div
          key={"btn" + btnOffsetTop}
          className={classes.horizontalLine}
          style={{
            width: 20 + decalage * 10 + "px",
            left: state.left - 20 - decalage * 10 + "px",
            top: btnOffsetTop + state.btnHeight * 0.5 + "px"
          }}
        />
      ))}
    </>
  );
}
