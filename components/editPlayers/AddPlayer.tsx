import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  LinearProgress,
  MenuItem,
  Select,
  TextField
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add as AddIcon } from "@material-ui/icons";
import { ApolloQueryResult } from "apollo-boost";
import { useState } from "react";
import { wowClasses } from "../../lib/constants/classes";
import { Mutation, Player, Query } from "../../lib/generatedTypes";
import { CREATE_PLAYER } from "../../lib/gql/player-mutations";
import {
  showErrorMessage,
  showSuccessMessage
} from "../../lib/utils/snackbars/snackbarService";

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

interface Props {
  buttonLabel?: string;
  initialName?: string;
  allPlayers: Player[];
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
}

export default function AddPlayer({
  initialName = "",
  buttonLabel = "Ajouter un joueur",
  allPlayers,
  refetchAllPlayers
}: Props) {
  const classes = useStyles("");
  const [open, setOpen] = useState<boolean>(false);
  const [newPlayerInputValue, setNewPlayerInputValue] = useState<string>(
    initialName
  );
  const [classIdToAdd, setClassIdToAdd] = useState<string>("0");
  const [selectClassOpened, setSelectClassOpened] = useState<boolean>(false);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [createPlayer] = useMutation<Mutation, CreatePlayerVariables>(
    CREATE_PLAYER
  );

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
                showSuccessMessage(
                  newPlayerInputValue + " ajouté avec succès."
                );
              })
              .catch(err => {
                setOpen(false);
                setIsLoading(false);
                showErrorMessage(err.message);
              });
          })
          .catch(err => {
            setOpen(false);
            setIsLoading(false);
            showErrorMessage(err.message);
          });
      } else {
        setIsLoading(false);
        showErrorMessage("Ce joueur existe déja.");
      }
    } else {
      if (newPlayerInputValue.length === 0) {
        showErrorMessage("Tapez le pseudo du joueur");
      } else {
        showErrorMessage("Selectionnez une classe");
      }
    }
  };

  return (
    <>
      <Button onClick={handleOpen} variant="outlined" color="primary">
        <span className={classes.btnTxt}>{buttonLabel}</span>
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
                <MenuItem key={`wow-class-${wowClass.id}`} value={wowClass.id}>
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
    </>
  );
}
