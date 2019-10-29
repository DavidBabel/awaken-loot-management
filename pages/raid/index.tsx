import { useQuery } from "@apollo/react-hooks";
import {
  Button,
  Container,
  Divider,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  Typography
} from "@material-ui/core";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import IconButton from "@material-ui/core/IconButton";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import ChevronLeftIcon from "@material-ui/icons/ChevronLeft";
import ChevronRightIcon from "@material-ui/icons/ChevronRight";
import Link from "next/link";
import React, { ReactNode, useContext } from "react";
import ItemsCarousel from "react-items-carousel";
import ClassAvatar from "../../components/ClassAvatar";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { CreateRaid } from "../../components/Raid/button";
import ItemSearchedList from "../../components/searchBox/ItemSearchedList";
import PlayerSearchedList from "../../components/searchBox/PlayerSearchedList";
import MemberContext from "../../lib/context/member";
import { Item } from "../../lib/generatedTypes";
import { Query } from "../../lib/generatedTypes";
import { ALL_ITEMS } from "../../lib/gql/item-query";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { ALL_DONJONS, ALL_RAIDS } from "../../lib/gql/raid-queries";
import { role } from "../../lib/role-level";
import { byDate } from "../../lib/utils/sorter";

declare global {
  interface Window {
    $WowheadPower: any;
  }
}

