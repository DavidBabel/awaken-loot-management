import { gql } from "apollo-boost";

export interface UserSubsVariables {
  playerId: number;
}

export const USER_SUBS = gql`
  query AllRaidPlayersSubs($playerId: Int) {
    allRaids(first: 12, orderBy: DATE_DESC, condition: { active: true }) {
      nodes {
        active
        date
        id
        raidPlayersSubsByRaidId(condition: { playerId: $playerId }) {
          nodes {
            id
            status
            playerByPlayerId {
              id
              active
              name
              inRoster
              discordId
              classByClassId {
                id
                playersByMdcOf {
                  nodes {
                    discordId
                    id
                  }
                }
              }
            }
          }
        }
        donjonByDonjonId {
          cdnImage
          name
        }
      }
    }
  }
`;

export interface OneRaidSubVariables {
  raidId: number;
}

export const ONE_RAID_SUB = gql`
  query OneRaidSub($raidId: Int!) {
    allPlayers(condition: { active: true }, orderBy: NAME_ASC) {
      nodes {
        id
        name
        inRoster
        discordId
        classByClassId {
          id
          name
          playersByMdcOf {
            nodes {
              discordId
            }
          }
        }
        raidPlayersSubsByPlayerId(condition: { raidId: $raidId }) {
          nodes {
            status
          }
        }
      }
    }
  }
`;

// export const ALL_USER_SUBS = gql`
//   query AllRaidPlayersSubs($playerId: Int) {
//     allRaids(first: 12, orderBy: DATE_DESC) {
//       nodes {
//         active
//         date
//         id
//         raidPlayersSubsByRaidId {
//           nodes {
//             id
//             status
//           }
//         }
//         donjonByDonjonId {
//           cdnIconImage
//           cdnImage
//           name
//           shortName
//         }
//       }
//     }
//   }
// `;
