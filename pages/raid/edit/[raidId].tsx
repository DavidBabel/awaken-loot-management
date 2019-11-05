import { useMutation, useQuery } from "@apollo/react-hooks";
import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  IconButton,
  InputLabel,
  MenuItem,
  Paper,
  Select,
  Slide,
  Snackbar,
  SnackbarContent
} from "@material-ui/core";
import Button from "@material-ui/core/Button";
// import { green } from "@material-ui/core/colors";

// import { makeStyles, Theme, withStyles } from "@material-ui/core/styles";

import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import CloseIcon from "@material-ui/icons/Close";

import ForwardIcon from "@material-ui/icons/Forward";
import { useRouter } from "next/router";
import {
  forwardRef,
  MutableRefObject,
  useContext,
  useEffect,
  useState
} from "react";
import ClassAvatar from "../../../components/ClassAvatar";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { BossCard } from "../../../components/Raid/BossCard";
import PlayerList from "../../../components/Raid/PlayerList";
import RaidTitleButton from "../../../components/Raid/RaidTitleButton";
import MemberContext from "../../../lib/context/member";
import {
  BossItem,
  Mutation,
  Player,
  Query,
  RaidPlayer
} from "../../../lib/generatedTypes";
import { CREATE_LOOT } from "../../../lib/gql/loot-mutations";
import { ALL_PLAYERS } from "../../../lib/gql/player-queries";
import { ONE_RAID } from "../../../lib/gql/raid-queries";
import { useToggle } from "../../../lib/hooks/toggle";
import { raidPlayerByClass } from "../../../lib/utils/sorter";

interface QueryVariables {
  raidId: number;
}
interface CreateLootVariables {
  playerId: number;
  itemId: number;
  raidId: number;
  bossId: number;
  lastActionBy: string;
  lastActionDate: string;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center"
    },
    raidInfos: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      padding: "10px 0",
      marginBottom: 35,
      position: "relative"
    },
    raidTitle: {
      fontSize: 22,
      fontWeight: "bold",
      margin: "0px 25px 15px 25px",
      display: "flex",
      alignItems: "center"
    },
    playerListBtn: {
      position: "absolute",
      top: "65px",
      zIndex: 4
    },
    bossCards: {
      width: "100%",
      display: "flex",
      flexWrap: "wrap",
      justifyContent: "center"
    },
    selectItem: {
      minWidth: 200,
      [theme.breakpoints.down("sm")]: {
        minWidth: 100,
        marginRight: 8
      }
    },
    fleche: {
      alignSelf: "flex-end",
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
    lootInfoSelects: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center"
    },
    lootToAddAvatars: {
      position: "relative",
      display: "flex",
      justifyContent: "center",
      width: "100%"
    },
    snackError: {
      backgroundColor: "#D32F2F"
    },
    snackSuccess: {
      backgroundColor: "#43A047"
    }
  })
);

// const GreenButton = withStyles((theme: Theme) => ({
//   root: {
//     color: theme.palette.getContrastText(green[500]),
//     marginLeft: 20,
//     backgroundColor: green[500],
//     "&:hover": {
//       backgroundColor: green[700]
//     }
//   }
// }))(Button);

