import { useQuery } from "@apollo/react-hooks";
import { Button } from "@material-ui/core";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import Tab from "@material-ui/core/Tab";
import Tabs from "@material-ui/core/Tabs";
import { useRouter } from "next/router";
import { useContext, useState } from "react";
import ClassAvatar from "../../../components/ClassAvatar";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import LootsTable from "../../../components/PlayerPage/LootsTable";
import MeritsTable from "../../../components/PlayerPage/MeritsTable";
import RaidsTable from "../../../components/PlayerPage/RaidsTable";
import MemberContext from "../../../lib/context/member";
import { Query } from "../../../lib/generatedTypes";
import { ONE_PLAYER } from "../../../lib/gql/player-queries";
import { role } from "../../../lib/role-level";

const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",
    height: "calc(100vh - 140px)",
    [theme.breakpoints.down("sm")]: {
      height: "calc(100vh - 60px)"
    },
    display: "flex",
    flexDirection: "column",
    textAlign: "center",
    margin: "0px auto"
  },
  tabsAndContent: {
    width: "80%",
    [theme.breakpoints.down("sm")]: {
      width: "95%"
    },
    flexGrow: 0,
    height: "48px",
    margin: "10px auto"
  },
  tabs: {
    "& .MuiTabs-flexContainer": {
      alignItems: "center!important" as "alignItems"
    },
    "& *": { fontSize: 12 }
  },
  nickname: {
    fontSize: "18px",
    fontWeight: "bold"
  },
  stuffBtn: {
    "& a": {
      textDecoration: "none"
    }
  }
}));
interface Variables {
  playerId: number;
}

export default function PageSeePlayer(/*{ playerId }: Props */) {
  const classes = useStyles("");
  const [value, setValue] = useState(1);
  const member = useContext(MemberContext);

  const handleChange = (event: React.ChangeEvent<{}>, newValue: number) => {
    setValue(newValue);
  };
  const router = useRouter();
  const playerId = parseInt(String(router.query.playerId));

  const { loading, data, error } = useQuery<Query, Variables>(ONE_PLAYER, {
    variables: { playerId }
  });
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  if (data.allPlayers.nodes.length === 0) {
    return <div>Aucun joueur trouvé avec cette id.</div>;
  }
  const currentPlayer = data.allPlayers.nodes[0];
  const loots = currentPlayer.lootsByPlayerId.nodes;
  const raids = currentPlayer.raidPlayersByPlayerId.nodes;
  const merits = currentPlayer.playerMeritsByPlayerId.nodes;

  const lootNb = loots.filter(loot => loot.active).length;
  const raidNb = raids.filter(raid => raid.raidByRaidId.active).length;
  const meritNb = merits.filter(merit => merit.meritByMeritId.active).length;

  return (
    <div className={classes.root}>
      <ClassAvatar playerClass={currentPlayer.classByClassId.name} />
      <span className={classes.nickname}>{currentPlayer.name}</span>
      <Paper className={classes.tabsAndContent}>
        <Tabs
          value={value}
          onChange={handleChange}
          indicatorColor="primary"
          centered={true}
          className={classes.tabs}
        >
          <Tab label={`Merits(${meritNb})`} />
          <Tab label={`Loots(${lootNb})`} />
          <Tab label={`Raids(${raidNb})`} />
          <div className={classes.stuffBtn}>
            <a
              target="_blank"
              href={`https://ironforge.pro/players/Sulfuron/${currentPlayer.name}/`}
            >
              <Button variant="contained" color="primary">
                STUFF
              </Button>
            </a>
          </div>
          {member.level >= role.class_master && (
            <div className={classes.stuffBtn} style={{ marginLeft: 10 }}>
              <a target="_blank" href={`/player/merit/${currentPlayer.id}`}>
                <Button variant="contained" color="primary">
                  Valider les mérites
                </Button>
              </a>
            </div>
          )}
        </Tabs>
        <MeritsTable hidden={value !== 0} merits={merits} />
        <LootsTable hidden={value !== 1} loots={loots} />
        <RaidsTable hidden={value !== 2} raids={raids} />
      </Paper>
    </div>
  );
}
