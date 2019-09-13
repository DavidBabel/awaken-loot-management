import Collapse from "@material-ui/core/Collapse";
import Divider from "@material-ui/core/Divider";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import ExpandLess from "@material-ui/icons/ExpandLess";
import ExpandMore from "@material-ui/icons/ExpandMore";
import { useState } from "react";
import { Item } from "../lib/generatedTypes";
import { ClassItemCard } from "./ClassItemCard";
import { ListCards } from "./ListCards";
import { LootCard } from "./LootCard";

interface Props extends Item {
  boss: string;
}

export function ItemCard({
  boss,
  // id,
  name,
  wowheadId,
  classItemsByItemId: { nodes: classes },
  lootsByItemId: { nodes: loots }
}: Props) {
  const [showClasses, setShowClasses] = useState(false);
  const toggleShowClasses = () => setShowClasses(!showClasses);

  const useStyles = makeStyles((theme: Theme) =>
    createStyles({
      root: {
        width: "100%",
        maxWidth: 360,
        backgroundColor: "#ebebeb",
        padding: 0
      },
      nested: {
        display: "flex",
        flexDirection: "column",
        flexWrap: "wrap",
        padding: 0,
        margin: 0
      },
      classes: {
        display: "flex",
        flexWrap: "wrap",
        justifyContent: "center",
        borderBottom: "solid 1px #b5b3b3"
      },
      loots: {
        display: "flex",
        flexWrap: "wrap",
        justifyContent: "center",
        borderBottom: "solid 1px #b5b3b3"
      }
    })
  );
  const styleClasses = useStyles("");
  const countLootByClass = {};
  const lootList = loots.map(loot => {
    const {
      playerByPlayerId: {
        classByClassId: { name: currentClass }
      }
    } = loot;
    countLootByClass[currentClass] = (countLootByClass[currentClass] || 0) + 1;
    return <LootCard key={boss + wowheadId + loot.id} {...loot} />;
  });

  return (
    <List component="nav" className={styleClasses.root}>
      <ListItem button={true} onClick={toggleShowClasses}>
        <a
          style={{
            textDecoration: "none",
            marginRight: "10px"
          }}
          onClick={e => {
            e.preventDefault();
          }}
          href={`https://fr.classic.wowhead.com/item=${wowheadId}`}
        >
          {name}
        </a>
        {showClasses ? <ExpandLess /> : <ExpandMore />}
      </ListItem>
      <Divider />
      <Collapse in={showClasses} timeout="auto" unmountOnExit={true}>
        <List component="div" disablePadding={true}>
          <ListItem button={true} className={styleClasses.nested}>
            <ListItem className={styleClasses.classes}>
              {showClasses && (
                <ListCards
                  display={classes.map(classe => (
                    <ClassItemCard
                      {...classe}
                      countLootByClass={countLootByClass}
                      key={boss + wowheadId + classe.id}
                    />
                  ))}
                  or={<div>No class assigned</div>}
                />
              )}
            </ListItem>
            <Divider />
            <ListItem className={styleClasses.loots}>
              {showClasses && (
                <ListCards display={lootList} or={<div>Never looted</div>} />
              )}
            </ListItem>
          </ListItem>
          <Divider />
        </List>
      </Collapse>
    </List>
  );
}