// tslint:disable-next-line:no-shadowed-variable
const Transition = forwardRef<unknown, TransitionProps>(function Transition(
  props,
  ref
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function PageRaidView() {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));
  const [raidTitle, setRaidTitle] = useState<string>("");
  const [playerListOpened, togglePlayerListOpened] = useToggle(false);
  const [addLootOpened, setAddLootOpened] = useState<boolean>(false);
  const [selectItemOpened, setSelectItemOpened] = useState<boolean>(false);
  const [dialogItems, setDialogItems] = useState<BossItem[]>([]);
  const [selectPlayerOpened, setSelectPlayerOpened] = useState<boolean>(false);
  const [itemIdToAdd, setItemIdToAdd] = useState<string>("");
  const [itemToAdd, setItemToAdd] = useState<BossItem>(null);
  const [playerIdToAdd, setPlayerIdToAdd] = useState<string>("");
  const [restrictedClassIds, setRestrictedClassIds] = useState<number[]>([]);
  const [bossIdSelected, setBossIdSelected] = useState<string>("");
  const [bossNameSelected, setBossNameSelected] = useState<string>("");
  const [snackBarOpened, setSnackBarOpened] = useState<boolean>(false);
  const [snackBarMsg, setSnackBarMsg] = useState<string>("");
  const [snackBarClass, setSnackBarClass] = useState<string>(
    classes.snackError
  );
  const [currentBossCardContentElem, setCurrentBossCardContentElem] = useState<
    MutableRefObject<any>
  >(null);
  const lootsAssigned = [];
  const handleOpenAddItemWindow = (
    bossId: string,
    bossName: string,
    bossCardContentElem: MutableRefObject<any>
  ): void => {
    setCurrentBossCardContentElem(bossCardContentElem);
    setBossIdSelected(bossId);
    setBossNameSelected(bossName);
    setAddLootOpened(true);
  };

  const handleCloseAddItemWindow = (): void => {
    setItemIdToAdd("");
    setItemToAdd(null);
    setRestrictedClassIds([]), setPlayerIdToAdd("");
    setBossIdSelected("");
    setBossNameSelected("");
    setAddLootOpened(false);
  };

  const handleOpenSelectItem = (): void => {
    setSelectItemOpened(true);
  };
  const handleCloseSelectItem = (): void => {
    setSelectItemOpened(false);
  };
  const handleChangeSelectItem = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setPlayerIdToAdd("");
    setItemIdToAdd(event.target.value as string);
    if (dialogItems.length > 0) {
      const itemChosen = dialogItems.filter(
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
  const handleChangeSelectPlayer = (
    event: React.ChangeEvent<{ value: string }>
  ): void => {
    setPlayerIdToAdd(event.target.value as string);
  };

  const handleOpenSelectPlayer = (): void => {
    setSelectPlayerOpened(true);
  };
  const handleCloseSelectPlayer = (): void => {
    setSelectPlayerOpened(false);
  };

  const addLoot = () => {
    if (itemIdToAdd && playerIdToAdd && bossIdSelected) {
      setAddLootOpened(false);
      setItemIdToAdd("");
      setPlayerIdToAdd("");
      setBossIdSelected("");
      setBossNameSelected("");
      setRestrictedClassIds([]);
      setSnackBarOpened(false);
      // FONCTION MUTATION AJOUT ITEM ICI
      createLoot({
        variables: {
          playerId: parseInt(playerIdToAdd),
          itemId: parseInt(itemIdToAdd),
          raidId,
          bossId: parseInt(bossIdSelected),
          lastActionBy: member.name,
          lastActionDate: new Date().toLocaleDateString("fr-FR", {
            hour: "2-digit",
            minute: "2-digit"
          })
        }
      })
        .then(resp => {
          openSnackBar(
            `${resp.data.createLoot.itemByItemId.name} assigné à ${resp.data.createLoot.playerByPlayerId.name}`,
            "success"
          );
          refetchOneRaid();
        })
        .catch(err => {
          openSnackBar(err.message, "error");
        });
    } else {
      openSnackBar("Selectionnez un item et un joueur.", "error");
    }
  };
  const openSnackBar = (msg, action) => {
    if (action === "error") {
      setSnackBarClass(classes.snackError);
    } else {
      setSnackBarClass(classes.snackSuccess);
    }
    setSnackBarMsg(msg);
    setSnackBarOpened(true);
  };

  const closeSnackBar = (
    event: React.SyntheticEvent | React.MouseEvent,
    reason?: string
  ) => {
    if (reason === "clickaway") {
      return;
    }

    setSnackBarOpened(false);
  };

  const {
    loading: loadingOneRaid,
    data: dataOneRaid,
    error: errorOneRaid,
    refetch: refetchOneRaid
  } = useQuery<Query, QueryVariables>(ONE_RAID, {
    variables: { raidId }
  });
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_PLAYERS);
  const error = errorOneRaid || errorPlayers;
  const loading = loadingOneRaid || loadingPlayers;
  if (loadingOneRaid || loadingPlayers || errorOneRaid || errorPlayers) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentRaid = dataOneRaid.allRaids.nodes[0];
  const loots = currentRaid.lootsByRaidId.nodes;
  const currentRaidPlayers = currentRaid.raidPlayersByRaidId.nodes
    .sort((a: RaidPlayer, b: RaidPlayer) =>
      a.playerByPlayerId.name > b.playerByPlayerId.name ? 1 : -1
    )
    .sort(raidPlayerByClass);
  const allPlayers = dataPlayers.allPlayers.nodes
    .filter((player: Player) => player.active)
    .sort((a: Player, b: Player) => (a.name > b.name ? 1 : -1))
    .sort((a: Player, b: Player) => {
      const p1Class = a.classByClassId.id;
      const p2Class = b.classByClassId.id;
      if (p1Class === p2Class) {
        return a.name < b.name ? -1 : 1;
      }
      return p1Class - p2Class;
    });
  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  const donjonShortName = currentRaid.donjonByDonjonId.shortName;

  const [
    createLoot
    // { loading: mutationLoading, data: mutationData }
  ] = useMutation<Mutation, CreateLootVariables>(CREATE_LOOT);

  useEffect(() => {
    if (currentBossCardContentElem) {
      // Scroll tout en bas d'une liste de loot quand un item est ajouté
      if (currentBossCardContentElem.current.scrollBy) {
        currentBossCardContentElem.current.scrollBy({
          top: currentBossCardContentElem.current.scrollHeight,
          left: 0,
          behavior: "smooth"
        });
      } else {
        currentBossCardContentElem.current.scrollTop =
          currentBossCardContentElem.current.offsetHeight;
      }
    }
    setRaidTitle(currentRaid.title);
  }, [dataOneRaid]);
  return (
    <div className={classes.root}>
      <Paper className={classes.raidInfos}>
        <div className={classes.raidTitle}>
          <div>
            {new Date(currentRaid.date).toLocaleDateString("fr-FR") +
              " | " +
              currentRaid.donjonByDonjonId.name +
              (raidTitle ? " (" + raidTitle + ")" : "")}
          </div>
          <RaidTitleButton
            raid={currentRaid}
            openSnackBar={openSnackBar}
            setRaidTitle={setRaidTitle}
          />
        </div>
        <Button
          className={classes.playerListBtn}
          variant="contained"
          color="primary"
          onClick={togglePlayerListOpened}
        >
          JOUEURS
        </Button>
        {/* <GreenButton color="primary">EDITER JOUEURS</GreenButton> */}
      </Paper>
      <div className={classes.bossCards}>
        {bosses.map(boss => {
          const lootedForThisBoss = loots.filter((loot): boolean => {
            return (
              ((!loot.bossId &&
                loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
                loot.itemByItemId.bossItemsByItemId.nodes.some(
                  bossItem => bossItem.bossByBossId.id === boss.id
                )) ||
                loot.bossId === boss.id) &&
              loot.active &&
              lootsAssigned.indexOf(loot) === -1
            );
          });
          loots.forEach(loot => {
            // permet de stocker les loots deja assignés et de les checks pour qu'ils n'apparaissent pas plusieurs fois (ca sert seulement pour les loots qui n'ont pas de bossId)
            if (
              !loot.bossId &&
              loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
              loot.itemByItemId.bossItemsByItemId.nodes.some(
                bossItem => bossItem.bossByBossId.id === boss.id
              ) &&
              loot.active
            ) {
              lootsAssigned.push(loot);
            }
          });
          return (
            <BossCard
              key={boss.id}
              {...boss}
              openLootWindow={handleOpenAddItemWindow}
              donjonShortName={donjonShortName}
              looted={lootedForThisBoss}
              setDialogItems={setDialogItems}
              openSnackBar={openSnackBar}
            />
          );
        })}
      </div>
      <Dialog
        maxWidth={"lg"}
        open={addLootOpened}
        TransitionComponent={Transition}
        keepMounted={true}
        onClose={handleCloseAddItemWindow}
        aria-labelledby="add-loot-dialog"
        aria-describedby="add loot window"
      >
        <DialogTitle id="add-loot-dialog">
          {"Ajouter un loot sur: " + bossNameSelected}
        </DialogTitle>
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
              {dialogItems.map(item => {
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
                  if (restrictedClassIds.length === 0) {
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
        <DialogActions>
          <Button onClick={handleCloseAddItemWindow} color="primary">
            ANNULER
          </Button>
          <Button onClick={addLoot} color="primary">
            AJOUTER
          </Button>
        </DialogActions>
      </Dialog>
      <Snackbar
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center"
        }}
        open={snackBarOpened}
        autoHideDuration={3000}
        onClose={closeSnackBar}
      >
        <SnackbarContent
          className={snackBarClass}
          message={<span id="message-id">{snackBarMsg}</span>}
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
      <PlayerList
        handleClose={togglePlayerListOpened}
        open={playerListOpened}
        players={currentRaidPlayers}
      />
    </div>
  );
}
