import Button from "@material-ui/core/Button";
import Paper from "@material-ui/core/Paper";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Link from "next/link";
import React from "react";

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
    tableWrapper: {
      maxHeight: "calc(100vh - 300px)",
      overflow: "auto"
    },
    table: {
      minWidth: 650
    },
    link: { "& a": { textDecoration: "none", color: "white" } }
  })
);

function createData(
  name: string,
  wowheadId: string,
  date: string,
  raidId: string
) {
  return { name, wowheadId, date, raidId };
}

export default function LootsTable({ loots, hidden }) {
  const classes = useStyles("");
  if (loots.length === 0) {
    return (
      <div className={hidden ? classes.hidden : ""} style={{ padding: "20px" }}>
        Nada!
      </div>
    );
  }
  const rows = loots
    .filter(loot => loot.active)
    .map(loot =>
      createData(
        loot.itemByItemId.name,
        loot.itemByItemId.wowheadId,
        new Date(loot.raidByRaidId.date).toLocaleDateString("fr-FR"),
        loot.raidByRaidId.id
      )
    );
  return (
    <Paper className={classes.root + " " + (hidden ? classes.hidden : "")}>
      <div className={classes.tableWrapper}>
        <Table className={classes.table} stickyHeader={true}>
          <TableHead>
            <TableRow>
              <TableCell>Loot</TableCell>
              <TableCell align="right">Date</TableCell>
              <TableCell align="right">Raid</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map(row => (
              <TableRow key={row.wowheadId + row.raidId}>
                <TableCell /* component="th" */ scope="row">
                  <a
                    onClick={e => {
                      e.preventDefault();
                    }}
                    href={`https://fr.classic.wowhead.com/item=${row.wowheadId}`}
                  >
                    {row.name}
                  </a>
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
      </div>
    </Paper>
  );
}
