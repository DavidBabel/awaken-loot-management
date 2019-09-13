// import { useState } from "react";
import {
  Card,
  CardActions,
  CardContent,
  CardHeader,
  CardMedia,
  Fab,
  IconButton,
  makeStyles
} from "@material-ui/core";
import { Add as AddIcon, MoreVert as MoreVertIcon } from "@material-ui/icons";

import { Boss } from "../lib/generatedTypes";
import { ItemCard } from "./ItemCard";

const useStyles = makeStyles({
  card: {
    position: "relative",
    width: 400,
    minHeight: 400,
    margin: "10px",
    backgroundColor: "#dedede",
    paddingBottom: "40px"
  },
  media: {
    height: 0,
    paddingTop: "56.25%" // 16:9
  },
  cardContent: {
    height: "auto"
  },
  cardActions: {
    position: "absolute",
    bottom: 0,
    right: 0,
    margin: "auto"
  }
});

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots },
  donjonShortName
}: Boss & { donjonShortName: string }) {
  // const [showLoots, setShowLoots] = useState(false);
  // const toogleShowLoots = () => setShowLoots(!showLoots);

  const classes = useStyles("");

  return (
    <Card className={classes.card}>
      <CardHeader
        action={
          <IconButton aria-label="settings">
            <MoreVertIcon />
          </IconButton>
        }
        title={name}
        subheader=""
      />
      <CardMedia
        className={classes.media}
        image={`/static/img/boss/${donjonShortName}/${name
          .toLowerCase()
          .replace(/\s/g, "-")}.jpg`}
        title={name}
      />
      <CardContent className={classes.cardContent}>
        {loots.map(loot => {
          if (loot.itemByItemId.lootsByItemId.nodes.length > 0) {
            return (
              <div key={name + loot.itemByItemId.name}>
                <ItemCard boss={name} {...loot.itemByItemId} />
              </div>
            );
          }
          return null;
        })}
      </CardContent>
      <CardActions disableSpacing={true} className={classes.cardActions}>
        <Fab size="small" color="primary" aria-label="add">
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
