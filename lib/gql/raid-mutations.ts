import { gql } from "apollo-boost";

export const CREATE_RAID = gql`
  mutation CreateRaid($date: String, $donjonId: Int!) {
    createRaid(input: { raid: { date: $date, donjonId: $donjonId } }) {
      raid {
        id
      }
    }
  }
`;

// export const CREATE_RAID = gql`
//   mutation CreateRaid($date: String, $donjonId: Int!) {
//     createRaid(input: { raid: { date: $date, donjonId: $donjonId } }) {
//       raid {
//         id
//       }
//     }
//   }
// `;

// mutation MyMutation($raidId: Int!, $playerId: Int!) {
//   createRaidPlayer(input: {raidPlayer: {playerId: $playerId, raidId: $raidId}})
// }
