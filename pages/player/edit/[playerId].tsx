import { useQuery } from "@apollo/react-hooks";
import { Typography } from "@material-ui/core";
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

interface Variables {
  playerId: number;
}

export default function PageEditPlayer() {
  const router = useRouter();
  const member = useContext(MemberContext);
  const playerId = parseInt(String(router.query.playerId));

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

  const sortedMerits: SortedMerits = userMerits.reduce(
    (stack: SortedMerits, next: Merit) => {
      const categorie = next.categorie;
      const merit = { ...next };
      if (!stack[categorie]) {
        stack[categorie] = [];
      }
      stack[categorie].push(merit);
      return stack;
    },
    {}
  );

  // TODO beautiful that
  if (member.level <= role.player && member.userid !== playerId) {
    return (
      <div>Seul les officiers et les joueurs eux même peuvent s'éditer</div>
    );
  }

  if (currentPlayer.active === false) {
    return <div>Ce joueur est désactivé</div>;
  }

  return (
    <div>
      <Typography gutterBottom={true} variant="h3" /* component="h2" */>
        <ClassAvatar playerClass={currentPlayer.classByClassId.name}>
          Mérite de {currentPlayer.name}
        </ClassAvatar>
      </Typography>
      {Object.keys(sortedMerits).map((meritCategorieName: string) => {
        const currentCategorie = sortedMerits[meritCategorieName];
        return (
          <div key={`${meritCategorieName}`}>
            <Typography gutterBottom={true} variant="h5" /* component="h2" */>
              {meritCategorieName}
              {/* {loading && (
                <CircularProgress
                  style={{ margin: 2 }}
                  disableShrink={true}
                  size={24}
                />
              )} */}
            </Typography>
            {currentCategorie.map((merit: Merit) => (
              <MeritLine
                key={`${merit.name}-${merit.categorie}-merit`}
                {...merit}
                playerId={playerId}
                refetchMerits={refetch}
                parentLoading={loading}
              />
            ))}
          </div>
        );
      })}
    </div>
  );
}
