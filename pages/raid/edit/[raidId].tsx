import { useQuery } from "@apollo/react-hooks";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import FormControl from "@material-ui/core/FormControl";
import InputLabel from "@material-ui/core/InputLabel";
import MenuItem from "@material-ui/core/MenuItem";
import Select from "@material-ui/core/Select";
import Slide from "@material-ui/core/Slide";
import { makeStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
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
  }
});

const Transition = forwardRef<unknown, TransitionProps>(function Transition(
  props,
  ref
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

export default function PageRaidView() {
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));
  const [addLootOpened, setAddLootOpened] = useState<boolean>(false);
  const [selectItemOpened, setSelectItemOpened] = useState<boolean>(false);
  const [itemIdToAdd, setItemIdToAdd] = useState(null);
  const [dialogItems, setDialogItems] = useState<BossItem[]>([]);
  const [selectPlayerOpened, setSelectPlayerOpened] = useState<boolean>(false);
  const [playerIdToAdd, setPlayerIdToAdd] = useState(null);

  const handleOpenDialog = (): void => {
    setAddLootOpened(true);
  };
  const handleCloseDialog = (): void => {
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
  const { loading, data, error } = useQuery<Query, Variables>(ONE_RAID, {
    variables: { raidId }
  });
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
  const classes = useStyles("");
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
            openLootWindow={handleOpenDialog}
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
        onClose={handleCloseDialog}
        aria-labelledby="add-loot-dialog"
        aria-describedby="add loot window"
      >
        <DialogTitle id="add-loot-dialog">{"Ajouter un loot"}</DialogTitle>
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
          <Button onClick={handleCloseDialog} color="primary">
            CANCEL
          </Button>
          <Button onClick={handleCloseDialog} color="primary">
            ADD
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}
