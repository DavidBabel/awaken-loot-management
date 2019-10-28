import { List, ListItem, ListItemText } from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      overflow: "auto",
      height: "100px"
    },
    resultText: {
      textAlign: "center",
      textShadow: "1px 1px 2px black"
    }
  })
);

export default function PlayerSearchedList({ searched, players }) {
  const classes = useStyles("");
  const results =
    searched.length !== 0 &&
    players.filter(
      player =>
        player.name.toLowerCase().indexOf(searched.toLowerCase()) !== -1 &&
        player.active
    );
  return (
    <List
      className={classes.root}
      component="nav"
      dense={true}
      aria-label="secondary mailbox folder"
    >
      {results &&
        results.map(result => (
          <ListItem key={result.id} button={true}>
            <ListItemText
              className={classes.resultText}
              style={{
                color: result.classByClassId.color
              }}
              primary={result.name}
            />
          </ListItem>
        ))}
    </List>
  );
}
