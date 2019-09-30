import { gql } from "apollo-boost";

export const ALL_PLAYERS = gql`
  query AllPlayers {
    allPlayers {
      nodes {
        classByClassId {
          color
          name
        }
        name
        playerMeritsByPlayerId {
          nodes {
            date
            meritByMeritId {
              name
              value
              active
            }
          }
        }
        lootsByPlayerId {
          nodes {
            itemByItemId {
              name
              lootsByItemId {
                nodes {
                  raidByRaidId {
                    date
                  }
                }
              }
            }
            active
          }
          totalCount
        }
      }
    }
  }
`;
