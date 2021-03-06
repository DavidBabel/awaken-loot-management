import React from "react";

import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Link from "next/link";
import { getDate } from "../../lib/utils/date";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      marginTop: theme.spacing(3),
      overflow: "auto",
      [theme.breakpoints.down("sm")]: {
        "& *": { fontSize: 12 },
        "& span": {
          whiteSpace: "nowrap"
        }
      }
    },
    hidden: {
      display: "none"
    },
    tableWrapper: {
      maxHeight: "calc(100vh - 300px)",
      [theme.breakpoints.down("sm")]: {
        maxHeight: "calc(100vh - 240px)"
      },
      overflow: "auto"
    },
    table: {
      minWidth: 350
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
  const rows = raids
    .sort((a, b) => {
      return new Date(a.raidByRaidId.date) > new Date(b.raidByRaidId.date)
        ? -1
        : 1;
    })
    .map(raid =>
      createData(
        raid.raidByRaidId.donjonByDonjonId.name,
        getDate(raid.raidByRaidId.date),
        raid.raidId
      )
    );
  return (
    <Paper className={classes.root + " " + (hidden ? classes.hidden : "")}>
      <div className={classes.tableWrapper}>
        <Table className={classes.table} stickyHeader={true} size="small">
          <TableHead>
            <TableRow>
              <TableCell>Donjon</TableCell>
              <TableCell align="center">Date</TableCell>
              <TableCell align="center">Link</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map(row => (
              <TableRow key={`donjonname-${row.donjonName + row.date}`}>
                <TableCell /* component="th" */ scope="row">
                  {row.donjonName}
                </TableCell>
                <TableCell align="center">{row.date}</TableCell>
                <TableCell align="center" className={classes.link}>
                  {" "}
                  <Link
                    href="/raid/edit/[id]"
                    as={`/raid/edit/${row.raidId}`} /* a remplacer par /raid/view/[id] */
                  >
                    <a target="_blank">
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
      </div>
    </Paper>
  );
}
