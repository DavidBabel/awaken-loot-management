import { gql } from "apollo-boost";

export const ADD_PLAYER_TO_RAID = gql`
  mutation CreateRaidPlayer($playerId: Int!, $raidId: Int!) {
    createRaidPlayer(
      input: { raidPlayer: { playerId: $playerId, raidId: $raidId } }
    ) {
      raidPlayer {
        playerId
      }
    }
  }
`;

export const UPDATE_RAIDPLAYER_STATUS = gql`
  mutation UpdateRaidPlayerStatus($raidPlayerId: Int!, $status: Int!) {
    updateRaidPlayerById(
      input: { id: $raidPlayerId, raidPlayerPatch: { status: $status } }
    ) {
      raidPlayer {
        playerId
        status
      }
    }
  }
`;
