import { useQuery } from "@apollo/react-hooks";
import { useRouter } from "next/router";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { MeritLine } from "../../../components/MeritLine";
import { Merit, Query } from "../../../lib/generatedTypes";
import { PLAYER_MERIT } from "../../../lib/gql/merit-queries";

interface Variables {
  playerId: number;
}

export default function PageEditRaid() {
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

  return (
    <div>
      {userMerits.map((userMerit: Merit) => (
        <MeritLine key={userMerit.name} {...userMerit} />
      ))}
    </div>

    // <button onClick={() => router.push({ path: '/seeRaid', query: { id } })}>
    //   <div>{date}</div>
    //   <div>{name}</div>
    // </button>
  );
}
