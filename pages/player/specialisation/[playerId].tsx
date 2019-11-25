import React, { useContext, useEffect, useState } from "react";

import { useMutation, useQuery } from "@apollo/react-hooks";
import {
  Button,
  Container,
  Paper,
  TextField,
  Typography
} from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import { useRouter } from "next/router";
import ClassAvatar from "../../../components/ClassAvatar";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import MemberContext from "../../../lib/context/member";
import { Mutation, Query } from "../../../lib/generatedTypes";

import { UPDATE_PLAYER_SPE } from "../../../lib/gql/player-mutations";
import { ONE_PLAYER } from "../../../lib/gql/player-queries";
import { role } from "../../../lib/role-level";
import { refreshWowhead } from "../../../lib/utils/wowhead-refresh";

interface QueryVariables {
  playerId: number;
}
interface MutationVariables {
  playerId: number;
  speLink: string;
}

const useStyles = makeStyles({
  paper: {
    width: "90%",
    padding: "20px 35px",
    flexShrink: 0
  }
});

export default function PageEditPlayer() {
  const router = useRouter();
  const member = useContext(MemberContext);
  const playerId = parseInt(String(router.query.playerId));
  const classes = useStyles("");
  const [currentSpe, setSpe] = useState("");

  // TODO state filter active

  const { loading, data, error /* , refetch */ } = useQuery<
    Query,
    QueryVariables
  >(ONE_PLAYER, {
    variables: { playerId }
  });

  const [updatePlayerSpe] = useMutation<Mutation, MutationVariables>(
    UPDATE_PLAYER_SPE
  );

  useEffect(() => {
    setSpe(data.allPlayers.nodes[0].specialisation);
  }, [data]);

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentPlayer = data.allPlayers.nodes[0];

  if (member.level <= role.player && member.userid !== playerId) {
    // TODO beautiful that
    return (
      <div>Seul les officiers et les joueurs eux même peuvent s'éditer</div>
    );
  }

  if (currentPlayer.active === false) {
    // TODO beautiful that
    return <div>Ce joueur est désactivé</div>;
  }

  function handleChangePlayerSpe(
    event: React.ChangeEvent<{ value: string }>
  ): void {
    setSpe(event.target.value as string);
  }

  // tslint:disable:no-console
  function updateSpe() {
    if (!currentSpe.startsWith("https://classic.wowhead.com/talent-calc")) {
      // TODO manage errors and messages
      return;
    }
    updatePlayerSpe({
      variables: {
        playerId,
        speLink: currentSpe
      }
    })
      .then(() => window.location.reload())
      .catch(() => {
        console.log("errors");
      });
  }
  useEffect(refreshWowhead);

  return (
    <Container>
      <Typography gutterBottom={true} variant="h3">
        <ClassAvatar playerClass={currentPlayer.classByClassId.name}>
          Spécialisation de {currentPlayer.name}
        </ClassAvatar>
      </Typography>

      <Paper className={classes.paper}>
        <Typography>
          Vous pouvez éditer votre spécialisation{" "}
          <a target="_blank" href="https://classic.wowhead.com/talent-calc/">
            sur wowhead
          </a>{" "}
          et copier le liens dans le champ suivant :
        </Typography>

        <TextField
          style={{ width: "60%" }}
          value={currentSpe}
          onChange={handleChangePlayerSpe}
        />
        <Button onClick={updateSpe} color="primary" variant="outlined">
          Mettre à jour
        </Button>
      </Paper>
      <a
        href={currentPlayer.specialisation.replace(
          "talent-calc/",
          "talent-calc/embed/"
        )}
      >
        loading spécialisation ...
      </a>
    </Container>
  );
}
