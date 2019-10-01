import React from "react";
import { createStyles, Theme, makeStyles } from "@material-ui/core/styles";
import Link from "next/link";
import Button from "@material-ui/core/Button";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      marginTop: theme.spacing(3),
      overflowX: "auto"
    },
    hidden: {
      display: "none"
    },
    table: {
      minWidth: 650
    },
    link: { "& a": { textDecoration: "none", color: "white" } }
  })
);

function createData(donjonName: string, date: string, raidId: string) {
  return { donjonName, date, raidId };
}

export default function RaidsTable({ raids, hidden }) {
  const classes = useStyles("");
  if (raids.length === 0) {
    return (
      <div className={hidden ? classes.hidden : ""} style={{ padding: "20px" }}>
        No raid yet!
      </div>
    );
  }
  const rows = raids.map(raid =>
    createData(
      raid.raidByRaidId.donjonByDonjonId.name,
      raid.raidByRaidId.date,
      raid.raidId
    )
  );
  return (
    <Paper className={classes.root + " " + (hidden ? classes.hidden : "")}>
      <Table className={classes.table}>
        <TableHead>
          <TableRow>
            <TableCell>Donjon</TableCell>
            <TableCell align="right">Date</TableCell>
            <TableCell align="right">Link</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map(row => (
            <TableRow key={row.donjonName + row.date}>
              <TableCell component="th" scope="row">
                {row.donjonName}
              </TableCell>
              <TableCell align="right">{row.date}</TableCell>
              <TableCell align="right" className={classes.link}>
                {" "}
                <Link href="/raid/edit/[id]" as={`/raid/edit/${row.raidId}`}>
                  <a>
                    <Button variant="contained" color="primary">
                      View raid
                    </Button>
                  </a>
                </Link>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </Paper>
  );
}
