import { gql } from "apollo-boost";

export const CREATE_RAID = gql`
  mutation CreateRaid($date: String, $donjonId: Int!, $title: String) {
    createRaid(
      input: { raid: { date: $date, donjonId: $donjonId, title: $title } }
    ) {
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

export interface UpdateRaidActiveVariables {
  raidId: number;
  active: boolean;
}

export const UPDATE_RAID_ACTIVE = gql`
  mutation updateRaidActive($raidId: Int!, $active: Boolean!) {
    updateRaidById(input: { raidPatch: { active: $active }, id: $raidId }) {
      raid {
        active
      }
    }
  }
`;

export interface UpdateRaidLinkVariables {
  raidId: number;
  linkId: string;
}

export const UPDATE_RAID_LINK = gql`
  mutation UpdateRaidLink($raidId: Int!, $linkId: String!) {
    updateRaidById(
      input: { raidPatch: { linkBetweenRaids: $linkId }, id: $raidId }
    ) {
      raid {
        id
        linkBetweenRaids
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
