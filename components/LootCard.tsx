import { Loot } from "../lib/generatedTypes";
import { makeStyles } from "@material-ui/core/styles";
import Chip from "@material-ui/core/Chip";

export function LootCard({
  raidByRaidId: { date },
  playerByPlayerId: {
    name,
    classByClassId: { color }
  }
}: Loot) {
  const useStyles = makeStyles(theme => ({
    root: {
      display: "flex",
      justifyContent: "center",
      flexWrap: "wrap"
    },
    chip: {
      margin: theme.spacing(1),
      backgroundColor: color
    }
  }));
  const classes = useStyles("");

  // function handleClick() {
  //   alert('You clicked the Chip.');
  // }

  return (
    <Chip label={name} className={classes.chip} />
    // <div>
    //   <div>{date}</div>
    //   <div style={{ color: color }}>{name}</div>
    // </div>
  );
}
