import { useMutation } from "@apollo/react-hooks";
import { useContext } from "react";
import { SubscribeStatus } from "../../components/subscribe/subscribe-status";
import MemberContext from "../../lib/context/member";
import { sendDiscordMessage } from "../../lib/discord";
import { Mutation, Player } from "../../lib/generatedTypes";
import {
  CREATE_RAID_PLAYER_SUB,
  CreateSubsVariables,
  UPDATE_RAID_PLAYER_SUB,
  UpdateSubsVariables
} from "../../lib/gql/subs-mutations";
import { Raid } from "../generatedTypes";

export interface RaidPlayerSub {
  raidPLayerSubId?: number;
  status: SubscribeStatus;
  raid: Raid;
  player: Player;
}

export function useChangeRaidPlayerSub() {
  const member = useContext(MemberContext);

  const [updateRaidPlayerSub] = useMutation<Mutation, UpdateSubsVariables>(
    UPDATE_RAID_PLAYER_SUB
  );
  const [createRaidPlayerSub] = useMutation<Mutation, CreateSubsVariables>(
    CREATE_RAID_PLAYER_SUB
  );

  function setRaidPlayerSub(
    { raidPLayerSubId, status, raid, player }: RaidPlayerSub,
    discordMessageMember?: (
      raid: Raid,
      playerName: string,
      status: SubscribeStatus
    ) => string,
    discordMessageMDC?: (
      raid: Raid,
      playerName: string,
      status: SubscribeStatus
    ) => string
  ) {
    function afterUpdate() {
      const promises: Array<Promise<any>> = [];
      if (discordMessageMember) {
        promises.push(
          sendDiscordMessage(
            player.discordId,
            discordMessageMember(raid, player.name, status),
            member.token
          )
        );
      }
      if (
        player?.classByClassId?.playersByMdcOf?.nodes[0]?.discordId !==
        player.discordId
      ) {
        if (discordMessageMDC) {
          promises.push(
            sendDiscordMessage(
              player?.classByClassId?.playersByMdcOf?.nodes[0]?.discordId,
              discordMessageMDC(raid, player.name, status),
              member.token
            )
          );
        }
      }
      return Promise.all(promises);
    }
    if (raidPLayerSubId) {
      console.log("try to update");
      return updateRaidPlayerSub({
        variables: {
          raidPLayerSubId,
          status
        }
      })
        .then(afterUpdate)
        .catch(e => {
          // tslint:disable-next-line:no-console
          console.log(e);
        });
    } else {
      console.log("try to create");
      return createRaidPlayerSub({
        variables: { playerId: player.id, status, raidId: raid.id }
      })
        .then(afterUpdate)
        .catch(e => {
          // tslint:disable-next-line:no-console
          console.log(e);
        });
    }
  }
  return [setRaidPlayerSub];
}
