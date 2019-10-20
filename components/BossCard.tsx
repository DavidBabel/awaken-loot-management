// import { useState } from "react";
import {
  Card,
  CardActions,
  CardContent,
  CardHeader,
  CardMedia,
  Fab,
  makeStyles
} from "@material-ui/core";
import IconButton from "@material-ui/core/IconButton";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import ListItemText from "@material-ui/core/ListItemText";
import { Add as AddIcon } from "@material-ui/icons";
import DeleteForeverIcon from "@material-ui/icons/DeleteForever";
import { Dispatch, SetStateAction } from "react";
import { Boss, BossItem, Loot } from "../lib/generatedTypes";

const useStyles = makeStyles({
  card: {
    position: "relative",
    width: 500,
    maxHeight: 600,
    margin: "10px",
    backgroundColor: "white",
    paddingBottom: "40px",
    boxShadow: "0 0 20px 0 rgba(0,0,0,0.35)"
  },
  header: {
    position: "absolute",
    top: "0px",
    backgroundColor: "#F50057",
    color: "white",
    zIndex: 2,
    padding: "5px 15px",
    borderBottomRightRadius: "10px"
  },
  media: {
    height: 180,
    clipPath: "polygon(0 0, 100% 0, 100% 79%, 0% 100%)"
  },
  cardContent: {
    maxHeight: 300,
    height: "auto",
    overflow: "auto"
  },
  cardActions: {
    position: "absolute",
    bottom: 0,
    right: 10,
    margin: "auto"
  },
  itemCell: {
    width: 240,
    whiteSpace: "nowrap",
    lineHeight: "44px",
    overflow: "hidden"
  },
  playerCell: {
    width: 120,
    lineHeight: "44px",
    margin: "0px 10px",
    textAlign: "center",
    backgroundColor: "#F5F5F5",
    border: "2px solid",
    borderRadius: "5px",
    overflow: "hidden"
  }
});

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots },
  donjonShortName,
  looted,
  openLootWindow,
  setDialogItems
}: Boss & {
  donjonShortName: string;
  looted: Loot[];
  openLootWindow: (bossId: string, bossName: string) => void;
  setDialogItems: Dispatch<SetStateAction<BossItem[]>>;
}) {
  const classes = useStyles("");
  return (
    <Card className={classes.card}>
      <CardHeader className={classes.header} title={name} subheader="" />
      <CardMedia
        className={classes.media}
        image={`/static/img/boss/${donjonShortName}/${name
          .toLowerCase()
          .replace(/\s/g, "-")}.jpg`}
        title={name}
      />
      <CardContent className={classes.cardContent}>
        <List>
          {looted.map(loot => {
            return (
              <ListItem
                key={loot.itemByItemId.id + loot.playerByPlayerId.id}
                divider={true}
                role={undefined}
                alignItems="flex-start"
              >
                <ListItemText className={classes.itemCell}>
                  {" "}
                  <a
                    onClick={e => {
                      e.preventDefault();
                    }}
                    href={`https://fr.classic.wowhead.com/item=${loot.itemByItemId.wowheadId}`}
                  >
                    {loot.itemByItemId.name}
                  </a>
                </ListItemText>
                <ListItemText
                  style={{
                    borderColor:
                      loot.playerByPlayerId.classByClassId.id !== 1
                        ? loot.playerByPlayerId.classByClassId.color
                        : "grey"
                  }}
                  className={classes.playerCell}
                  primary={loot.playerByPlayerId.name}
                />
                <ListItemSecondaryAction>
                  <IconButton edge="end" aria-label="comments">
                    <DeleteForeverIcon />
                  </IconButton>
                </ListItemSecondaryAction>
              </ListItem>
            );
          })}
        </List>
      </CardContent>
      <CardActions disableSpacing={true} className={classes.cardActions}>
        <Fab
          size="small"
          color="primary"
          aria-label="add"
          onClick={() => {
            setDialogItems(loots);
            openLootWindow(id.toString(), name);
          }}
        >
          <AddIcon />
        </Fab>
      </CardActions>
    </Card>

    // <div>
    //   <h2 onClick={toogleShowLoots}>{name}</h2>
    //   {showLoots &&
    //     loots.map(loot => {
    //       return (
    //         <div key={name + loot.itemByItemId.name}>
    //           <ItemCard boss={name} {...loot.itemByItemId} />
    //         </div>
    //       );
    //     })}
    // </div>
  );
}
