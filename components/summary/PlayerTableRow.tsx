import Button from "@material-ui/core/Button";
import IconButton from "@material-ui/core/IconButton";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";

import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import VisibilityIcon from "@material-ui/icons/Visibility";
import Link from "next/link";
import React from "react";
import ProgressBar from "../../components/summary/ProgressBar";

const StyledTableCell = withStyles((theme: Theme) =>
  createStyles({
    body: {
      fontSize: 14
    }
  })
)(TableCell);
const StyledTableRow = withStyles((theme: Theme) =>
  createStyles({
    root: {
      "&:nth-of-type(odd)": {
        backgroundColor: theme.palette.background.default
      }
    }
  })
)(TableRow);
const useStyles = makeStyles({
  progressCell: {
    width: "200px",
    margin: "auto"
  },
  viewIcon: {
    marginLeft: "5px"
  },
  link: { "& a": { textDecoration: "none", color: "white" } }
});
export default function PlayerTableRow(props) {
  const classes = useStyles("");
  const iconElem = React.useRef(null);
  return (
    <StyledTableRow>
      <StyledTableCell component="th" scope="row">
        {props.rowData.name}
      </StyledTableCell>
      <StyledTableCell className={classes.progressCell} align="center">
        <ProgressBar
          classColor={props.classColor}
          progress={props.rowData.merit}
          showed={props.showed}
        />
      </StyledTableCell>
      <StyledTableCell align="center">
        {props.rowData.totalLoot}
        <IconButton
          ref={iconElem}
          onClick={() => {
            props.openLootWindow(props.rowData.name, props.lootsData, {
              top: iconElem.current.getBoundingClientRect().top,
              left: iconElem.current.getBoundingClientRect().left
            });
          }}
          className={classes.viewIcon}
          color="primary"
          aria-label="View loots"
        >
          <VisibilityIcon />
        </IconButton>
      </StyledTableCell>
      <StyledTableCell align="center">
        {props.rowData.totalRaid}
      </StyledTableCell>
      <StyledTableCell align="center">
        {props.rowData.lastLootDate}
      </StyledTableCell>
      <StyledTableCell align="center">
        {props.rowData.lastRaidDate}
      </StyledTableCell>
      <StyledTableCell align="center" className={classes.link}>
        <Link
          href="/player/view/[id]"
          as={`/player/view/${props.rowData.playerId}`}
        >
          <a>
            <Button variant="contained" color="primary">
              Details
            </Button>
          </a>
        </Link>
      </StyledTableCell>
    </StyledTableRow>
  );
}
