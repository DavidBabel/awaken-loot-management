import { useQuery } from "@apollo/react-hooks";
import { Hidden } from "@material-ui/core";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import React, { useEffect, useState } from "react";
import { ItemDialog } from "../../components/items/ItemDialog";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import ItemSearchedList from "../../components/searchBox/ItemSearchedList";
import { Item, Query } from "../../lib/generatedTypes";
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
  }
}));

export default function PageItem() {
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

  if (loadingItems || errorItems) {
    return <LoadingAndError loading={loadingItems} error={errorItems} />;
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

  return (
    <div className={classes.root}>
      <Paper className={classes.searchBox}>
        <Typography>Tapez votre recherche:</Typography>
        <TextField
          autoComplete="off"
          id="outlined-item"
          label="Item ou Boss"
          className={classes.textField}
          value={itemInputValue}
          onChange={searchItemInputChange}
          margin="dense"
          variant="outlined"
        />
        <Hidden smDown>
          <Typography>
            <i>
              <b style={{ color: "grey" }}>* : </b>
              <span style={{ color: "lightgrey" }}>
                item avec des conditions d'attribution spéciales
              </span>
            </i>
          </Typography>
        </Hidden>
      </Paper>
      <ItemSearchedList
        listHeight={"auto"}
        searched={itemInputValue}
        items={items}
        setItemCurrentlySelected={setItemCurrentlySelected}
        handleOpenItemInfo={handleOpenItemInfo}
      />
      {itemCurrentlySelected && (
        <ItemDialog
          isOpen={itemInfoOpened}
          onClose={handleCloseItemInfo}
          currentItem={itemCurrentlySelected}
        />
      )}
    </div>
  );
}
