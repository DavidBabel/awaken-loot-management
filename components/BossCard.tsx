// import { useState } from "react";
import { Boss } from "../lib/generatedTypes";
import { ItemCard } from "./ItemCard";
import { makeStyles } from "@material-ui/core/styles";
import Card from "@material-ui/core/Card";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import CardActions from "@material-ui/core/CardActions";
import IconButton from "@material-ui/core/IconButton";
import MoreVertIcon from "@material-ui/icons/MoreVert";
import Fab from "@material-ui/core/Fab";
import AddIcon from "@material-ui/icons/Add";

const useStyles = makeStyles(theme => ({
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
}));

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots }
}: Boss) {
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
        image={`/static/${name.replace(/\s/g, "")}.jpg`}
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
          return <div />;
        })}
      </CardContent>
      <CardActions disableSpacing className={classes.cardActions}>
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
