import { gql } from "apollo-boost";

export const ADD_PLAYER_TO_RAID = gql`
  mutation CreateRaidPlayer($playerId: Int!, $raidId: Int!, $status: Int) {
    createRaidPlayer(
      input: {
        raidPlayer: { playerId: $playerId, raidId: $raidId, status: $status }
      }
    ) {
      raidPlayer {
        playerId
        raidId
        status
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

// export const RESET_RAIDPLAYER_STATUS = gql`
//   mutation UpdateRaidPlayerStatus($raidPlayerId: Int!) {
//     updateRaidPlayerById(
//       input: { id: $raidPlayerId, raidPlayerPatch: { status: -1 } }
//     ) {
//       raidPlayer {
//         playerId
//         status
//       }
//     }
//   }
// `;
