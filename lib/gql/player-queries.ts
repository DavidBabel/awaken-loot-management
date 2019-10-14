import { gql } from "apollo-boost";

export const ALL_PLAYERS = gql`
  query AllPlayers {
    allPlayers {
      nodes {
        classByClassId {
          color
          name
          id
        }
        id
        name
        active
        classId
        playerMeritsByPlayerId {
          nodes {
            validated
            date
            meritByMeritId {
              name
              value
              active
              categorie
              comment
            }
          }
        }
        lootsByPlayerId {
          nodes {
            active
            itemByItemId {
              wowheadId
              name
            }
            raidByRaidId {
              date
              id
            }
          }
        }
        raidPlayersByPlayerId {
          nodes {
            id
            raidId
            raidByRaidId {
              date
              donjonId
            }
          }
        }
      }
    }
  }
`;
export const ONE_PLAYER = gql`
  query getOnePlayer($playerId: Int) {
    allPlayers(condition: { id: $playerId }) {
      nodes {
        name
        classByClassId {
          color
          name
          id
        }
        playerMeritsByPlayerId {
          nodes {
            date
            meritByMeritId {
              name
              value
              active
              categorie
              comment
            }
            validated
          }
        }
        lootsByPlayerId {
          nodes {
            itemByItemId {
              wowheadId
              name
            }
            raidByRaidId {
              date
              id
            }
          }
        }
        raidPlayersByPlayerId {
          nodes {
            id
            raidId
            raidByRaidId {
              date
              donjonId
              donjonByDonjonId {
                id
                shortName
                name
              }
            }
          }
        }
      }
    }
  }
`;
