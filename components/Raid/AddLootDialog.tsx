import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Fab,
  FormControl,
  IconButton,
  InputLabel,
  LinearProgress,
  MenuItem,
  Select,
  Snackbar,
  SnackbarContent,
  Switch,
  TextField
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add as AddIcon } from "@material-ui/icons";
import CloseIcon from "@material-ui/icons/Close";
import ForwardIcon from "@material-ui/icons/Forward";
import { ApolloQueryResult } from "apollo-boost";
import { useContext, useState } from "react";
import ClassAvatar from "../../components/ClassAvatar";
import MemberContext from "../../lib/context/member";
import { BossItem, Mutation, Player, Query } from "../../lib/generatedTypes";
import { CREATE_LOOT } from "../../lib/gql/loot-mutations";
import { CREATE_PLAYER } from "../../lib/gql/player-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";

interface CreateLootVariables {
  playerId: number;
  itemId: number;
  raidId: number;
  bossId: number;
  lastActionBy: string;
  lastActionDate: string;
}
interface CreatePlayerVariables {
  classId: number;
  name: string;
  role: string;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    lootInfoSelects: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center"
    },
    selectItem: {
      minWidth: 200,
      [theme.breakpoints.down("sm")]: {
        minWidth: 100,
        marginRight: 8
      }
    },
    switch: {
      display: "flex",
      lineHeight: "24px",
      height: "34px",
      padding: 5,
      alignSelf: "flex-start"
    },
    fleche: {
      margin: "0px 15px",
      [theme.breakpoints.down("sm")]: {
        display: "none"
      }
    },
    selectPlayer: {
      minWidth: 200,
      [theme.breakpoints.down("sm")]: {
        minWidth: 100
      }
    },
    selectClass: { marginLeft: 10 },
    lootToAddAvatars: {
      position: "relative",
      display: "flex",
      justifyContent: "center",
      width: "100%"
    },
    dialogActions: {
      marginTop: 10
    },
    newPlayerInput: { alignSelf: "flex-end" },
    linearProgress: {
      marginBottom: 10
    }
  })
);

