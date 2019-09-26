import React from "react";
import { makeStyles, Theme } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Typography from "@material-ui/core/Typography";
import Box from "@material-ui/core/Box";
import PlayersTable from "../../components/summary/PlayersTable";

interface TabPanelProps {
  children?: React.ReactNode;
  index: any;
  value: any;
}

function TabPanel(props: TabPanelProps) {
  const { children, value, index, ...other } = props;

  return (
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
          <Tab label="Guerrier" {...a11yProps(7)} />
        </Tabs>
      </AppBar>
      <TabPanel value={value} index={0}>
        <PlayersTable showed={value === 0} classColor={classColors.druide} />
      </TabPanel>
      <TabPanel value={value} index={1}>
        <PlayersTable showed={value === 1} classColor={classColors.chasseur} />
      </TabPanel>
      <TabPanel value={value} index={2}>
        <PlayersTable showed={value === 2} classColor={classColors.mage} />
      </TabPanel>
      <TabPanel value={value} index={3}>
        <PlayersTable showed={value === 3} classColor={classColors.pretre} />
      </TabPanel>
      <TabPanel value={value} index={4}>
        <PlayersTable showed={value === 4} classColor={classColors.voleur} />
      </TabPanel>
      <TabPanel value={value} index={5}>
        <PlayersTable showed={value === 5} classColor={classColors.chaman} />
      </TabPanel>
      <TabPanel value={value} index={6}>
        <PlayersTable showed={value === 6} classColor={classColors.demoniste} />
      </TabPanel>
      <TabPanel value={value} index={7}>
        <PlayersTable showed={value === 7} classColor={classColors.guerrier} />
      </TabPanel>
    </div>
  );
}
