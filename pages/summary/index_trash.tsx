import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";

const classColors = {
  druide: "rgba(255,125,10,0.5)",
  chasseur: "rgba(171,212,115,0.5)",
  mage: "rgba(64,199,235,0.5)",
  pretre: "rgba(255,255,255,0.5)",
  voleur: "rgba(255,245,105,0.5)",
  chaman: "rgba(0,112,122,0.5)",
  demoniste: "rgba(135,135,237,0.5)",
  guerrier: "rgba(199,156,110,0.5)"
};

const useStyles = makeStyles({
  root: {
    flexGrow: 1
  },
  druide: { backgroundColor: classColors.druide },
  chasseur: { backgroundColor: classColors.chasseur },
  mage: { backgroundColor: classColors.mage },
  pretre: { backgroundColor: classColors.pretre },
  voleur: { backgroundColor: classColors.voleur },
  chaman: { backgroundColor: classColors.chaman },
  demoniste: { backgroundColor: classColors.demoniste },
  guerrier: { backgroundColor: classColors.guerrier },
  indicator: {
    backgroundColor: classColors.guerrier
  }
});

export default function PageIndex() {
  const classes = useStyles("");
  const [value, setValue] = React.useState(0);

  function handleChange(event: React.ChangeEvent<{}>, newValue: number) {
    setValue(newValue);
  }

  return (
    <Paper className={classes.root}>
      <Tabs value={value} onChange={handleChange} textColor="primary" centered>
        <Tab className={classes.druide} label="Druide" />
        <Tab className={classes.chasseur} label="Chasseur" />
        <Tab className={classes.mage} label="Mage" />
        <Tab className={classes.pretre} label="Prêtre" />
        <Tab className={classes.voleur} label="Voleur" />
        <Tab className={classes.chaman} label="Chaman" />
        <Tab className={classes.demoniste} label="Démoniste" />
        <Tab className={classes.guerrier} label="Guerrier" />
      </Tabs>
    </Paper>
  );
}
