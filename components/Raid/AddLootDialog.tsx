import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  // Fab,
  FormControl,
  Grid,
  InputLabel,
  LinearProgress,
  MenuItem,
  Select,
  Switch,
  TextField,
  Typography
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
// import { Add as AddIcon } from "@material-ui/icons";
import ForwardIcon from "@material-ui/icons/Forward";
import { ApolloQueryResult } from "apollo-boost";
import { useState } from "react";
import ClassAvatar from "../../components/ClassAvatar";
import { getClassColor } from "../../lib/constants/class-colors";
import { wowClasses } from "../../lib/constants/classes";
import { useMemberContext } from "../../lib/context/member";
import {
  BossItem,
  Loot,
  Mutation,
  Player,
  Query,
  RaidPlayer
} from "../../lib/generatedTypes";
import {
  CREATE_LOOT,
  CreateLootVariables,
  UPDATE_LOOT,
  UpdateLootVariables
} from "../../lib/gql/loot-mutations";
import { CREATE_PLAYER } from "../../lib/gql/player-mutations";
import { formatDate } from "../../lib/utils/date";
import {
  showErrorMessage,
  showSuccessMessage
} from "../../lib/utils/snackbars/snackbarService";
import { LootScore } from "../../pages/raid/edit/[raidId]";
import CONFIG from "../../server/config";

interface CreatePlayerVariables {
  classId: number;
  name: string;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    dialog: {
      [theme.breakpoints.down("sm")]: {
        "& .MuiDialog-paperWidthLg": {
          maxWidth: "1000px",
          width: "100%",
          margin: 0
        }
      }
    },
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
      alignSelf: "flex-start",

      [theme.breakpoints.down("sm")]: {
        "& *": {
          fontSize: 10,
          lineHeight: "12px"
        }
      }
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
    note: { textAlign: "center" },
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
    },
    unasignedLink: {
      color: "white",
      textDecoration: "none",
      cursor: "pointer",
      height: 46,
      lineHeight: "25px",
      textAlign: "center"
    }
  })
);

interface Props {
  allPlayers: Player[];
  loots: BossItem[];
  preSelectedLoot?: Loot;
  raidId: number;
  bossId: number;
  bossName: string;
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
  scrollDown: () => void;
  currentRaidPlayers: RaidPlayer[];
  lootScore: LootScore;
}

