import { useQuery } from "@apollo/react-hooks";
import { makeStyles } from "@material-ui/core/styles";
import { useRouter } from "next/router";
import { BossCard } from "../../../components/BossCard";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { Query } from "../../../lib/generatedTypes";
import { ONE_RAID } from "../../../lib/gql/raid-queries";

interface Variables {
  raidId: number;
}
const useStyles = makeStyles({
  root: {
    width: "100%",
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center"
  }
});

export default function PageRaidView(/* { raidId }: Props */) {
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));

  const { loading, data, error } = useQuery<Query, Variables>(ONE_RAID, {
    variables: { raidId }
  });
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentRaid = data.allRaids.nodes[0];
  const loots = currentRaid.lootsByRaidId.nodes;
  // const allPlayers = currentRaid.raidPlayersByRaidId.nodes.sort(
  //   raidPlayerByClass
  // );
  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  const donjonShortName = currentRaid.donjonByDonjonId.shortName;
  const classes = useStyles("");
  return (
    <div className={classes.root}>
      {bosses.map(boss => {
        const lootedForThisBoss = [...loots].filter(loot => {
          if (loot.itemByItemId.bossItemsByItemId.nodes.length === 0) {
            // A CORRIGER en BDD (par exemple le defenseur de malistar n'a pas de bossID attaché a lui)
          }
          return (
            loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
            loot.itemByItemId.bossItemsByItemId.nodes[0].bossByBossId.id ===
              boss.id
          );
        });
        return (
          <BossCard
            key={boss.id}
            {...boss}
            donjonShortName={donjonShortName}
            looted={lootedForThisBoss}
          />
        );
      })}
    </div>
  );
}
