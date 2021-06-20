import { useQuery } from "@apollo/react-hooks";
import { makeStyles, Tooltip } from "@material-ui/core";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import ClassAvatar from "../../components/ClassAvatar";
import { Item, Loot, Query } from "../../lib/generatedTypes";
import { ITEM_LOOT, ItemLootVariables } from "../../lib/gql/item-query";
import { getDate } from "../../lib/utils/date";
import { LoadingAndError } from "../LoadingAndErrors";

const useStyles = makeStyles(theme => ({
  itemInfoDialog: {
    "& a": {
      textDecoration: "none"
    },
    "& a span": {
      margin: "0px 5px 0px 0px"
    }
  },
  whoLootedContainer: {
    display: "flex",
    justifyContent: "center",
    margin: 20
  },
  whoLootedColumn: {
    position: "relative",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    margin: 5,
    border: "solid 1px rgba(0,0,0,0.2)",
    backgroundColor: "rgba(0,0,0,0.05)",
    borderRadius: "4px",
    padding: 10,
    width: 120,
    boxShadow: "0 0 20px 0 rgba(0,0,0,0.15)"
  },
  lootedNbChip: {
    position: "absolute",
    top: "10px",
    right: "30px",
    zIndex: 4,
    lineHeight: "24px",
    width: 24,
    height: 24,
    textAlign: "center",
    borderRadius: "50%",
    color: "white",
    backgroundColor: "#DC004E"
  }
}));

interface Props {
  isOpen: boolean;
  onClose: () => void;
  currentItem: Item;
}

export function ItemDialog({ isOpen, onClose, currentItem }: Props) {
  const classes = useStyles("");

  const { loading: loadingLoot, data: dataLoot, error: errorLoot } = useQuery<
    Query,
    ItemLootVariables
  >(ITEM_LOOT, { variables: { itemId: currentItem.id } });
  if (!currentItem) {
    return null;
  }
  if (loadingLoot || errorLoot) {
    return <LoadingAndError loading={loadingLoot} error={errorLoot} />;
  }

  const loots = dataLoot.allLoots.nodes;

  const classesWhoLoot = [
    ...new Set(loots.map(loot => loot.playerByPlayerId.classByClassId.name))
  ].sort();

  return (
    <Dialog
      className={classes.itemInfoDialog}
      maxWidth={"lg"}
      open={isOpen}
      onClose={onClose}
      aria-labelledby="item-dialog-title"
      aria-describedby="item-dialog-description"
    >
      <DialogTitle id="item-dialog-title">
        {
          <a
            onClick={e => {
              e.preventDefault();
            }}
            href={`https://fr.tbc.wowhead.com/item=${currentItem.wowheadId}`}
          >
            {currentItem.name}
          </a>
        }
      </DialogTitle>
      <DialogContent>
        <div className={classes.whoLootedContainer}>
          {classesWhoLoot.length > 0
            ? classesWhoLoot.map(classeWhoLoot => {
                const currentClassLoots = loots.filter(
                  loot =>
                    loot.playerByPlayerId.classByClassId.name === classeWhoLoot
                );
                return (
                  <div
                    key={`lootedclassitem-${classeWhoLoot}`}
                    className={classes.whoLootedColumn}
                  >
                    <div className={classes.lootedNbChip}>
                      {currentClassLoots.length}
                    </div>
                    <ClassAvatar playerClass={classeWhoLoot} />

                    {currentClassLoots.map((loot: Loot) => (
                      <Tooltip
                        key={`playerwholoot-${loot.playerByPlayerId.id}`}
                        title={getDate(loot.raidByRaidId.date)}
                        placement="right"
                      >
                        <div>{loot.playerByPlayerId.name}</div>
                      </Tooltip>
                    ))}
                  </div>
                );
              })
            : "Pas looté"}
        </div>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          FERMER
        </Button>
      </DialogActions>
    </Dialog>
  );
}
