import { List, ListItem, ListItemText } from "@material-ui/core/";
import { createStyles, makeStyles } from "@material-ui/core/styles";

const useStyles = makeStyles(() =>
  createStyles({
    root: {
      width: "100%",
      overflowY: "auto",
      overflowX: "hidden",
      height: "100px",
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
      whiteSpace: "nowrap",
      "& a": {
        textDecoration: "none"
      },
      "& a span": {
        margin: "0px 5px 0px 0px"
      }
    }
  })
);

export default function ItemSearchedList({
  searched,
  items,
  setItemCurrentlySelected,
  handleOpenItemInfo
}) {
  const classes = useStyles("");
  const results =
    searched.length !== 0 &&
    items.filter(
      item => item.name.toLowerCase().indexOf(searched.toLowerCase()) !== -1
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
          </ListItem>
        ))}
    </List>
  );
}
