import { useQuery } from "@apollo/react-hooks";
import { Typography } from "@material-ui/core";
import { useRouter } from "next/router";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { MeritLine } from "../../../components/MeritLine";
import { Merit, Query } from "../../../lib/generatedTypes";
import { PLAYER_MERIT } from "../../../lib/gql/merit-queries";

interface Variables {
  playerId: number;
}

export default function PageEditPlayer() {
  const router = useRouter();
  const playerId = parseInt(String(router.query.playerId));

  // TODO state filter active

  const { loading, data, error } = useQuery<Query, Variables>(PLAYER_MERIT, {
    variables: { playerId }
  });
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const userMerits = data.allMerits.nodes;

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

  return (
    <div>
      {Object.keys(sortedMerits).map((meritCategorieName: string) => {
        const currentCategorie = sortedMerits[meritCategorieName];
        return (
          <div key={`${meritCategorieName}`}>
            <Typography gutterBottom={true} variant="h5" component="h2">
              {meritCategorieName}
            </Typography>
            {currentCategorie.map((merit: Merit) => (
              <MeritLine
                key={`${merit.name}-${merit.categorie}-merit`}
                {...merit}
                playerId={playerId}
              />
            ))}
          </div>
        );
      })}
    </div>
  );
}
