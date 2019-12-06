import React, { useContext, useEffect, useState } from "react";

import { useMutation, useQuery } from "@apollo/react-hooks";
import {
  Button,
  Container,
  Grid,
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

import { useSnackBar } from "../../../lib/hooks/snackbar";

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
  },
  speContainer: {
    textAlign: "center",
    minHeight: 500
  }
});

export default function PageEditPlayer() {
  const router = useRouter();
  const member = useContext(MemberContext);
  const playerId = parseInt(String(router.query.playerId));
  const classes = useStyles("");
  const [currentSpe, setSpe] = useState("");

  const { openSnackBar, DefaultSnackBar } = useSnackBar();

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

  function getSpecUrl() {
    return currentPlayer.specialisation.replace(
      "talent-calc/",
      "talent-calc/embed/"
    );
  }

  function isValidWowheadUrl() {
    if (!currentSpe) {
      return false;
    }
    return currentSpe.startsWith("https://classic.wowhead.com/talent-calc");
  }

  useEffect(() => {
    setSpe(data.allPlayers.nodes[0].specialisation);
  }, [data]);

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentPlayer = data.allPlayers.nodes[0];

  if (currentPlayer.active === false) {
    return <div>Ce joueur est désactivé</div>;
  }

  function handleChangePlayerSpe(
    event: React.ChangeEvent<{ value: string }>
  ): void {
    setSpe(event.target.value as string);
  }

  // tslint:disable:no-console
  function updateSpe() {
    if (!isValidWowheadUrl()) {
      openSnackBar(
        "L'url de votre spécialisation n'a pas l'air d'être valide",
        "error"
      );
      return;
    }
    updatePlayerSpe({
      variables: {
        playerId,
        speLink: currentSpe
      }
    })
      .then(() => {
        openSnackBar("Succès", "success");
        window.location.reload();
      })
      .catch(() => {
        console.log("errors");
      });
  }
  useEffect(refreshWowhead);

  const wowHeadLink = isValidWowheadUrl()
    ? currentSpe
    : "https://classic.wowhead.com/talent-calc/";

  return (
    <>
      <Container>
        <Typography gutterBottom={true} variant="h3">
          <ClassAvatar playerClass={currentPlayer.classByClassId.name}>
            Spécialisation de {currentPlayer.name}
          </ClassAvatar>
        </Typography>

        <Paper className={classes.paper}>
          {(member.level >= role.class_master ||
            member.userid === playerId) && (
            <>
              <Typography>
                Vous pouvez éditer votre spécialisation{" "}
                <a target="_blank" href={wowHeadLink}>
                  sur wowhead
                </a>{" "}
                et copier le lien de votre navigateur dans le champ suivant :
              </Typography>
              <Grid container style={{ marginBottom: 40, marginTop: 15 }}>
                <Grid item xs={9}>
                  <TextField
                    style={{ width: "95%" }}
                    value={currentSpe}
                    onChange={handleChangePlayerSpe}
                  />
                </Grid>
                <Grid item xs={3}>
                  <Button
                    onClick={updateSpe}
                    color="primary"
                    variant="outlined"
                  >
                    Mettre à jour
                  </Button>
                </Grid>
              </Grid>
            </>
          )}
          <div className={classes.speContainer}>
            {currentPlayer.specialisation ? (
              <a href={getSpecUrl()}>loading spécialisation ...</a>
            ) : (
              "Ce joueur n'a pas encore rempli sa spécialisation"
            )}
          </div>
        </Paper>
      </Container>
      <DefaultSnackBar />
    </>
  );
}
