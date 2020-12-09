import {
  List,
  ListItem,
  ListItemAvatar,
  ListItemText,
  Tooltip,
  Typography
} from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import React from "react";
import ClassAvatar from "../../components/ClassAvatar";
import { BossItem, Item } from "../../lib/generatedTypes";
import {
  lootColorLevel1,
  lootColorLevel2,
  lootColorLevel3,
  lootColorLevel4,
  lootColorLevel5,
  lootColorLevel6
} from "../../lib/utils/loot-colors";
import { normalizeText } from "../../lib/utils/string";

interface StyleProps {
  listHeight: string;
}
const useStyles = makeStyles(theme =>
  createStyles({
    root: {
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
  })
);

interface Props {
  items: Item[];
  searched: string;
  setItemCurrentlySelected: React.Dispatch<React.SetStateAction<Item>>;
  handleOpenItemInfo: () => void;
  listHeight: string;
}

export default function ItemSearchedList({
  searched,
  items,
  setItemCurrentlySelected,
  handleOpenItemInfo,
  listHeight
}: Props) {
  const classes = useStyles({ listHeight });
  const results =
    searched.length >= 3 &&
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
        (results.length === 0 ? (
          <Typography>Aucun résultat trouvé</Typography>
        ) : (
          results.map(result => {
            const lootedNb = result.lootsByItemId.nodes.filter(l => l.active)
              .length;

            return (
              <ListItem
                key={`listitemline-${result.id}`}
                button={true}
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
                {!result.classByClassId ? (
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
          })
        ))}
    </List>
  );
}
