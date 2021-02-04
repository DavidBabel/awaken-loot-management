import { useQuery } from "@apollo/react-hooks";
import { Container, Paper, Typography } from "@material-ui/core";
import { makeStyles } from "@material-ui/core/styles";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import ClassAvatar from "../../../components/ClassAvatar";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { MeritLine } from "../../../components/MeritLine";
import { useMemberContext } from "../../../lib/context/member";
import { Merit, Query } from "../../../lib/generatedTypes";
import {
  PLAYER_MERIT,
  PlayerMeritVariables
} from "../../../lib/gql/merit-queries";
import { ONE_PLAYER } from "../../../lib/gql/player-queries";
import { role } from "../../../lib/role-level";
import { byValue } from "../../../lib/utils/sorter";
import { stringToId } from "../../../lib/utils/string";

const useStyles = makeStyles({
  paper: {
    width: "97%",
    padding: "20px 35px",
    flexShrink: 0
  }
});

function scrollTo(elementId: string) {
  const element = document.getElementById(elementId);
  if (element) {
    element.scrollIntoView({ behavior: "smooth", block: "center" });
  }
}

function trimParenthesis(str: string) {
  return str.split(" (")[0];
}

export default function PageEditPlayer() {
  const router = useRouter();
  const member = useMemberContext();
  const playerId = parseInt(String(router.query.playerId));
  const classes = useStyles("");

  // TODO state filter active

  const {
    loading: loadingMerits,
    data: dataMerits,
    error: errorMerits
  } = useQuery<Query, PlayerMeritVariables>(PLAYER_MERIT, {
    variables: { playerId }
  });
  const {
    loading: loadingPlayer,
    data: dataPlayer,
    error: errorPlayer
  } = useQuery<Query, PlayerMeritVariables>(ONE_PLAYER, {
    variables: { playerId }
  });

  const [playerAllMerits, setPlayerAllMerits] = useState(0);
  const [sumOfAllMerits, setSumOfAllMerits] = useState(0);
  const [playerApprovedMerits, setPlayerApprovedMerits] = useState(0);
  const [sortedMerits, setSortedMerits] = useState<SortedMerits>({});

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

  function updateCalc({
    meritsCount,
    validatedMeritsCount
  }: {
    meritsCount?: number;
    validatedMeritsCount?: number;
  }) {
    if (meritsCount) {
      setPlayerAllMerits(playerAllMerits + meritsCount);
    }
    if (validatedMeritsCount) {
      setPlayerApprovedMerits(playerApprovedMerits + validatedMeritsCount);
    }
  }

  useEffect(() => {
    let sumOfAllMeritsCalc = 0;
    let playerAllMeritsCalc = 0;
    let playerApprovedMeritsCalc = 0;
    const sortedMeritsCalc: SortedMerits = userMerits.reduce(
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
          sumOfAllMeritsCalc += merit.value;
        }
        const meritCalc = merit.playerMeritsByMeritId.nodes[0];
        if (meritCalc) {
          playerAllMeritsCalc += merit.value;
          if (meritCalc.validated) {
            playerApprovedMeritsCalc += merit.value;
          }
        }
        // end of counter
        return stack;
      },
      {}
    );
    setSortedMerits(sortedMeritsCalc);
    setSumOfAllMerits(sumOfAllMeritsCalc);
    setPlayerAllMerits(playerAllMeritsCalc);
    setPlayerApprovedMerits(playerApprovedMeritsCalc);
  }, []);

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
                <span className="linkTitle">
                  {trimParenthesis(meritCategorieName)}
                </span>{" "}
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
                    {...{
                      ...merit,
                      categorie: trimParenthesis(merit.categorie)
                    }}
                    playerId={playerId}
                    parentLoading={loading}
                    isOfficer={member.level >= role.class_master}
                    updateCalc={updateCalc}
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
