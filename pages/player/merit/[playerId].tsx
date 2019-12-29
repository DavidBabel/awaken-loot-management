import { useQuery } from "@apollo/react-hooks";
import { Container, Paper, Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import { useRouter } from "next/router";
import { useContext } from "react";
import ClassAvatar from "../../../components/ClassAvatar";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { MeritLine } from "../../../components/MeritLine";
import MemberContext from "../../../lib/context/member";
import { Merit, Query } from "../../../lib/generatedTypes";
import { PLAYER_MERIT } from "../../../lib/gql/merit-queries";
import { ONE_PLAYER } from "../../../lib/gql/player-queries";
import { role } from "../../../lib/role-level";
import { byValue } from "../../../lib/utils/sorter";
import { stringToId } from "../../../lib/utils/string";

interface Variables {
  playerId: number;
}

const useStyles = makeStyles({
  paper: {
    width: "97%",
    padding: "20px 35px",
    flexShrink: 0
  }
});

export default function PageEditPlayer() {
  const router = useRouter();
  const member = useContext(MemberContext);
  const playerId = parseInt(String(router.query.playerId));
  const classes = useStyles("");

  // TODO state filter active

  const {
    loading: loadingMerits,
    data: dataMerits,
    error: errorMerits,
    refetch
  } = useQuery<Query, Variables>(PLAYER_MERIT, {
    variables: { playerId }
  });
  const {
    loading: loadingPlayer,
    data: dataPlayer,
    error: errorPlayer
  } = useQuery<Query, Variables>(ONE_PLAYER, {
    variables: { playerId }
  });

  const loading = loadingMerits || loadingPlayer;
  const error = errorMerits || errorPlayer;
  if (!dataMerits || !dataMerits.allMerits || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const userMerits = dataMerits.allMerits.nodes;
  const currentPlayer = dataPlayer.allPlayers.nodes[0];

  interface SortedMerits {
    [key: string]: Merit[];
  }

  let sumOfAllMerits = 0;
  let playerAllMerits = 0;
  let playerApprovedMerits = 0;

  const sortedMerits: SortedMerits = userMerits.reduce(
    (stack: SortedMerits, next: Merit) => {
      if (next.active === false) {
        return stack;
      }
      const categorie = next.categorie;
      const merit = { ...next };
      if (!stack[categorie]) {
        stack[categorie] = [];
      }
      stack[categorie].push(merit);
      // counter
      if (merit.categorie !== "Malus") {
        sumOfAllMerits += merit.value;
      }
      const meritCalc = merit.playerMeritsByMeritId.nodes[0];
      if (meritCalc) {
        playerAllMerits += merit.value;
        if (meritCalc.validated) {
          playerApprovedMerits += merit.value;
        }
      }
      // end of counter
      return stack;
    },
    {}
  );

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

  const scrollTo = (elementId: string) => {
    const element = document.getElementById(elementId);
    if (element) {
      element.scrollIntoView({ behavior: "smooth", block: "center" });
    }
  };

  return (
    <Container>
      <Typography gutterBottom={true} variant="h3">
        <ClassAvatar playerClass={currentPlayer.classByClassId.name}>
          Mérite de {currentPlayer.name}
        </ClassAvatar>
      </Typography>

      <Paper className={classes.paper}>
        <Typography variant="h4" style={{ marginBottom: 30 }}>
          {playerApprovedMerits} / {sumOfAllMerits} points de mérite (+{" "}
          {playerAllMerits - playerApprovedMerits} à valider)
        </Typography>
        <Typography style={{ marginBottom: 30 }}>
          Pour faire valider vos mérites vous devez envoyer un message sur
          discord
          <br /> à votre maître de classe avec les preuves de votre mérite
          (screenshots ou autre)
          <br /> et le lien de cette page.
        </Typography>
        <div className="fastMenu">
          <b>
            {playerApprovedMerits} / {sumOfAllMerits} pts (+{" "}
            {playerAllMerits - playerApprovedMerits} à valider)
          </b>
          {Object.keys(sortedMerits).map((meritCategorieName: string) => {
            const currentCategorieSize =
              sortedMerits[meritCategorieName].length;

            const playerMeritCount = sortedMerits[meritCategorieName].filter(
              (merit: Merit) =>
                merit?.playerMeritsByMeritId?.nodes?.length === 1
            ).length;

            return (
              <div
                key={`links-${meritCategorieName}`}
                onClick={() => scrollTo(stringToId(meritCategorieName))}
              >
                <span className="linkTitle">{meritCategorieName}</span>{" "}
                <span className="linkCount">
                  ({playerMeritCount}/{currentCategorieSize})
                </span>
              </div>
            );
          })}
        </div>
        <style jsx>{`
          @media (max-width: 1280px) {
            .fastMenu {
              display: none;
            }
          }
          .fastMenu {
            cursor: pointer;
            position: fixed;
            left: 70%;
            top: 25%;
          }
          .fastMenu div:hover .linkTitle {
            text-decoration: underline;
          }
          .fastMenu div:hover:before {
            position: absolute;
            left: -12px;
            content: ">";
          }
          .fastMenu div .linkCount {
            color: grey;
          }
          .fastMenu div:hover .linkCount {
            color: black;
          }
        `}</style>

        {Object.keys(sortedMerits).map((meritCategorieName: string) => {
          const currentCategorie = sortedMerits[meritCategorieName];

          return (
            <div
              key={`groups-${meritCategorieName}`}
              id={stringToId(meritCategorieName)}
            >
              <Typography
                gutterBottom={true}
                variant="h5"
                style={{ marginTop: 8 }}
              >
                {meritCategorieName}
                {/* {loading && (
                <CircularProgress
                  style={{ margin: 2 }}
                  disableShrink={true}
                  size={24}
                />
              )} */}
              </Typography>
              <div>
                {currentCategorie.sort(byValue("order")).map((merit: Merit) => (
                  <MeritLine
                    key={`${merit.name}-${merit.categorie}-merit`}
                    {...merit}
                    playerId={playerId}
                    refetchMerits={refetch}
                    parentLoading={loading}
                    isOfficer={member.level >= role.class_master}
                  />
                ))}
              </div>
            </div>
          );
        })}
      </Paper>
    </Container>
  );
}
