import React from "react";
import {
  withStyles,
  Theme,
  createStyles,
  makeStyles
} from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
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

function createData(
  name: string,
  merit: number,
  totalLoot: number,
  totalRaid: number
) {
  return { name, merit, totalLoot, totalRaid };
}

const rows = [
  createData("Devilhunter", 45, 8, 15),
  createData("Thorsen", 12, 5, 11),
  createData("Shaheem", 66, 12, 18),
  createData("Kenya", 80, 28, 25),
  createData("Nazwen", 28, 7, 11)
];

interface Props {
  classColor: String;
}
const useStyles = makeStyles({
  root: {
    width: "100%",
    marginTop: "10px",
    overflowX: "auto",
    "& .MuiTableCell-head": {
      backgroundColor: (props: Props) => `${props.classColor}`,
      color: "black"
    }
  },
  table: {
    minWidth: 700
  },
  progressCell: {
    margin: "auto",
    width: "300px"
  }
});

export default function PlayersTable(props) {
  const classes = useStyles(props);
  return (
    <Paper className={classes.root}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <StyledTableCell align="left">Pseudo</StyledTableCell>
            <StyledTableCell align="center">Merit</StyledTableCell>
            <StyledTableCell align="center">Total loot</StyledTableCell>
            <StyledTableCell align="center">Total raid</StyledTableCell>
            <StyledTableCell align="center"></StyledTableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map(row => (
            <StyledTableRow key={row.name}>
              <StyledTableCell component="th" scope="row">
                {row.name}
              </StyledTableCell>
              <StyledTableCell className={classes.progressCell} align="center">
                <ProgressBar
                  classColor={props.classColor}
                  progress={row.merit}
                  showed={props.showed}
                />
              </StyledTableCell>
              <StyledTableCell align="center">{row.totalLoot}</StyledTableCell>
              <StyledTableCell align="center">{row.totalRaid}</StyledTableCell>
              <StyledTableCell align="center">
                {" "}
                <Button variant="contained" color="primary">
                  Details
                </Button>
              </StyledTableCell>
            </StyledTableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}
