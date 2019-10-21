import React from "react";

import Paper from "@material-ui/core/Paper";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";

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
    notValidated: {
      backgroundColor: "rgba(255, 0, 0, 0.05)"
    },
    validated: {
      backgroundColor: "rgba(0, 255, 0, 0.05)"
    }
  })
);

function createData(
  name: string,
  categorie: string,
  comment: string,
  value: number,
  validated: string
) {
  return { name, categorie, comment, value, validated };
}

export default function MeritsTable({ merits, hidden }) {
  const classes = useStyles("");
  if (merits.length === 0) {
    return (
      <div className={hidden ? classes.hidden : ""} style={{ padding: "20px" }}>
        No merit!
      </div>
    );
  }
  const rows = merits.map(merit => {
    return createData(
      merit.meritByMeritId.name,
      merit.meritByMeritId.categorie,
      merit.meritByMeritId.comment,
      merit.meritByMeritId.value,
      merit.validated ? "Oui" : "Non"
    );
  });
  return (
    <Paper className={classes.root + " " + (hidden ? classes.hidden : "")}>
      <div className={classes.tableWrapper}>
        <Table className={classes.table} stickyHeader={true}>
          <TableHead>
            <TableRow>
              <TableCell>Merit</TableCell>
              <TableCell align="right">Categorie</TableCell>
              <TableCell align="right">Commentaire</TableCell>
              <TableCell align="right">Valeur</TableCell>
              <TableCell align="right">Validé</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map(row => (
              <TableRow
                key={row.name}
                className={
                  row.validated === "Non"
                    ? classes.notValidated
                    : classes.validated
                }
              >
                <TableCell /* component="th"  */ scope="row">
                  {row.name}
                </TableCell>
                <TableCell align="right">{row.categorie}</TableCell>
                <TableCell align="right">{row.comment}</TableCell>
                <TableCell align="right">{row.value}</TableCell>
                <TableCell align="right">{row.validated}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </Paper>
  );
}