export default function AddLootDialog({
  allPlayers,
  loots,
  raidId,
  bossId,
  bossName,
  refetchOneRaid,
  refetchAllPlayers,
  scrollDown
}: {
  allPlayers: Player[];
  loots: BossItem[];
  raidId: number;
  bossId: number;
  bossName: string;
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
  scrollDown: () => void;
}) {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  //   const [loading, setLoading] = useState<boolean>(false);
  const [open, setOpen] = useState<boolean>(false);
  const [playerIdToAdd, setPlayerIdToAdd] = useState<string>("");
  const [restrictPlayerList, setRestrictPlayerList] = useState<boolean>(true);
  const [showNewPlayerInput, setShowNewPlayerInput] = useState<boolean>(false);
  const [newPlayerInputValue, setNewPlayerInputValue] = useState<string>(null);
  const [itemIdToAdd, setItemIdToAdd] = useState<string>("");
  const [classIdToAdd, setClassIdToAdd] = useState<string>("0");
  const [itemToAdd, setItemToAdd] = useState<BossItem>(null);
  const [addLootIsLoading, setAddLootIsLoading] = useState<boolean>(false);
  const [restrictedClassIds, setRestrictedClassIds] = useState<number[]>([]);
  const [selectPlayerOpened, setSelectPlayerOpened] = useState<boolean>(false);
  const [selectClassOpened, setSelectClassOpened] = useState<boolean>(false);
  const [selectItemOpened, setSelectItemOpened] = useState<boolean>(false);
  const [createLoot] = useMutation<Mutation, CreateLootVariables>(CREATE_LOOT);
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
    setItemIdToAdd("");
    setItemToAdd(null);
    setRestrictedClassIds([]), setPlayerIdToAdd("");
    setOpen(false);
  };

  const handleOpenSelectItem = (): void => {
    setSelectItemOpened(true);
  };
  const handleCloseSelectItem = (): void => {
    setSelectItemOpened(false);
  };
  const handleCloseSelectClass = (): void => {
    setSelectClassOpened(false);
  };
  const handleOpenSelectClass = (): void => {
    setSelectClassOpened(true);
  };
  const handleChangeSelectItem = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setPlayerIdToAdd("");
    setItemIdToAdd(event.target.value.toString());
    if (loots.length > 0) {
      const itemChosen = loots.filter(
        item => item.itemByItemId.id === parseInt(event.target.value)
      );
      if (itemChosen.length > 0) {
        setItemToAdd(itemChosen[0]);
        if (itemChosen[0].itemByItemId.classByClassId) {
          setRestrictedClassIds([itemChosen[0].itemByItemId.classByClassId.id]);
        } else {
          const classIds = [];
          itemChosen[0].itemByItemId.classItemsByItemId.nodes.forEach(
            playerClass => {
              classIds.push(playerClass.classByClassId.id);
            }
          );
          setRestrictedClassIds(classIds);
        }
      }
    }
  };
  const handleChangeSelectClass = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setClassIdToAdd(event.target.value.toString());
  };
  const handleChangeSelectPlayer = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setPlayerIdToAdd(event.target.value.toString());
  };
  const handleChangeNewPlayerInput = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setNewPlayerInputValue(event.target.value as string);
  };

  const handleOpenSelectPlayer = (): void => {
    setSelectPlayerOpened(true);
  };
  const handleCloseSelectPlayer = (): void => {
    setSelectPlayerOpened(false);
  };

  const addNewPlayerAndLoot = () => {
    if (
      itemIdToAdd.length > 0 &&
      newPlayerInputValue.length > 0 &&
      classIdToAdd !== "0"
    ) {
      setAddLootIsLoading(true);
      setPlayerIdToAdd("");
      if (
        !allPlayers.some(
          (player: Player) => player.name === newPlayerInputValue
        )
      ) {
        createPlayer({
          variables: {
            classId: parseInt(classIdToAdd),
            name: newPlayerInputValue,
            role: "player"
          }
        })
          .then(resp => {
            refetchAllPlayers()
              .then(() => {
                addLoot(resp.data.createPlayer.player.id);
              })
              .catch(err => {
                setOpen(false);
                setAddLootIsLoading(false);
                openSnackBar(err.message, "error");
              });
          })
          .catch(err => {
            setOpen(false);
            setAddLootIsLoading(false);
            openSnackBar(err.message, "error");
          });
      } else {
        setAddLootIsLoading(false);
        openSnackBar("Ce joueur existe déja.", "error");
      }
    } else {
      if (itemIdToAdd.length === 0) {
        openSnackBar("Selectionnez un item", "error");
      } else if (newPlayerInputValue.length === 0) {
        openSnackBar("Tappez le pseudo du joueur", "error");
      } else {
        openSnackBar("Selectionnez une classe", "error");
      }
    }
  };
  const addLoot = newPlayerId => {
    if (itemIdToAdd.length > 0 && (newPlayerId || playerIdToAdd)) {
      setAddLootIsLoading(true);
      setRestrictedClassIds([]);
      createLoot({
        variables: {
          playerId: parseInt(newPlayerId || playerIdToAdd),
          itemId: parseInt(itemIdToAdd),
          raidId,
          bossId,
          lastActionBy: member.name,
          lastActionDate: new Date().toLocaleDateString("fr-FR", {
            hour: "2-digit",
            minute: "2-digit"
          })
        }
      })
        .then(resp => {
          setOpen(false);
          setAddLootIsLoading(false);
          setItemIdToAdd("");
          setPlayerIdToAdd("");
          openSnackBar(
            `${resp.data.createLoot.itemByItemId.name} assigné à ${resp.data.createLoot.playerByPlayerId.name}`,
            "success"
          );
          refetchOneRaid()
            .then(() => {
              scrollDown();
            })
            .catch(err => {
              openSnackBar(err.message, "error");
            });
        })
        .catch(err => {
          setOpen(false);
          setAddLootIsLoading(false);
          setItemIdToAdd("");
          setPlayerIdToAdd("");
          openSnackBar(err.message, "error");
        });
    } else {
      openSnackBar("Selectionnez un item et un joueur.", "error");
    }
  };
  const toggleSwitchRestrictPlayerList = () => {
    setRestrictPlayerList(!restrictPlayerList);
  };
  const toggleSwitchNewPlayerInput = () => {
    setShowNewPlayerInput(!showNewPlayerInput);
    setNewPlayerInputValue("");
    setPlayerIdToAdd("");
  };

  return (
    <div>
      <Fab size="small" color="primary" aria-label="add" onClick={handleOpen}>
        <AddIcon />
      </Fab>
      <Dialog
        maxWidth={"lg"}
        open={open}
        keepMounted={true}
        onClose={handleClose}
        aria-labelledby="add-loot-dialog"
        aria-describedby="add loot window"
      >
        <DialogTitle id="add-loot-dialog">
          {"Ajouter un loot sur: " + bossName}
        </DialogTitle>
        {addLootIsLoading && (
          <LinearProgress className={classes.linearProgress} variant="query" />
        )}
        <DialogContent className={classes.lootInfoSelects}>
          <FormControl>
            <InputLabel htmlFor="demo-controlled-open-select">Item</InputLabel>
            <Select
              className={classes.selectItem}
              open={selectItemOpened}
              onClose={handleCloseSelectItem}
              onOpen={handleOpenSelectItem}
              value={itemIdToAdd}
              onChange={handleChangeSelectItem}
            >
              {loots.map(item => {
                return (
                  <MenuItem
                    key={item.itemByItemId.id}
                    value={item.itemByItemId.id}
                  >
                    {item.itemByItemId.name}
                  </MenuItem>
                );
              })}
            </Select>
          </FormControl>

          <ForwardIcon color="primary" className={classes.fleche} />

          {showNewPlayerInput ? (
            <>
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
                }>
                {wowClasses.map(wowClass => {
                  return (
                    <MenuItem key={wowClass.id} value={wowClass.id}>
                      {wowClass.name}
                    </MenuItem>
                  );
                })}
              </Select>
            </>
          ) : (
            <FormControl>
              <InputLabel htmlFor="demo-controlled-open-select">
                Player
              </InputLabel>
              <Select
                className={classes.selectPlayer}
                open={selectPlayerOpened}
                onClose={handleCloseSelectPlayer}
                onOpen={handleOpenSelectPlayer}
                value={playerIdToAdd}
                onChange={handleChangeSelectPlayer}
              >
                {allPlayers
                  .filter((player: Player) => {
                    if (
                      restrictedClassIds.length === 0 ||
                      !restrictPlayerList
                    ) {
                      return true;
                    }
                    return restrictedClassIds.indexOf(player.classId) !== -1;
                  })
                  .map((player: Player) => {
                    return (
                      <MenuItem
                        style={{
                          borderLeft:
                            "solid 4px " +
                            (player.classByClassId.id === 1
                              ? "grey"
                              : player.classByClassId.color),
                          margin: 2
                        }}
                        key={player.id}
                        value={player.id}
                      >
                        {player.name}
                      </MenuItem>
                    );
                  })}
              </Select>
            </FormControl>
          )}
        </DialogContent>
        <div className={classes.lootToAddAvatars}>
          {itemToAdd &&
            (!itemToAdd.itemByItemId.classByClassId ? (
              itemToAdd.itemByItemId.classItemsByItemId.nodes.map(
                playerClass => (
                  <ClassAvatar
                    key={
                      playerClass.classByClassId.id +
                      itemToAdd.itemByItemId.name
                    }
                    playerClass={playerClass.classByClassId.name}
                    prio={playerClass.prio}
                  />
                )
              )
            ) : (
              <ClassAvatar
                playerClass={itemToAdd.itemByItemId.classByClassId.name}
              />
            ))}
        </div>
        <DialogActions
          classes={{
            root: classes.dialogActions
          }}
        >
          <div className={classes.switch}>
            {!showNewPlayerInput && (
              <>
                <div onClick={toggleSwitchRestrictPlayerList}>
                  Choix restreint:
                </div>
                <Switch
                  size="small"
                  checked={restrictPlayerList}
                  onChange={toggleSwitchRestrictPlayerList}
                />{" "}
              </>
            )}
          </div>
          <div className={classes.switch}>
            <div onClick={toggleSwitchNewPlayerInput}>Nouveau joueur:</div>
            <Switch
              size="small"
              checked={showNewPlayerInput}
              onChange={toggleSwitchNewPlayerInput}
            />
          </div>
          <Button onClick={handleClose} color="primary">
            ANNULER
          </Button>
          <Button
            onClick={() => {
              showNewPlayerInput ? addNewPlayerAndLoot() : addLoot(null);
            }}
            color="primary"
          >
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
