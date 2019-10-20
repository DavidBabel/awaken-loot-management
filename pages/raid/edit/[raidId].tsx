import { useQuery } from "@apollo/react-hooks";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import FormControl from "@material-ui/core/FormControl";
import IconButton from "@material-ui/core/IconButton";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import Select from "@material-ui/core/Select";
import Slide from "@material-ui/core/Slide";
import Snackbar from "@material-ui/core/Snackbar";
import SnackbarContent from "@material-ui/core/SnackbarContent";
import { makeStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import CloseIcon from "@material-ui/icons/Close";
import { useRouter } from "next/router";
import { forwardRef, useState } from "react";
import { BossCard } from "../../../components/BossCard";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { BossItem, Query } from "../../../lib/generatedTypes";
import { ONE_RAID } from "../../../lib/gql/raid-queries";

interface Variables {
  raidId: number;
}
const useStyles = makeStyles({
  root: {
    width: "100%",
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center"
  },
  selectItem: {
    minWidth: 200
  },
  selectPlayer: {
    minWidth: 150
  },
  snackError: {
    backgroundColor: "#D32F2F"
  },
  snackSuccess: {
    backgroundColor: "#43A047"
  }
});

const Transition = forwardRef<unknown, TransitionProps>(function Transition(
  props,
  ref
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function PageRaidView() {
  const classes = useStyles("");
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));
  const [addLootOpened, setAddLootOpened] = useState<boolean>(false);
  const [selectItemOpened, setSelectItemOpened] = useState<boolean>(false);
  const [dialogItems, setDialogItems] = useState<BossItem[]>([]);
  const [selectPlayerOpened, setSelectPlayerOpened] = useState<boolean>(false);
  const [itemIdToAdd, setItemIdToAdd] = useState<string>("");
  const [playerIdToAdd, setPlayerIdToAdd] = useState<string>("");
  const [bossIdSelected, setBossIdSelected] = useState<string>("");
  const [bossNameSelected, setBossNameSelected] = useState<string>("");
  const [snackBarOpened, SetSnackBarOpened] = useState<boolean>(false);
  const [snackBarMsg, setSnackBarMsg] = useState<string>("");
  const [snackBarClass, setSnackBarClass] = useState<string>(
    classes.snackError
  );

  const handleOpenAddItemWindow = (bossId: string, bossName: string): void => {
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
    event: React.ChangeEvent<{ value: unknown }>
  ): void => {
    setItemIdToAdd(event.target.value as string);
  };
  const handleOpenSelectPlayer = (): void => {
    setSelectPlayerOpened(true);
  };
  const handleCloseSelectPlayer = (): void => {
    setSelectPlayerOpened(false);
  };
  const handleChangeSelectPlayer = (
    event: React.ChangeEvent<{ value: unknown }>
  ): void => {
    setPlayerIdToAdd(event.target.value as string);
  };
  const addLoot = () => {
    if (itemIdToAdd && playerIdToAdd && bossIdSelected) {
      setAddLootOpened(false);
      setItemIdToAdd("");
      setPlayerIdToAdd("");
      setBossIdSelected("");
      setBossNameSelected("");
      SetSnackBarOpened(false);
      // FONCTION MUTATION AJOUT ITEM ICI
      openSnackBar("Item ajouté avec succès", "success");
      refetch();
    } else {
      openSnackBar("Please select both field", "error");
    }
  };
  const openSnackBar = (msg, action) => {
    if (action === "error") {
      setSnackBarClass(classes.snackError);
    } else {
      setSnackBarClass(classes.snackSuccess);
    }
    setSnackBarMsg(msg);
    SetSnackBarOpened(true);
  };

  const closeSnackBar = (
    event: React.SyntheticEvent | React.MouseEvent,
    reason?: string
  ) => {
    if (reason === "clickaway") {
      return;
    }

    SetSnackBarOpened(false);
  };

  const { loading, data, error, refetch } = useQuery<Query, Variables>(
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
  const allPlayers = currentRaid.raidPlayersByRaidId.nodes.sort((a, b) =>
    a.playerByPlayerId.name > b.playerByPlayerId.name ? 1 : -1
  );
  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  const donjonShortName = currentRaid.donjonByDonjonId.shortName;

  return (
    <div className={classes.root}>
      {bosses.map(boss => {
        const lootedForThisBoss = [...loots].filter((loot): boolean => {
          if (loot.itemByItemId.bossItemsByItemId.nodes.length === 0) {
            // A CORRIGER en BDD (par exemple le defenseur de malistar n'a pas de bossID attaché a lui)
          }
          return (
            loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
            loot.itemByItemId.bossItemsByItemId.nodes[0].bossByBossId.id ===
              boss.id
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
    </div>
  );
}
