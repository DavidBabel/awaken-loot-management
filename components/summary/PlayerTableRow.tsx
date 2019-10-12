import React from "react";

import { Button, TableCell, TableRow } from "@material-ui/core";
import {
  createStyles,
  makeStyles,
  Theme,
  withStyles
} from "@material-ui/core/styles";
import Link from "next/link";
import ProgressBar from "../../components/summary/ProgressBar";
import { useToggle } from "../../lib/hooks/toggle";

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
  link: { "& a": { textDecoration: "none", color: "white" } }
});
export default function PlayerTableRow(props) {
  const [showLootDetail, toggleShowLootDetail] = useToggle(false);
  const classes = useStyles("");
  return (
    <>
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
          <Button
            variant="contained"
            color="primary"
            onClick={toggleShowLootDetail}
          >
            Details 1
          </Button>
        </StyledTableCell>
        <StyledTableCell align="center" className={classes.link}>
          <Link
            href="/player/view/[id]"
            as={`/player/view/${props.rowData.playerId}`}
          >
            <a>
              <Button variant="contained" color="primary">
                Details 2
              </Button>
            </a>
          </Link>
        </StyledTableCell>
      </StyledTableRow>
      {showLootDetail && (
        <StyledTableRow>
          <StyledTableCell align="center">
            {props.lootsData.map((l, i) => {
              // return JSON.stringify(l);
              return (
                <div key={`${props.rowData.name}-${l.itemByItemId.name}-${i}`}>
                  <a
                    style={{
                      textDecoration: "none",
                      marginRight: "10px"
                    }}
                    href={`https://fr.classic.wowhead.com/item=${l.itemByItemId.wowheadId}`}
                  >
                    {l.itemByItemId.name}
                  </a>
                </div>
              );
            })}
          </StyledTableCell>
        </StyledTableRow>
      )}
    </>
  );
}
