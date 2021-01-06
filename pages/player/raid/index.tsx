import { useQuery } from "@apollo/react-hooks";
import { Grid } from "@material-ui/core";
import React, { useContext } from "react";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { SubscribeCard } from "../../../components/subscribe/SubscribeCard";
import MemberContext from "../../../lib/context/member";
import { Query } from "../../../lib/generatedTypes";
import {
  ONE_PLAYER_LIGHT,
  OnePlayerQueryVariables
} from "../../../lib/gql/player-queries";
import { USER_SUBS, UserSubsVariables } from "../../../lib/gql/subs-queries";
import { useChangeRaidPlayerSub } from "../../../lib/hooks/raid-player-sub";

export default function PlayerRaidPage() {
  const member = useContext(MemberContext);

  const { loading, data, error, refetch } = useQuery<Query, UserSubsVariables>(
    USER_SUBS,
    { variables: { playerId: member.userid } }
  );
  const {
    loading: loadingPlayer,
    data: dataPlayer,
    error: errorPlayer
  } = useQuery<Query, OnePlayerQueryVariables>(ONE_PLAYER_LIGHT, {
    variables: { playerId: member.userid }
  });
  const [setRaidPlayerSub] = useChangeRaidPlayerSub();

  function refetchRaids() {
    return refetch({ playerId: member.userid });
  }

  if (loading || loadingPlayer || error || errorPlayer) {
    return (
      <LoadingAndError
        loading={loading || loadingPlayer}
        error={error || errorPlayer}
      />
    );
  }

  // if (loading || error) {
  //   return <LoadingAndError loading={loading} error={error} />;
  // }

  const raids = data.allRaids.nodes.filter(r => r.active);
  const player = dataPlayer.allPlayers.nodes[0];
  // console.log(player);

  return (
    <Grid container spacing={3}>
      {raids.map(raid => (
        <Grid item xs={12} key={`my-raid-${raid.id}`}>
          <SubscribeCard
            {...raid}
            // player={{} as Player}
            player={player}
            setRaidPlayerSub={setRaidPlayerSub}
            refetchRaids={refetchRaids}
          />
        </Grid>
      ))}
    </Grid>
  );
}
