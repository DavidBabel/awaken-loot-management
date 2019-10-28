import { List, ListItem, ListItemText } from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      overflow: "auto",
      height: "100px"
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
              style={{
                color:
                  result.classByClassId.id !== 1
                    ? result.classByClassId.color
                    : "grey"
              }}
              primary={result.name}
            />
          </ListItem>
        ))}
    </List>
  );
}
