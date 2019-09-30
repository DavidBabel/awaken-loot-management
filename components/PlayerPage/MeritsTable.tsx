import React from "react";
import { createStyles, Theme, makeStyles } from "@material-ui/core/styles";
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

export default function MeritsTable({ merits }) {
  const classes = useStyles("");
  if (merits.length === 0) {
    return <div style={{ padding: "20px" }}>No merit!</div>;
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
    <Paper className={classes.root}>
      <Table className={classes.table}>
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
                row.validated == "Non"
                  ? classes.notValidated
                  : classes.validated
              }
            >
              <TableCell component="th" scope="row">
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
    </Paper>
  );
}
