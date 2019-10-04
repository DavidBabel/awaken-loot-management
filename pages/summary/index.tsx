import React from "react";
import { makeStyles, Theme } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import PlayersTable from "../../components/summary/PlayersTable";

import { useQuery } from "@apollo/react-hooks";
import { Query } from "../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { ALL_MERITS } from "../../lib/gql/merit-queries";
import { LoadingAndError } from "../../components/LoadingAndErrors";

interface TabPanelProps {
  children?: React.ReactNode;
  index: any;
  value: any;
}

function TabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props;

  return value !== index ? (
    <div></div>
  ) : (
    <Typography
      component="div"
      role="tabpanel"
      hidden={value !== index}
      id={`scrollable-auto-tabpanel-${index}`}
      aria-labelledby={`scrollable-auto-tab-${index}`}
      {...other}
    >
      <Box p={3}>{children}</Box>
    </Typography>
  );
}

function a11yProps(index: any) {
  return {
    id: `scrollable-auto-tab-${index}`,
    "aria-controls": `scrollable-auto-tabpanel-${index}`
  };
}
const classColors = {
  druide: "rgba(255,125,10)",
  chasseur: "rgba(171,212,115)",
  mage: "rgba(105,204,240)",
  pretre: "rgba(255,255,255)",
  voleur: "rgba(255,245,105)",
  chaman: "rgba(0,112,222)",
  demoniste: "rgba(148,130,201)",
  guerrier: "rgba(199,156,110)"
};

const useStyles = makeStyles((theme: Theme) => ({
  root: {
    width: "calc(100vw - 300px)",
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
    }
  },
  indicator_0: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.druide }
  },
  indicator_1: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.chasseur }
  },
  indicator_2: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.mage }
  },
  indicator_3: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.pretre }
  },
  indicator_4: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.voleur }
  },
  indicator_5: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.chaman }
  },
  indicator_6: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.demoniste }
  },
  indicator_7: {
    "& .MuiTabs-indicator": { backgroundColor: classColors.guerrier }
  }
}));

export default function PageIndex() {
  const classes = useStyles("");
  const [value, setValue] = React.useState(0);
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

  const players = dataPlayers.allPlayers.nodes;
  const allMerits = dataAllMerits.allMerits.edges;
  let maxMeritValue = 0;
  allMerits.map(merit => {
    if (merit.node.active) {
      maxMeritValue += merit.node.value;
    }
  });

  const pretres = players.filter(player => player.classByClassId.id === 1);
  const mages = players.filter(player => player.classByClassId.id === 2);
  const demonistes = players.filter(player => player.classByClassId.id === 3);
  const voleurs = players.filter(player => player.classByClassId.id === 4);
  const druides = players.filter(player => player.classByClassId.id === 5);
  const chasseurs = players.filter(player => player.classByClassId.id === 6);
  const chamans = players.filter(player => player.classByClassId.id === 7);
  const guerriersTank = players.filter(
    player => player.classByClassId.id === 8
  );
  const guerriersDps = players.filter(player => player.classByClassId.id === 9);

  function handleChange(event: React.ChangeEvent<{}>, newValue: number) {
    setValue(newValue);
  }
  return (
    <div className={`${classes.root} ${classes["indicator_" + value]}`}>
      <AppBar position="static" color="default">
        <Tabs
          value={value}
          onChange={handleChange}
          indicatorColor="primary"
          textColor="primary"
          variant="scrollable"
          scrollButtons="auto"
          aria-label="Player summary"
        >
          <Tab label="Druide" {...a11yProps(0)} />
          <Tab label="Chasseur" {...a11yProps(1)} />
          <Tab label="Mage" {...a11yProps(2)} />
          <Tab label="Prêtre" {...a11yProps(3)} />
          <Tab label="Voleur" {...a11yProps(4)} />
          <Tab label="Chaman" {...a11yProps(5)} />
          <Tab label="Démoniste" {...a11yProps(6)} />
          <Tab label="Guerrier Tank" {...a11yProps(7)} />
          <Tab label="Guerrier DPS" {...a11yProps(8)} />
        </Tabs>
      </AppBar>
      <TabPanel value={value} index={0}>
        <PlayersTable
          showed={value === 0}
          classColor={classColors.druide}
          players={druides}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={1}>
        <PlayersTable
          showed={value === 1}
          classColor={classColors.chasseur}
          players={chasseurs}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={2}>
        <PlayersTable
          showed={value === 2}
          classColor={classColors.mage}
          players={mages}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={3}>
        <PlayersTable
          showed={value === 3}
          classColor={classColors.pretre}
          players={pretres}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={4}>
        <PlayersTable
          showed={value === 4}
          classColor={classColors.voleur}
          players={voleurs}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={5}>
        <PlayersTable
          showed={value === 5}
          classColor={classColors.chaman}
          players={chamans}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={6}>
        <PlayersTable
          showed={value === 6}
          classColor={classColors.demoniste}
          players={demonistes}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={7}>
        <PlayersTable
          showed={value === 7}
          classColor={classColors.guerrier}
          players={guerriersTank}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
      <TabPanel value={value} index={8}>
        <PlayersTable
          showed={value === 8}
          classColor={classColors.guerrier}
          players={guerriersDps}
          maxMeritValue={maxMeritValue}
        />
      </TabPanel>
    </div>
  );
}
