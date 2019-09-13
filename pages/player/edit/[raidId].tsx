import { useQuery } from "@apollo/react-hooks";
import { useRouter } from "next/router";
import { BossCard } from "../../../components/BossCard";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { Query } from "../../../lib/generatedTypes";
import { ONE_RAID } from "../../../lib/gql/raid-queries";

// interface Props {
//   raidId: number;
// }

interface Variables {
  raidId: number;
}

export default function PageEditRaid(/* { raidId }: Props */) {
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));

  const { loading, data, error } = useQuery<Query, Variables>(ONE_RAID, {
    variables: { raidId }
  });
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentRaid = data.allRaids.nodes[0];
  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  const donjonShortName = currentRaid.donjonByDonjonId.shortName;

  return (
    <div>
      {bosses.map(boss => {
        return (
          <BossCard
            key={boss.name}
            {...boss}
            donjonShortName={donjonShortName}
          />
        );
      })}
    </div>

    // <button onClick={() => router.push({ path: '/seeRaid', query: { id } })}>
    //   <div>{date}</div>
    //   <div>{name}</div>
    // </button>
  );
}
