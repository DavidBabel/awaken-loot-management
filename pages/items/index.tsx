import { useQuery } from "@apollo/react-hooks";
import { Hidden } from "@material-ui/core";
import {
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Tooltip
} from "@material-ui/core/";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import { default as React, useEffect, useState } from "react";
import ClassAvatar from "../../components/ClassAvatar";
import { ItemDialog } from "../../components/items/ItemDialog";
import { LoadingAndError } from "../../components/LoadingAndErrors";
// import ItemSearchedList from "../../components/searchBox/ItemSearchedList";
import { BossItem, Item, Query } from "../../lib/generatedTypes";
import { ALL_ITEMS } from "../../lib/gql/item-query";
import { copyToClipboard } from "../../lib/utils/copy";
import {
  lootColorLevel1,
  lootColorLevel2,
  lootColorLevel3,
  lootColorLevel4,
  lootColorLevel5,
  lootColorLevel6
} from "../../lib/utils/loot-colors";
import { normalizeTextWithStrip } from "../../lib/utils/string";
import { refreshWowhead } from "../../lib/utils/wowhead-refresh";

interface StyleProps {
  listHeight: string;
}

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
  root2: {
    width: "100%",
    overflowY: "auto",
    overflowX: "hidden",
    height: (props: StyleProps) => props.listHeight,
    "&::-webkit-scrollbar-thumb": {
      backgroundColor: "#3F51B5",
      borderRadius: "2px"
    },
    "&::-webkit-scrollbar-track": {
      boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)"
    },
    "&::-webkit-scrollbar": {
      width: "10px"
    },
    margin: "2px 0px",
    [theme.breakpoints.down("sm")]: {
      margin: "10px 0px"
    },
    padding: "0px 5px"
  },
  resultText: {
    padding: 3,
    whiteSpace: "nowrap",
    "& a": {
      textDecoration: "none"
    },
    "& a span": {
      margin: "0px 5px 0px 0px"
    }
  },
  lootLevel: {
    borderRadius: "50%",
    width: "24px",
    height: "24px",
    lineHeight: "24px",
    textAlign: "center",
    position: "absolute",
    left: "0px",
    top: "0px",
    color: "white"
  },
  lootLevel1: {
    backgroundColor: lootColorLevel1
  },
  lootLevel2: {
    backgroundColor: lootColorLevel2
  },
  lootLevel3: {
    backgroundColor: lootColorLevel3
  },
  lootLevel4: {
    backgroundColor: lootColorLevel4
  },
  lootLevel5: {
    backgroundColor: lootColorLevel5
  },
  lootLevel6: {
    backgroundColor: lootColorLevel6
  }
}));

function getPriosText(item: Item) {
  const prios = item.classByClassId ? [item.classByClassId.name] : [];
  const nonPrio = [];

  item.classItemsByItemId.nodes.forEach(playerClass => {
    if (playerClass.prio) {
      prios.push(playerClass.classByClassId.name);
    } else {
      nonPrio.push(playerClass.classByClassId.name);
    }
  });

  const hasPrios = prios.length > 0;
  const hasNonPrios = nonPrio.length > 0;

  const nonPrioText = hasNonPrios && hasPrios ? "[Sans prio]" : "[PRIO]";

  const prioLine = hasPrios ? `/o ${item.name} [PRIO] ${prios.join(", ")}` : "";
  const nonPrioLine = hasNonPrios
    ? ` ${nonPrioText} ${nonPrio.join(", ")}`
    : "";

  const comment = item.classItemsByItemId?.nodes[0]?.comment;
  const commentLine = comment ? ` [Commentaire] ${comment}` : "";

  return `${prioLine}${nonPrioLine}${commentLine}`.trim();
}

export default function PageItem() {
  const classes = useStyles({ listHeight: "auto" });
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

  const results =
    itemInputValue.length >= 3 &&
    items.filter((item: Item) => {
      const search = normalizeTextWithStrip(itemInputValue);
      const itemName = normalizeTextWithStrip(item.name);

      const hasName = itemName.indexOf(search) !== -1;

      const bossesFound = item.bossItemsByItemId.nodes.filter(
        (bossItem: BossItem) => {
          const bossName = normalizeTextWithStrip(bossItem.bossByBossId.name);
          return bossName.indexOf(search) !== -1;
        }
      );

      return hasName || bossesFound.length > 0;
    });

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
      {/* <ItemSearchedList
        listHeight={"auto"}
        searched={itemInputValue}
        items={items}
        setItemCurrentlySelected={setItemCurrentlySelected}
        handleOpenItemInfo={handleOpenItemInfo}
      /> */}
      <List
        className={classes.root2}
        component="nav"
        dense={true}
        aria-label="item list"
      >
        {results &&
          (results.length === 0 ? (
            <Typography>Aucun résultat trouvé</Typography>
          ) : (
            results.map((result: Item) => {
              const lootedNb = result.lootsByItemId.totalCount;

              return (
                <ListItem
                  key={`listitemline-${result.id}`}
                  button={true}
                  onContextMenu={e => {
                    e.preventDefault();
                    copyToClipboard(getPriosText(result));
                  }}
                  onClick={() => {
                    setItemCurrentlySelected(result);
                    handleOpenItemInfo();
                  }}
                >
                  <ListItemText
                    className={classes.resultText}
                    primary={
                      <>
                        <a
                          onClick={e => {
                            e.preventDefault();
                          }}
                          href={`https://fr.classic.wowhead.com/item=${result.wowheadId}`}
                        >
                          {result.name}
                        </a>
                        {result.classItemsByItemId?.nodes[0]?.comment && (
                          <Tooltip
                            placement="top"
                            title={result.classItemsByItemId?.nodes[0]?.comment}
                          >
                            <b>*</b>
                          </Tooltip>
                        )}
                      </>
                    }
                  />
                  {result.classByClassId ? (
                    <ListItemAvatar>
                      <ClassAvatar playerClass={result.classByClassId.name} />
                    </ListItemAvatar>
                  ) : (
                    result.classItemsByItemId.nodes.map(playerClass => (
                      <ListItemAvatar
                        key={`listitemavatar-${playerClass.classByClassId.id +
                          result.name}`}
                      >
                        <ClassAvatar
                          playerClass={playerClass.classByClassId.name}
                          prio={playerClass.prio}
                        />
                      </ListItemAvatar>
                    ))
                  )}
                  <ListItemText
                    className={
                      classes.lootLevel +
                      " " +
                      classes["lootLevel" + result.lootLevel]
                    }
                    primary={lootedNb}
                  />
                </ListItem>
              );
            })
          ))}
      </List>
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
