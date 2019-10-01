import React from "react";
import {
  withStyles,
  Theme,
  createStyles,
  makeStyles
} from "@material-ui/core/styles";
import Link from "next/link";
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
  totalRaid: number,
  playerId: number
) {
  return { name, merit, totalLoot, totalRaid, playerId };
}

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
  },
  link: { "& a": { textDecoration: "none", color: "white" } }
});

export default function PlayersTable(props) {
  const classes = useStyles(props);

  const rows = props.players.map(player => {
    let totalMerit = 0;
    let totalLoot = 0;
    let totalRaid = player.raidPlayersByPlayerId.nodes.length;
    player.playerMeritsByPlayerId.nodes.map(merit => {
      if (merit.validated) {
        totalMerit += merit.meritByMeritId.value;
      }
    });
    player.lootsByPlayerId.nodes.map(loot => {
      if (loot.active) {
        totalLoot += 1;
      }
    });

    return createData(
      player.name,
      Math.round((totalMerit * 100) / props.maxMeritValue),
      totalLoot,
      totalRaid,
      player.id
    );
  });
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
              <StyledTableCell align="center" className={classes.link}>
                <Link
                  href="/player/view/[id]"
                  as={`/player/view/${row.playerId}`}
                >
                  <a>
                    <Button variant="contained" color="primary">
                      Details
                    </Button>
                  </a>
                </Link>
              </StyledTableCell>
            </StyledTableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}
