import { useState } from "react";
import { useQuery } from "@apollo/react-hooks";
import { useRouter } from "next/router";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { Query } from "../../../lib/generatedTypes";
import { ONE_PLAYER } from "../../../lib/gql/player-queries";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import ClassAvatar from "../../../components/ClassAvatar";
import MeritsTable from "../../../components/PlayerPage/MeritsTable";
import LootsTable from "../../../components/PlayerPage/LootsTable";
import RaidsTable from "../../../components/PlayerPage/RaidsTable";

const useStyles = makeStyles({
  root: {
    width: "calc(100vw - 300px)",
    display: "flex",
    flexDirection: "column",
    textAlign: "center",
    margin: "0px auto"
  },
  tabs: {
    width: "80%",
    flexGrow: 0,
    height: "48px",
    margin: "10px auto"
  },
  nickname: {
    fontSize: "18px",
    fontWeight: "bold"
  }
});
interface Variables {
  playerId: number;
}

export default function PageSeePlayer(/*{ playerId }: Props */) {
  const classes = useStyles("");
  const [value, setValue] = useState(1);

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

  return (
    <div className={classes.root}>
      <ClassAvatar playerClass={currentPlayer.classByClassId.name} />
      <span className={classes.nickname}>{currentPlayer.name}</span>
      <Paper className={classes.tabs}>
        <Tabs
          value={value}
          onChange={handleChange}
          indicatorColor="primary"
          textColor="primary"
          centered
        >
          <Tab label="Merits" />
          <Tab label="Loots" />
          <Tab label="Raids" />
        </Tabs>
        <MeritsTable hidden={value !== 0} merits={merits} />
        <LootsTable hidden={value !== 1} loots={loots} />
        <RaidsTable hidden={value !== 2} raids={raids} />
      </Paper>
    </div>
  );
}
