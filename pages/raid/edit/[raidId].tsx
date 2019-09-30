import { useQuery } from "@apollo/react-hooks";
import { Checkbox } from "@material-ui/core";
import { useRouter } from "next/router";
import { useState } from "react";
// import { BossCard } from '../../../components/BossCard';
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { LootList } from "../../../components/LootList";
import { PlayerCard } from "../../../components/PlayerCard";
import { BossMenu } from "../../../components/RaidMenu/BossMenu";
import { RaidMenu } from "../../../components/RaidMenu/RaidMenu";
import { Player, Query } from "../../../lib/generatedTypes";
import { ONE_RAID } from "../../../lib/gql/raid-queries";
import { useToggle } from "../../../lib/hooks/toggle";
import { raidPlayerByClass } from "../../../lib/utils/sorter";

// interface Props {
//   raidId: number;
// }

interface Variables {
  raidId: number;
}

export default function PageRaidView(/* { raidId }: Props */) {
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));

  const [displayLoots, setDisplayLoots] = useState(false);
  const [shouldDisplayAllClass, toggleShouldDisplayAllClass] = useToggle(false);
  const [currentBossId, setCurrentBossId] = useState<number>();
  const [currentItemId, setCurrentItemId] = useState<number>();
  const [playersToInspect, setPlayersToInspect] = useState<Player[]>([]);

  function togglePlayerToInspect(player: Player) {
    if (playersToInspect.map(p => p.id).includes(player.id)) {
      setPlayersToInspect(playersToInspect.filter(p => p.id !== player.id));
    } else {
      setPlayersToInspect([...playersToInspect, player]);
    }
  }

  const { loading, data, error } = useQuery<Query, Variables>(ONE_RAID, {
    variables: { raidId }
  });
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const currentRaid = data.allRaids.nodes[0];
  const loots = currentRaid.lootsByRaidId.nodes;

  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  // const donjonShortName = currentRaid.donjonByDonjonId.shortName;
  const currentBoss = currentBossId
    ? bosses.filter(boss => boss.id === currentBossId)[0]
    : undefined;

  const items = currentBoss ? currentBoss.bossItemsByBossId.nodes : undefined;

  const currentItem =
    currentItemId && items
      ? items.filter(item => item.itemByItemId.id === currentItemId)[0]
          .itemByItemId
      : undefined;

  const allowedClasses =
    currentItem && currentItem.classId ? [currentItem.classId] : [];

  const allPlayers = currentRaid.raidPlayersByRaidId.nodes.sort(
    raidPlayerByClass
  );

  const playersToDisplay = shouldDisplayAllClass
    ? allPlayers
    : allPlayers.filter(player =>
        allowedClasses.includes(player.playerByPlayerId.classId)
      );

  return (
    <>
      <RaidMenu
        raid={currentRaid}
        bosses={bosses}
        goToLoots={() => setDisplayLoots(true)}
        onBossSelect={newBossId => {
          setDisplayLoots(false);
          setCurrentItemId(undefined);
          setPlayersToInspect([]);
          setCurrentBossId(newBossId);
        }}
      />
      {displayLoots && <LootList loots={loots} />}
      {!displayLoots && currentBoss && (
        <BossMenu
          boss={currentBoss}
          onItemSelect={newItemId => {
            setDisplayLoots(false);
            setPlayersToInspect([]);
            setCurrentItemId(newItemId);
          }}
        />
      )}
      <div
        style={{
          // display: 'flex',
          width: "80%",
          flexWrap: "wrap",
          margin: "15px",
          alignItems: "flex-start",
          justifyContent: "center"
        }}
      >
        {!displayLoots && currentItem && (
          <>
            <Checkbox
              checked={shouldDisplayAllClass}
              onClick={toggleShouldDisplayAllClass}
            />{" "}
            Display all classes
            {/* {currentItem} */}
            {playersToDisplay.map(raidPlayer => {
              const player = raidPlayer.playerByPlayerId;
              return (
                <PlayerCard
                  key={`player-${currentItem.id}-${player.name}`}
                  onClick={togglePlayerToInspect.bind(null, player)}
                  {...player}
                />
              );
            })}
          </>
        )}
        {playersToInspect.map(playerToInspect =>
          JSON.stringify(playerToInspect)
        )}
      </div>
    </>

    // <button onClick={() => router.push({ path: '/seeRaid', query: { id } })}>
    //   <div>{date}</div>
    //   <div>{name}</div>
    // </button>
  );
}