export default function AddLootDialog({
  allPlayers,
  loots,
  preSelectedLoot,
  raidId,
  bossId,
  bossName,
  refetchOneRaid,
  refetchAllPlayers,
  scrollDown,
  lootScore,
  currentRaidPlayers
}: Props) {
  const member = useMemberContext();
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
  const [updateLoot] = useMutation<Mutation, UpdateLootVariables>(UPDATE_LOOT);
  const [createPlayer] = useMutation<Mutation, CreatePlayerVariables>(
    CREATE_PLAYER
  );

  const currentPlayerList = currentRaidPlayers.map(
    crp => crp.playerByPlayerId.name
  );

  const handleOpen = (): void => {
    setOpen(true);
    if (preSelectedLoot) {
      setSelectPlayerOpened(true);
    }
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
  function setItemIdToAddInForm(value: string) {
    setPlayerIdToAdd("");
    setItemIdToAdd(value.toString());
    if (loots.length > 0) {
      const itemChosen = loots.filter(
        item => item.itemByItemId.id === parseInt(value)
      );
      if (itemChosen.length > 0) {
        setItemToAdd(itemChosen[0]);
        // if (itemChosen[0].itemByItemId.classByClassId) {
        //   setRestrictedClassIds([itemChosen[0].itemByItemId.classByClassId.id]);
        // } else {
        const classIds = [];
        itemChosen[0].itemByItemId.classItemsByItemId.nodes.forEach(
          playerClass => {
            classIds.push(playerClass.classByClassId.id);
          }
        );
        setRestrictedClassIds(classIds);
        // }
      }
    }
  }
  const handleChangeSelectItem = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setItemIdToAddInForm(event.target.value);
  };
  if (preSelectedLoot && !itemToAdd) {
    setItemIdToAddInForm(preSelectedLoot.itemByItemId.id.toString());
  }
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
          (player: Player) =>
            player.name.toLowerCase() === newPlayerInputValue.toLowerCase()
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
                addLoot(resp.data.createPlayer.player.id);
              })
              .catch(err => {
                setOpen(false);
                setAddLootIsLoading(false);
                showErrorMessage("Err30 - " + err.message);
              });
          })
          .catch(err => {
            setOpen(false);
            setAddLootIsLoading(false);
            showErrorMessage("Err31 - " + err.message);
          });
      } else {
        setAddLootIsLoading(false);
        showErrorMessage("Err32 - " + "Ce joueur existe déja.");
      }
    } else {
      if (itemIdToAdd.length === 0) {
        showErrorMessage("Err30 - " + "Selectionnez un item");
      } else if (newPlayerInputValue.length === 0) {
        showErrorMessage("Err31 - " + "Tapez le pseudo du joueur");
      } else {
        showErrorMessage("Err32 - " + "Selectionnez une classe");
      }
    }
  };
  function addLoot(newPlayerId: any) {
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
          lastActionType: "add",
          lastActionDate: formatDate()
        }
      })
        .then(resp => {
          if (preSelectedLoot) {
            updateLoot({
              variables: {
                id: preSelectedLoot.id,
                active: false,
                lastActionBy: member.name,
                lastActionDate: formatDate(),
                actionType: "delete"
              }
            }).catch(err => {
              showErrorMessage("Err40 - " + err.message);
            });
          }
          setOpen(false);
          setAddLootIsLoading(false);
          setItemIdToAdd("");
          setPlayerIdToAdd("");
          showSuccessMessage(
            `${resp.data.createLoot.itemByItemId.name} assigné à ${resp.data.createLoot.playerByPlayerId.name}`
          );
          refetchOneRaid()
            .then(() => {
              scrollDown();
            })
            .catch(err => {
              showErrorMessage("Err41 - " + err.message);
            });
        })
        .catch(err => {
          setOpen(false);
          setAddLootIsLoading(false);
          setItemIdToAdd("");
          setPlayerIdToAdd("");
          showErrorMessage("Err42 - " + err.message);
        });
    } else {
      showErrorMessage("Err43 - " + "Selectionnez un item et un joueur.");
    }
  }
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
      {preSelectedLoot ? (
        <a onClick={handleOpen} className={classes.unasignedLink}>
          Non assigné
        </a>
      ) : (
        <></>
        // <Fab size="small" color="primary" aria-label="add" onClick={handleOpen}>
        //   <AddIcon />
        // </Fab>
      )}
      <Dialog
        className={classes.dialog}
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
                const itemStyle = {
                  margin: 2,
                  borderLeft: "4px solid transparent"
                };

                // if (item.itemByItemId.classId) {
                //   const playerColor =
                //     item.itemByItemId.classId === 1
                //       ? "grey"
                //       : item.itemByItemId.classByClassId.color;
                //   itemStyle = {
                //     borderLeft: "solid 4px " + playerColor,
                //     margin: 2
                //   };
                // }

                return (
                  <MenuItem
                    key={`loot-list-${item.itemByItemId.id}`}
                    style={itemStyle}
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
                {wowClasses.map(wowClass => {
                  return (
                    <MenuItem
                      key={`menuitem-classlist${wowClass.id}`}
                      value={wowClass.id}
                    >
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
                  // select only present players
                  .filter((player: Player) =>
                    currentPlayerList.includes(player.name)
                  )
                  // filter by class priority
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
                    const playerScore = lootScore[player.name];
                    let bonusMalus = 0;
                    if (playerScore) {
                      bonusMalus += playerScore.malus;
                      if (playerScore.bonus[itemIdToAdd]) {
                        bonusMalus += playerScore.bonus[itemIdToAdd];
                      }
                    }

                    const bonusMalusToDisplay =
                      bonusMalus === 0 ? (
                        <></>
                      ) : bonusMalus > 0 ? (
                        <span
                          style={{
                            color: "green",
                            position: "absolute",
                            right: 20
                          }}
                        >
                          {bonusMalus}
                        </span>
                      ) : (
                        <span
                          style={{
                            color: "red",
                            position: "absolute",
                            right: 20
                          }}
                        >
                          {bonusMalus}
                        </span>
                      );
                    return (
                      <MenuItem
                        style={{
                          borderLeft:
                            "solid 4px " +
                            getClassColor(player.classByClassId.name),
                          margin: 2
                        }}
                        key={`addlootplayer-${player.id}`}
                        value={player.id}
                      >
                        {player.name} {bonusMalusToDisplay}
                      </MenuItem>
                    );
                  })}
              </Select>
            </FormControl>
          )}
        </DialogContent>
        {itemToAdd?.itemByItemId?.classItemsByItemId?.nodes[0]?.comment && (
          <div className={classes.note}>
            <Typography>
              <b>Note:</b>{" "}
              {itemToAdd?.itemByItemId?.classItemsByItemId?.nodes[0]?.comment}
            </Typography>
          </div>
        )}
        <div className={classes.lootToAddAvatars}>
          {itemToAdd &&
            // (!itemToAdd.itemByItemId.classByClassId ? (
            itemToAdd.itemByItemId.classItemsByItemId.nodes.map(playerClass => (
              <ClassAvatar
                key={`classavatar${playerClass.classByClassId.id +
                  itemToAdd.itemByItemId.name}`}
                playerClass={playerClass.classByClassId.name}
              />
            ))
          // ) : (
          //   <ClassAvatar
          //     playerClass={itemToAdd.itemByItemId.classByClassId.name}
          //   />
          // ))
          }
        </div>
        <Grid
          container
          style={{ marginLeft: 15, marginTop: 15, marginBottom: -15 }}
        >
          <div className={classes.switch}>
            {!showNewPlayerInput && (
              <>
                <div onClick={toggleSwitchRestrictPlayerList}>
                  Voir toutes les classes:
                </div>
                <Switch
                  size="small"
                  checked={!restrictPlayerList}
                  onChange={toggleSwitchRestrictPlayerList}
                />{" "}
              </>
            )}
          </div>
          <div className={classes.switch}>
            <div onClick={toggleSwitchNewPlayerInput}>
              Créer un nouveau joueur:
            </div>
            <Switch
              size="small"
              checked={showNewPlayerInput}
              onChange={toggleSwitchNewPlayerInput}
            />
          </div>
        </Grid>
        <DialogActions
          classes={{
            root: classes.dialogActions
          }}
        >
          <Button onClick={handleClose} color="primary">
            ANNULER
          </Button>
          {!preSelectedLoot && (
            <Button
              onClick={() => addLoot(CONFIG.ID_UNASSIGNED)}
              color="primary"
            >
              AJOUT NON ASSIGNÉ
            </Button>
          )}
          <Button
            onClick={() => {
              showNewPlayerInput ? addNewPlayerAndLoot() : addLoot(null);
            }}
            color="primary"
          >
            {preSelectedLoot ? "ATTRIBUER LE LOOT" : "AJOUTER LE LOOT"}
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}
