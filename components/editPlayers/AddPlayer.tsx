import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  IconButton,
  LinearProgress,
  MenuItem,
  Select,
  Snackbar,
  SnackbarContent,
  TextField
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add as AddIcon } from "@material-ui/icons";
import CloseIcon from "@material-ui/icons/Close";
import { ApolloQueryResult } from "apollo-boost";
import { useState } from "react";
import { Mutation, Player, Query } from "../../lib/generatedTypes";
import { CREATE_PLAYER } from "../../lib/gql/player-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";

interface CreatePlayerVariables {
  classId: number;
  name: string;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    dialogContent: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center"
    },
    btnTxt: { marginRight: 10 },
    selectClass: { marginLeft: 10 },

    dialogActions: {
      marginTop: 10
    },
    newPlayerInput: { alignSelf: "flex-end" },
    linearProgress: {
      marginBottom: 10
    }
  })
);

export default function AddPlayer({
  allPlayers,
  refetchAllPlayers
}: {
  allPlayers: Player[];
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
}) {
  const classes = useStyles("");
  const [open, setOpen] = useState<boolean>(false);
  const [newPlayerInputValue, setNewPlayerInputValue] = useState<string>("");
  const [classIdToAdd, setClassIdToAdd] = useState<string>("0");
  const [selectClassOpened, setSelectClassOpened] = useState<boolean>(false);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [createPlayer] = useMutation<Mutation, CreatePlayerVariables>(
    CREATE_PLAYER
  );
  const {
    snackBarOpen,
    snackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    snackBarMessage
  } = useSnackBar();
  const wowClasses = [
    { id: 0, name: "-- Classe --" },
    { id: 1, name: "Prêtre" },
    { id: 2, name: "Mage" },
    { id: 3, name: "Démoniste" },
    { id: 4, name: "Voleur" },
    { id: 5, name: "Druide" },
    { id: 6, name: "Chasseur" },
    { id: 7, name: "Chaman" },
    { id: 8, name: "Guerrier Tank" },
    { id: 9, name: "Guerrier DPS" }
  ];
  const handleOpen = (): void => {
    setOpen(true);
  };

  const handleClose = (): void => {
    setOpen(false);
  };
  const handleCloseSelectClass = (): void => {
    setSelectClassOpened(false);
  };
  const handleOpenSelectClass = (): void => {
    setSelectClassOpened(true);
  };
  const handleChangeSelectClass = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setClassIdToAdd(event.target.value.toString());
  };
  const handleChangeNewPlayerInput = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setNewPlayerInputValue(event.target.value as string);
  };

  const confirmCreatePlayer = () => {
    if (newPlayerInputValue.length > 0 && classIdToAdd !== "0") {
      setIsLoading(true);
      if (
        !allPlayers.some(
          (player: Player) => player.name === newPlayerInputValue
        )
      ) {
        createPlayer({
          variables: {
            classId: parseInt(classIdToAdd),
            name: newPlayerInputValue
          }
        })
          .then(resp => {
            refetchAllPlayers()
              .then(() => {
                setOpen(false);
                setIsLoading(false);
                setNewPlayerInputValue("");
                openSnackBar(
                  newPlayerInputValue + " ajouté avec succès.",
                  "success"
                );
              })
              .catch(err => {
                setOpen(false);
                setIsLoading(false);
                openSnackBar(err.message, "error");
              });
          })
          .catch(err => {
            setOpen(false);
            setIsLoading(false);
            openSnackBar(err.message, "error");
          });
      } else {
        setIsLoading(false);
        openSnackBar("Ce joueur existe déja.", "error");
      }
    } else {
      if (newPlayerInputValue.length === 0) {
        openSnackBar("Tapez le pseudo du joueur", "error");
      } else {
        openSnackBar("Selectionnez une classe", "error");
      }
    }
  };

  return (
    <div>
      <Button onClick={handleOpen} variant="outlined" color="primary">
        <span className={classes.btnTxt}>Ajouter un joueur</span>
        <AddIcon />
      </Button>
      <Dialog
        maxWidth={"lg"}
        open={open}
        keepMounted={true}
        onClose={handleClose}
        aria-labelledby="add-loot-dialog"
        aria-describedby="add loot window"
      >
        <DialogTitle id="add-loot-dialog">
          Ajouter un nouveau joueur:
        </DialogTitle>
        {isLoading && (
          <LinearProgress className={classes.linearProgress} variant="query" />
        )}
        <DialogContent className={classes.dialogContent}>
          <TextField
            autoComplete="off"
            id="outlined-player"
            label="Nouveau joueur"
            className={classes.newPlayerInput}
            value={newPlayerInputValue}
            onChange={handleChangeNewPlayerInput}
            margin="dense"
            variant="outlined"
          />
          <Select
            className={classes.selectClass}
            open={selectClassOpened}
            onClose={handleCloseSelectClass}
            onOpen={handleOpenSelectClass}
            value={classIdToAdd}
            onChange={handleChangeSelectClass}
          >
            {wowClasses.map(wowClass => {
              return (
                <MenuItem key={wowClass.id} value={wowClass.id}>
                  {wowClass.name}
                </MenuItem>
              );
            })}
          </Select>
        </DialogContent>
        <DialogActions
          classes={{
            root: classes.dialogActions
          }}
        >
          <Button onClick={handleClose} color="primary">
            ANNULER
          </Button>
          <Button onClick={confirmCreatePlayer} color="primary">
            AJOUTER
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
