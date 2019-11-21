import {
  List,
  ListItem,
  ListItemAvatar,
  ListItemText
} from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import ClassAvatar from "../../components/ClassAvatar";
import { BossItem, Item } from "../../lib/generatedTypes";
import { normalizeText } from "../../lib/utils/string";

interface Props {
  listHeight: string;
}
const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      overflowY: "auto",
      overflowX: "hidden",
      height: (props: Props) => props.listHeight,
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
      margin: "2px 0px"
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
      top: "0px"
    },
    lootLevel1: {
      backgroundColor: "#1AD900",
      color: "white"
    },
    lootLevel2: {
      backgroundColor: "#0070DD",
      color: "white"
    },
    lootLevel3: {
      backgroundColor: "#A335EE",
      color: "white"
    }
  })
);

export default function ItemSearchedList({
  searched,
  items,
  setItemCurrentlySelected,
  handleOpenItemInfo,
  listHeight
}) {
  const classes = useStyles({ listHeight });
  const results =
    searched.length !== 0 &&
    items.filter((item: Item) => {
      const search = normalizeText(searched);
      const itemName = normalizeText(item.name);

      const hasName = itemName.indexOf(search) !== -1;

      const bossesFound = item.bossItemsByItemId.nodes.filter(
        (bossItem: BossItem) => {
          const bossName = normalizeText(bossItem.bossByBossId.name);
          return bossName.indexOf(search) !== -1;
        }
      );

      return hasName || bossesFound.length > 0;
    });
  return (
    <List
      className={classes.root}
      component="nav"
      dense={true}
      aria-label="item list"
    >
      {results &&
        results.map(result => {
          let lootedNb = 0;
          result.lootsByItemId.nodes.forEach(loot => {
            if (loot.active && loot.playerByPlayerId.active) {
              lootedNb++;
            }
          });
          return (
            <ListItem
              key={result.id}
              button={true}
              onClick={() => {
                setItemCurrentlySelected(result);
                handleOpenItemInfo(true);
              }}
            >
              <ListItemText
                className={classes.resultText}
                primary={
                  <a
                    onClick={e => {
                      e.preventDefault();
                    }}
                    href={`https://fr.classic.wowhead.com/item=${result.wowheadId}`}
                  >
                    {result.name}
                  </a>
                }
              />
              {!result.classByClassId ? (
                result.classItemsByItemId.nodes.map(playerClass => (
                  <ListItemAvatar
                    key={playerClass.classByClassId.id + result.name}
                  >
                    <ClassAvatar
                      playerClass={playerClass.classByClassId.name}
                      prio={playerClass.prio}
                    />
                  </ListItemAvatar>
                ))
              ) : (
                <ListItemAvatar>
                  <ClassAvatar playerClass={result.classByClassId.name} />
                </ListItemAvatar>
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
        })}
    </List>
  );
}
