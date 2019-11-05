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

export const UPDATE_RAID_TITLE = gql`
  mutation updateRaidTitle($raidId: Int!, $newTitle: String!) {
    updateRaidById(input: { raidPatch: { title: $newTitle }, id: $raidId }) {
      raid {
        title
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
