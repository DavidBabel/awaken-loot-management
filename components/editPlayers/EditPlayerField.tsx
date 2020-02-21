import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  LinearProgress,
  Snackbar,
  SnackbarContent,
  TableCell,
  TextField
} from "@material-ui/core/";
import { makeStyles } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import CreateIcon from "@material-ui/icons/Create";
import { useState } from "react";
import { Mutation } from "../../lib/generatedTypes";
import { UPDATE_PLAYER } from "../../lib/gql/player-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";

interface UpdatePlayerVariables {
  id: number;
  active?: boolean;
  name?: string;
  inRoster?: boolean;
  password?: string;
  classId?: number;
  role?: string;
}

const useStyles = makeStyles({
  button: { marginLeft: 5 },
  input: { width: "100%" },
  container: {
    display: "flex",
    justifyContent: "flex-end",
    lineHeight: "48px"
  }
});

interface Props {
  playerId: number;
  label: string;
  accessor: string;
}

export default function EditPlayerField({ playerId, label, accessor }: Props) {
  const classes = useStyles("");
  const [loading, setLoading] = useState<boolean>(false);
  const [open, setOpen] = useState<boolean>(false);
  const [input, setInput] = useState<string>("");
  const [updatePlayer] = useMutation<Mutation, UpdatePlayerVariables>(
    UPDATE_PLAYER
  );
  const {
    snackBarOpen,
    snackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    snackBarMessage
  } = useSnackBar();

  const handleOpen = (): void => {
    setOpen(true);
  };
  const handleClose = (): void => {
    setOpen(false);
  };
  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setInput(event.target.value);
  };
  const confirm = () => {
    setLoading(true);
    if (input.length > 0) {
      const finalInput = "classId" === accessor ? parseInt(input) : input;

      updatePlayer({
        variables: {
          id: playerId,
          [accessor]: finalInput
        }
      })
        .then(resp => {
          openSnackBar(accessor + " modifié avec succès", "success");
          setOpen(false);
          setLoading(false);
        })
        .catch(err => {
          openSnackBar(err.message, "error");
          setOpen(false);
          setLoading(false);
        });
    } else {
      openSnackBar("Veuillez remplir le champ", "error");
      setLoading(false);
    }
  };
  return (
    <TableCell align="right">
      <div className={classes.container}>
        {label}

        <IconButton className={classes.button} onClick={handleOpen}>
          <CreateIcon />
        </IconButton>
        <Dialog
          maxWidth={"lg"}
          open={open}
          keepMounted={true}
          onClose={handleClose}
          aria-labelledby="update-passwordOrRole-dialog"
          aria-describedby="update passwordOrRole window"
        >
          <DialogTitle id="update-passwordOrRole-dialog">
            Modifier le "{accessor}":
          </DialogTitle>
          <DialogContent>
            {loading ? (
              <LinearProgress />
            ) : (
              <TextField
                className={classes.input}
                autoComplete="off"
                id="outlined-passwordOrRole-input"
                label={accessor}
                value={input}
                onChange={handleChange}
                margin="dense"
                variant="outlined"
              />
            )}
            {"classId" === accessor && (
              <div>
                <div>1 - Prêtre</div>
                <div>2 - Mage</div>
                <div>3 - Démoniste</div>
                <div>4 - Voleur</div>
                <div>5 - Druide</div>
                <div>6 - Chasseur</div>
                <div>7 - Chaman</div>
                <div>8 - Guerrier Tank</div>
                <div>9 - Guerrier DPS</div>
                <div>10 - Paladin</div>
                <div>11 - Prêtre Ombre</div>
                <div>12 - Druide Feral</div>
                <div>13 - Chaman Amélio</div>
              </div>
            )}
            {"role" === accessor && (
              <div>
                <div>player</div>
                <div>classMaster</div>
                <div>officer</div>
                <div>admin</div>
              </div>
            )}
          </DialogContent>
          <DialogActions>
            <Button onClick={handleClose} color="primary">
              ANNULER
            </Button>
            <Button onClick={confirm} color="primary">
              CONFIRMER
            </Button>
          </DialogActions>
        </Dialog>
        <Snackbar
          anchorOrigin={{
            vertical: "bottom",
            horizontal: "center"
          }}
          open={snackBarOpen}
          autoHideDuration={3000}
          onClose={closeSnackBar}
        >
          <SnackbarContent
            style={{ backgroundColor: snackBarBackgroundColor }}
            message={<span id="message-id">{snackBarMessage}</span>}
            action={[
              <IconButton
                key="close"
                aria-label="close"
                color="inherit"
                onClick={closeSnackBar}
              >
                <CloseIcon />
              </IconButton>
            ]}
          />
        </Snackbar>
      </div>
    </TableCell>
  );
}