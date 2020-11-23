import { useQuery } from "@apollo/react-hooks";
import { Switch } from "@material-ui/core";
import AppBar from "@material-ui/core/AppBar";
import Box from "@material-ui/core/Box";
import { makeStyles, Theme } from "@material-ui/core/styles";
import Tab from "@material-ui/core/Tab";
import Tabs from "@material-ui/core/Tabs";
import React from "react";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import LootWindow, {
  LootWindowProps
} from "../../components/summary/LootWindow";
import PlayersTable from "../../components/summary/PlayersTable";
import { Loot, Player, Query } from "../../lib/generatedTypes";
import { ALL_MERITS } from "../../lib/gql/merit-queries";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { useOnMobile } from "../../lib/hooks/mobilecheck";
import { useToggle } from "../../lib/hooks/toggle";
import { getClassColor } from "../../lib/utils/class-colors";

interface TabPanelProps {
  children?: React.ReactNode;
  index: number;
  value: number;
}

function TabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props;

  return value !== index ? (
    <div />
  ) : (
    <div
      // component="div"
      role="tabpanel"
      hidden={value !== index}
      id={`scrollable-auto-tabpanel-${index}`}
      aria-labelledby={`scrollable-auto-tab-${index}`}
      {...other}
    >
      <Box p={3}>{children}</Box>
    </div>
  );
}

export default function PageSummary() {
  const playerClasses = [
    "Druide",
    "Chasseur",
    "Mage",
    "Prêtre",
    "Voleur",
    "Chaman",
    "Démoniste",
    "Guerrier Tank",
    "Guerrier DPS"
  ];

  const classTabStyles = playerClasses.reduce((stack, playerClass, index) => {
    stack[`indicator_${index}`] = {
      "& .MuiTabs-indicator": {
        backgroundColor: getClassColor(playerClass, true)
      }
    };
    return stack;
  }, {});

  const useStyles = makeStyles((theme: Theme) => ({
    root: {
      width: "100%",
      height: "calc(100vh - 105px)",
      [theme.breakpoints.down("sm")]: {
        height: "calc(100vh - 20px)"
      },
      backgroundColor: theme.palette.background.paper,
      "& .MuiTabs-indicator": {
        height: "3px"
      },
      "& .MuiTabs-root": {
        backgroundColor: "#E6E8EB"
      },
      "& .Mui-selected": {
        backgroundColor: "#d2d4d6",
        color: "black"
      },
      [theme.breakpoints.down("sm")]: {
        "& .MuiBox-root": {
          padding: 5
        }
      }
    },
    tab: {
      minWidth: 135,
      width: 135
    },
    ...classTabStyles
  }));

  const classes = useStyles("");
  const [currentTabIndex, setCurrentTabIndex] = React.useState(0);
  const [lootWindows, setLootWindows] = React.useState<LootWindowProps[]>([]);
  const [shouldHideReroll, toggleShouldHideReroll] = useToggle(true);

  const onMobile = useOnMobile(false);

  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers
  } = useQuery<Query>(ALL_PLAYERS);
  const {
    loading: loadingAllMerits,
    data: dataAllMerits,
    error: errorAllMerits
  } = useQuery<Query>(ALL_MERITS);

  const loading = loadingPlayers || loadingAllMerits;
  const error = errorPlayers || errorAllMerits;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const players = dataPlayers.allPlayers.nodes.filter(p => p.active);
  const allMerits = dataAllMerits.allMerits.edges;
  let maxMeritValue = 0;
  allMerits.forEach(merit => {
    if (merit.node.active && merit.node.categorie !== "Malus") {
      maxMeritValue += merit.node.value;
    }
  });
  interface ElementPosition {
    top: number;
    left: number;
  }
  function openLootWindow(
    playerName: string,
    lootData: Loot[],
    lootLvl: number,
    iconClientPos: ElementPosition,
    classColor: string,
    totalRaid: number
  ) {
    const nameFound = lootWindows.find(element => {
      // check si la fenetre correspondant à ce name est deja ouverte
      return element.playerName === playerName && element.lootLvl === lootLvl;
    });
    if (!nameFound) {
      setLootWindows((prevState: LootWindowProps[]) => {
        return [
          ...prevState,
          {
            playerName,
            lootData,
            lootLvl,
            iconClientPos,
            classColor,
            totalRaid
          }
        ];
      });
    } else {
      closeLootWindow(playerName, lootLvl);
    }
  }
  function closeLootWindow(playerName: string, lootLvl: number) {
    const newWindowsList = lootWindows.filter(
      lootWindow =>
        !(
          lootWindow.playerName === playerName && lootWindow.lootLvl === lootLvl
        )
    );
    setLootWindows(newWindowsList);
  }

  function handleChange(event: React.ChangeEvent<{}>, newValue: number) {
    setCurrentTabIndex(newValue);
  }

  return (
    <div
      className={`${classes.root} ${classes["indicator_" + currentTabIndex]}`}
    >
      &nbsp;&nbsp;&nbsp;&nbsp;Voir les rerolls
      <Switch
        size="small"
        checked={!shouldHideReroll}
        onChange={toggleShouldHideReroll}
      />
      <AppBar position="static" color="default">
        <Tabs
          value={currentTabIndex}
          onChange={handleChange}
          indicatorColor="primary"
          textColor="primary"
          variant="scrollable"
          scrollButtons="auto"
          aria-label="Player summary"
        >
          {playerClasses.map((playerClass, index) => (
            <Tab
              key={`summary-header-tab-${playerClass}`}
              className={classes.tab}
              label={playerClass}
              id={`scrollable-auto-tab-${index}`}
              aria-controls={`scrollable-auto-tabpanel-${index}`}
            />
          ))}
        </Tabs>
      </AppBar>
      {playerClasses.map((playerClass: string, index) => {
        const currentPlayers: Player[] = players.filter(player =>
          player.classByClassId.name.includes(playerClass)
        );
        return (
          <TabPanel
            key={`summary-content-tab-${playerClass}`}
            value={currentTabIndex}
            index={index}
          >
            <PlayersTable
              shouldHideReroll={shouldHideReroll}
              showed={currentTabIndex === index}
              classColor={getClassColor(playerClass, true)}
              players={currentPlayers}
              maxMeritValue={maxMeritValue}
              openLootWindow={openLootWindow}
            />
          </TabPanel>
        );
      })}
      {lootWindows.map(lootWindow => (
        <LootWindow
          key={"lootWindow" + lootWindow.playerName + lootWindow.lootLvl}
          {...lootWindow}
          closeLootWindow={closeLootWindow}
          onMobile={onMobile}
        />
      ))}
    </div>
  );
}
