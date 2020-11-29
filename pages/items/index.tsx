import { useQuery } from "@apollo/react-hooks";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import Autocomplete from "@material-ui/lab/Autocomplete";
import React, { ReactNode, useEffect, useState } from "react";
import ClassAvatar from "../../components/ClassAvatar";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import ItemSearchedList from "../../components/searchBox/ItemSearchedList";
import { Item, Player, Query } from "../../lib/generatedTypes";
import { ALL_BOSSES } from "../../lib/gql/bosses-query";
import { ALL_ITEMS } from "../../lib/gql/item-query";
import { refreshWowhead } from "../../lib/utils/wowhead-refresh";

const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",
    height: "calc(100vh - 110px)",
    [theme.breakpoints.down("sm")]: {
      height: "calc(100vh - 50px)"
    },
    display: "flex",
    flexDirection: "column",
    alignItems: "center"
  },
  searchBox: {
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "center",
    width: "80%",

    height: "100px",
    flexShrink: 0,
    "&:nth-child(1)": {
      borderRight: " 1px solid #E0E0E0"
    },
    position: "relative",
    marginBottom: "20px",

    [theme.breakpoints.down("sm")]: {
      marginBottom: 0,
      marginTop: 10
    }
  },
  textField: {
    width: "60%"
  },
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

export default function PageIndex() {
  const classes = useStyles("");
  const [itemInputValue, setItemInputValue] = useState<string>("");
  const [itemInfoOpened, setItemInfoOpened] = useState<boolean>(false);
  const [itemCurrentlySelected, setItemCurrentlySelected] = useState<Item>(
    null
  );
  let refreshWowheadTimeout = null;
  useEffect(() => {
    refreshWowheadTimeout = setTimeout(() => {
      clearTimeout(refreshWowheadTimeout);
      refreshWowhead();
    }, 100);
  }, [itemInputValue, itemInfoOpened]);
  const {
    loading: loadingItems,
    data: dataItems,
    error: errorItems
  } = useQuery<Query>(ALL_ITEMS);
  const {
    loading: loadingBosses,
    data: dataBosses,
    error: errorBosses
  } = useQuery<Query>(ALL_BOSSES);

  if (loadingItems || errorItems || loadingBosses || errorBosses) {
    return (
      <LoadingAndError
        loading={loadingItems || loadingBosses}
        error={errorItems || errorBosses}
      />
    );
  }

  const items = dataItems.allItems.nodes;

  const handleCloseItemInfo = () => {
    setItemInfoOpened(false);
  };
  const handleOpenItemInfo = () => {
    setItemInfoOpened(true);
  };
  const searchItemInputChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setItemInputValue(event.target.value);
  };

  const makeWhoLootedList = (item: Item): ReactNode => {
    const classesWhoLooted = [];
    const columns = [];
    item.lootsByItemId.nodes.forEach(loot => {
      if (
        classesWhoLooted.indexOf(loot.playerByPlayerId.classByClassId.name) ===
          -1 &&
        loot.playerByPlayerId.active &&
        loot.active
      ) {
        classesWhoLooted.push(loot.playerByPlayerId.classByClassId.name);
      }
    });
    classesWhoLooted.forEach(classWhoLooted => {
      const column = {
        classWhoLooted,
        playersWhoLooted: []
      };
      item.lootsByItemId.nodes.forEach(loot => {
        if (
          loot.playerByPlayerId.classByClassId.name === classWhoLooted &&
          loot.playerByPlayerId.active &&
          loot.active
        ) {
          column.playersWhoLooted.push(loot.playerByPlayerId);
        }
      });
      columns.push(column);
    });
    return (
      <div className={classes.whoLootedContainer}>
        {columns.length > 0
          ? columns.map(column => (
              <div
                key={`lootedclassitem-${column.classWhoLooted}`}
                className={classes.whoLootedColumn}
              >
                <div className={classes.lootedNbChip}>
                  {column.playersWhoLooted.length}
                </div>
                <ClassAvatar playerClass={column.classWhoLooted} />

                {column.playersWhoLooted.map((player: Player) => (
                  <div key={`playerwholoot-${player.id}`}>{player.name}</div>
                ))}
              </div>
            ))
          : "Pas looté"}
      </div>
    );
  };

  return (
    <div className={classes.root}>
      <Paper className={classes.searchBox}>
        <Typography>Tapez votre recherche:</Typography>
        <Autocomplete
          id="outlined-item"
          className={classes.textField}
          value={itemInputValue}
          // onChange={searchItemInputChange}
          options={dataBosses.allBosses.nodes.map(boss => boss.name)}
          renderInput={params => (
            <TextField
              {...params}
              // value={itemInputValue}
              onChange={searchItemInputChange}
              label="Item ou Boss"
              margin="dense"
              variant="outlined"
            />
          )}
        />
        <Typography>
          <i>
            <b style={{ color: "grey" }}>* : </b>
            <span style={{ color: "lightgrey" }}>
              item avec des conditions d'attribution spéciales
            </span>
          </i>
        </Typography>
      </Paper>{" "}
      <ItemSearchedList
        listHeight={"auto"}
        searched={itemInputValue}
        items={items}
        setItemCurrentlySelected={setItemCurrentlySelected}
        handleOpenItemInfo={handleOpenItemInfo}
      />
      <Dialog
        className={classes.itemInfoDialog}
        maxWidth={"lg"}
        open={itemInfoOpened}
        onClose={handleCloseItemInfo}
        aria-labelledby="item-dialog-title"
        aria-describedby="item-dialog-description"
      >
        <DialogTitle id="item-dialog-title">
          {itemCurrentlySelected && (
            <a
              onClick={e => {
                e.preventDefault();
              }}
              href={`https://fr.classic.wowhead.com/item=${itemCurrentlySelected.wowheadId}`}
            >
              {itemCurrentlySelected.name}
            </a>
          )}
        </DialogTitle>
        <DialogContent>
          {itemCurrentlySelected && makeWhoLootedList(itemCurrentlySelected)}
        </DialogContent>
        <DialogActions>
          <Button onClick={handleCloseItemInfo} color="primary">
            FERMER
          </Button>
        </DialogActions>
      </Dialog>
    </div>
  );
}