const useStyles = makeStyles({
  root: {
    width: "100%",
    height: "calc(100vh - 130px)"
  },
  topPapers: {
    display: "flex",
    justifyContent: "space-between"
  },
  boxTitle: { margin: "10px 20px" },
  boxTitleLastRaids: { margin: "10px 20px", paddingTop: 10 },
  boxLastRaids: {
    width: "100%"
  },
  createRaidCards: {
    padding: "10px 100px"
  },
  createRaidPaper: {
    width: "50%",
    marginRight: 20
  },
  searchPlayerPaper: {
    width: "50%",
    maxHeight: "230px"
  },
  lastRaidsPaper: {
    width: "100%",
    height: "calc(100vh - 370px)",
    marginTop: 20
  },
  tableWrapper: {
    maxHeight: "calc(100vh - 425px)",
    overflow: "auto",
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
  table: {},
  textField: {
    margin: "15px 5px",
    maxWidth: "200px",
    height: 40
  },
  searchContainer: {
    width: "100%",
    display: "flex",
    height: "177px"
  },
  searchBox: {
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
    alignItems: "center",
    width: "50%",
    height: "177px",
    "&:nth-child(1)": {
      borderRight: " 1px solid #E0E0E0"
    }
  },
  itemInfoDialog: {
    "& a": {
      textDecoration: "none"
    },
    "& a span": {
      margin: "0px 5px 0px 0px"
    }
  },
  whoLootedContainer: {
    display: "flex",
    justifyContent: "center",
    margin: 20
  },
  whoLootedColumn: {
    position: "relative",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    margin: 5,
    border: "solid 1px rgba(0,0,0,0.2)",
    backgroundColor: "rgba(0,0,0,0.05)",
    borderRadius: "4px",
    padding: 10,
    width: 120,
    boxShadow: "0 0 20px 0 rgba(0,0,0,0.15)"
  },
  lootedNbChip: {
    position: "absolute",
    top: "10px",
    right: "30px",
    zIndex: 4,
    lineHeight: "24px",
    width: 24,
    height: 24,
    textAlign: "center",
    borderRadius: "50%",
    color: "white",
    backgroundColor: "#DC004E"
  }
});

export default function PageIndex() {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  const [activeItemIndex, setActiveItemIndex] = React.useState<number>(0);
  const [playerInputValue, setPlayerInputValue] = React.useState<string>("");
  const [itemInputValue, setItemInputValue] = React.useState<string>("");
  const [itemInfoOpened, setItemInfoOpened] = React.useState<boolean>(false);
  const [itemCurrentlySelected, setItemCurrentlySelected] = React.useState<
    Item
  >(null);
  React.useEffect(() => {
    if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
      try {
        setTimeout(() => {
          window.$WowheadPower.refreshLinks();
        }, 150);
      } catch (e) {}
    }
  }, [itemCurrentlySelected, itemInputValue]);
  const {
    loading: loadingDonjons,
    data: dataDonjons,
    error: errorDonjons
  } = useQuery<Query>(ALL_DONJONS);
  const {
    loading: loadingRaids,
    data: dataRaids,
    error: errorRaids
  } = useQuery<Query>(ALL_RAIDS);
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_PLAYERS);
  const {
    loading: loadingItems,
    data: dataItems,
    error: errorItems
  } = useQuery<Query>(ALL_ITEMS);

  const loading =
    loadingDonjons || loadingRaids || loadingPlayers || loadingItems;
  const error = errorDonjons || errorRaids || errorPlayers || errorItems;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const donjons = dataDonjons.allDonjons.edges;
  const raids = dataRaids.allRaids.nodes;
  const players = dataPlayers.allPlayers.nodes;
  const items = dataItems.allItems.nodes;

  raids.sort(byDate("date"));

  const searchPlayerInputChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPlayerInputValue(event.target.value);
  };
  const searchItemInputChange = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setItemInputValue(event.target.value);
  };
  const handleCloseItemInfo = () => {
    setItemInfoOpened(false);
  };
  const handleOpenItemInfo = () => {
    setItemInfoOpened(true);
  };
  const makeWhoLootedList = (item): ReactNode => {
    const classesWhoLooted = [];
    const columns = [];
    item.lootsByItemId.nodes.forEach(loot => {
      if (
        classesWhoLooted.indexOf(loot.playerByPlayerId.classByClassId.name) ===
        -1
      ) {
        classesWhoLooted.push(loot.playerByPlayerId.classByClassId.name);
      }
    });
    classesWhoLooted.forEach(classWhoLooted => {
      const column = {
        classWhoLooted,
        playersWhoLooted: []
      };
      item.lootsByItemId.nodes.forEach(loot => {
        if (loot.playerByPlayerId.classByClassId.name === classWhoLooted) {
          column.playersWhoLooted.push(loot.playerByPlayerId);
        }
      });
      columns.push(column);
    });
    return (
      <div className={classes.whoLootedContainer}>
        {columns.map(column => (
          <div key={column.classWhoLooted} className={classes.whoLootedColumn}>
            <div className={classes.lootedNbChip}>
              {column.playersWhoLooted.length}
            </div>
            <ClassAvatar playerClass={column.classWhoLooted} />

            {column.playersWhoLooted.map(player => (
              <div key={player.id}>{player.name}</div>
            ))}
          </div>
        ))}
      </div>
    );
  };
  return (
    <>
      <Container className={classes.root}>
        <div className={classes.topPapers}>
          {member.level >= role.officer && (
            <Paper className={classes.createRaidPaper}>
              <Typography className={classes.boxTitle} variant="h6">
                Create new raid
              </Typography>
              <Divider />
              <div className={classes.createRaidCards}>
                <ItemsCarousel
                  infiniteLoop={true}
                  gutter={20}
                  numberOfCards={1}
                  activeItemIndex={activeItemIndex}
                  requestToChangeActive={setActiveItemIndex}
                  activePosition={"center"}
                  showSlither={false}
                  firstAndLastGutter={false}
                  rightChevron={
                    <IconButton>
                      <ChevronRightIcon color="primary" />
                    </IconButton>
                  }
                  leftChevron={
                    <IconButton>
                      <ChevronLeftIcon color="primary" />
                    </IconButton>
                  }
                  outsideChevron={true}
                  chevronWidth={100}
                  children={donjons
                    .filter(({ node: donjon }) => donjon.active)
                    .map(({ node: donjon }) => (
                      <CreateRaid key={donjon.name} donjon={donjon} />
                    ))}
                />
              </div>
            </Paper>
          )}
          <Paper
            className={classes.searchPlayerPaper}
            style={{
              width: member.level < role.officer ? "100%" : "50%",
              height: member.level < role.officer ? "230px" : "auto"
            }}
          >
            <Typography className={classes.boxTitle} variant="h6">
              Search
            </Typography>
            <Divider />
            <div className={classes.searchContainer}>
              <div className={classes.searchBox}>
                <TextField
                  autoComplete="off"
                  id="outlined-player"
                  label="Player"
                  className={classes.textField}
                  value={playerInputValue}
                  onChange={searchPlayerInputChange}
                  margin="dense"
                  variant="outlined"
                />
                <PlayerSearchedList
                  searched={playerInputValue}
                  players={players}
                />
              </div>
              <div className={classes.searchBox}>
                <TextField
                  autoComplete="off"
                  id="outlined-item"
                  label="Item"
                  className={classes.textField}
                  value={itemInputValue}
                  onChange={searchItemInputChange}
                  margin="dense"
                  variant="outlined"
                />
                <ItemSearchedList
                  searched={itemInputValue}
                  items={items}
                  setItemCurrentlySelected={setItemCurrentlySelected}
                  handleOpenItemInfo={handleOpenItemInfo}
                />
              </div>
            </div>
          </Paper>
        </div>
        <Paper className={classes.lastRaidsPaper}>
          <Typography className={classes.boxTitleLastRaids} variant="h6">
            Last raids
          </Typography>
          <Divider />

          <div className={classes.tableWrapper}>
            <Table className={classes.table} size="small" stickyHeader={true}>
              <TableHead>
                <TableRow>
                  <TableCell>Donjon</TableCell>
                  <TableCell>Date</TableCell>
                  <TableCell>{""}</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {raids.map(raid => {
                  return (
                    <TableRow key={`raid-${raid.id}`}>
                      <TableCell>{raid.donjonByDonjonId.name}</TableCell>
                      <TableCell>{raid.date}</TableCell>
                      <TableCell>
                        <Link
                          href="/raid/edit/[id]"
                          as={`/raid/edit/${raid.id}`}
                        >
                          <Button variant="contained" color="primary">
                            <a>VIEW</a>
                          </Button>
                        </Link>
                      </TableCell>
                    </TableRow>
                  );
                })}
              </TableBody>
            </Table>
          </div>
        </Paper>
      </Container>
      <Dialog
        className={classes.itemInfoDialog}
        maxWidth={"lg"}
        open={itemInfoOpened}
        onClose={handleCloseItemInfo}
        aria-labelledby="item-dialog-title"
        aria-describedby="item-dialog-description"
      >
        <DialogTitle id="item-dialog-title">
          {itemCurrentlySelected && (
            <a
              onClick={e => {
                e.preventDefault();
              }}
              href={`https://fr.classic.wowhead.com/item=${itemCurrentlySelected.wowheadId}`}
            >
              {itemCurrentlySelected.name}
            </a>
          )}
        </DialogTitle>
        <DialogContent>
          {itemCurrentlySelected && makeWhoLootedList(itemCurrentlySelected)}
        </DialogContent>
        <DialogActions>
          <Button onClick={handleCloseItemInfo} color="primary">
            FERMER
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}
// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
