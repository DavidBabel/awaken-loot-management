import { List, ListItem, ListItemText } from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";
import Link from "next/link";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      overflow: "auto",
      height: "100px",
      fontWeight: "bold",
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "#3F51B5",
        borderRadius: "2px"
      },
      "&::-webkit-scrollbar-track": {
        boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)"
      },
      "&::-webkit-scrollbar": {
        width: "10px"
      }
    },
    resultText: {
      textAlign: "center",
      textShadow: "1px 1px 1px black"
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
            <Link href="/player/view/[id]" as={`/player/view/${result.id}`}>
              <ListItemText
                className={classes.resultText}
                style={{
                  color: result.classByClassId.color
                }}
                primary={<a>{result.name}</a>}
              />
            </Link>
          </ListItem>
        ))}
    </List>
  );
}
