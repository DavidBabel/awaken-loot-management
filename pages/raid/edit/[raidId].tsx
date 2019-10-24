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
import { green } from "@material-ui/core/colors";

import { makeStyles, Theme, withStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import CloseIcon from "@material-ui/icons/Close";
import { useRouter } from "next/router";
import {
  forwardRef,
  MutableRefObject,
  useContext,
  useEffect,
  useState
} from "react";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { BossCard } from "../../../components/Raid/BossCard";
import PlayerList from "../../../components/Raid/PlayerList";
import MemberContext from "../../../lib/context/member";
import { BossItem, Mutation, Query } from "../../../lib/generatedTypes";
import { CREATE_LOOT } from "../../../lib/gql/loot-mutations";
import { ONE_RAID } from "../../../lib/gql/raid-queries";
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
const useStyles = makeStyles({
  root: {
    width: "100%",
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center"
  },
  raidInfos: {
    width: "80%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    padding: "10px 0",
    marginBottom: 20
  },
  raidTitle: {
    fontSize: 22,
    fontWeight: "bold",
    marginRight: 20
  },
  selectItem: {
    minWidth: 200,
    margin: 10
  },
  selectPlayer: {
    minWidth: 150,
    margin: 10
  },
  snackError: {
    backgroundColor: "#D32F2F"
  },
  snackSuccess: {
    backgroundColor: "#43A047"
  }
});

const GreenButton = withStyles((theme: Theme) => ({
  root: {
    color: theme.palette.getContrastText(green[500]),
    marginLeft: 20,
    backgroundColor: green[500],
    "&:hover": {
      backgroundColor: green[700]
    }
  }
}))(Button);

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
  const [playerListOpened, setPlayerListOpened] = useState<boolean>(false);
  const [addLootOpened, setAddLootOpened] = useState<boolean>(false);
  const [selectItemOpened, setSelectItemOpened] = useState<boolean>(false);
  const [dialogItems, setDialogItems] = useState<BossItem[]>([]);
  const [selectPlayerOpened, setSelectPlayerOpened] = useState<boolean>(false);
  const [itemIdToAdd, setItemIdToAdd] = useState<string>("");
  const [playerIdToAdd, setPlayerIdToAdd] = useState<string>("");
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
  const handleOpenPlayerList = () => {
    setPlayerListOpened(true);
  };
  const handleClosePlayerList = () => {
    setPlayerListOpened(false);
  };
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
    setPlayerIdToAdd("");
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
    setItemIdToAdd(event.target.value as string);
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
          refetch();
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
  const { loading, data, error, refetch } = useQuery<Query, QueryVariables>(
    ONE_RAID,
    {
      variables: { raidId }
    }
  );
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentRaid = data.allRaids.nodes[0];
  const loots = currentRaid.lootsByRaidId.nodes;
  const allPlayers = currentRaid.raidPlayersByRaidId.nodes
    .sort((a, b) =>
      a.playerByPlayerId.name > b.playerByPlayerId.name ? 1 : -1
    )
    .sort(raidPlayerByClass);
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
  }, [data]);
  return (
    <div className={classes.root}>
      <Paper className={classes.raidInfos}>
        <div className={classes.raidTitle}>
          {new Date(currentRaid.date).toLocaleDateString("fr-FR") +
            " | " +
            currentRaid.donjonByDonjonId.name}
        </div>

        <Button
          variant="contained"
          color="primary"
          onClick={handleOpenPlayerList}
        >
          JOUEURS
        </Button>
        <GreenButton color="primary">EDITER JOUEURS</GreenButton>
      </Paper>
      {bosses.map(boss => {
        const lootedForThisBoss = [...loots].filter((loot): boolean => {
          return (
            ((!loot.bossId &&
              loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
              loot.itemByItemId.bossItemsByItemId.nodes.some(
                bossItem => bossItem.bossByBossId.id === boss.id
              )) ||
              loot.bossId === boss.id) &&
            loot.active
          );
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
      <Dialog
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
        <DialogContent>
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
              {allPlayers.map(player => {
                return (
                  <MenuItem
                    style={{
                      borderLeft:
                        "solid 4px " +
                        player.playerByPlayerId.classByClassId.color,
                      margin: 2
                    }}
                    key={player.playerByPlayerId.id}
                    value={player.playerByPlayerId.id}
                  >
                    {player.playerByPlayerId.name}
                  </MenuItem>
                );
              })}
            </Select>
          </FormControl>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleCloseAddItemWindow} color="primary">
            CANCEL
          </Button>
          <Button onClick={addLoot} color="primary">
            ADD
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
        handleClose={handleClosePlayerList}
        open={playerListOpened}
        players={allPlayers}
      />
    </div>
  );
}
