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
  role?: string;
}

const useStyles = makeStyles({
  button: { marginLeft: 5 },
  input: { width: "100%" }
});

export default function ChangePasswordOrRole({ playerId, accessor }) {
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
      updatePlayer({
        variables: {
          id: playerId,
          [accessor]: input
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
    <div>
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
          Modifier le mot de passe crypté:
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
  );
}
