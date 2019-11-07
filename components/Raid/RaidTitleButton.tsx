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
import { UPDATE_RAID_TITLE } from "../../lib/gql/raid-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";

interface UpdateRaidTitleVariables {
  raidId: number;
  newTitle: string;
}
const useStyles = makeStyles({
  root: {}
});

export default function RaidTitleButton({ raid, setRaidTitle }) {
  const classes = useStyles("");
  const [loading, setLoading] = useState<boolean>(false);
  const [open, setOpen] = useState<boolean>(false);
  const [titleInput, setTitleInput] = useState<string>("");
  const [updateRaidTitle] = useMutation<Mutation, UpdateRaidTitleVariables>(
    UPDATE_RAID_TITLE
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
    setTitleInput(event.target.value);
  };
  const confirm = () => {
    setLoading(true);
    updateRaidTitle({
      variables: {
        raidId: raid.id,
        newTitle: titleInput
      }
    })
      .then(resp => {
        openSnackBar("Titre du raid modifié avec succès", "success");
        setRaidTitle(titleInput);
        setOpen(false);
        setLoading(false);
      })
      .catch(err => {
        openSnackBar(err.message, "error");
        setOpen(false);
        setLoading(false);
      });
  };
  return (
    <div className={classes.root}>
      <IconButton onClick={handleOpen}>
        <CreateIcon />
      </IconButton>
      <Dialog
        maxWidth={"lg"}
        open={open}
        keepMounted={true}
        onClose={handleClose}
        aria-labelledby="update-title-dialog"
        aria-describedby="update title window"
      >
        <DialogTitle id="update-title-dialog">
          Modifier le titre du raid
        </DialogTitle>
        <DialogContent>
          {loading ? (
            <LinearProgress />
          ) : (
            <TextField
              autoComplete="off"
              id="outlined-title-input"
              label="Title"
              value={titleInput}
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
