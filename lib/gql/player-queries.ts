import { gql } from "apollo-boost";

export const ALL_CLASSES = gql`
  query MyQuery {
    allClasses {
      nodes {
        color
        id
        name
      }
    }
  }
`;

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
        inRoster
        classId
        playerMeritsByPlayerId {
          nodes {
            validated
            date
            meritByMeritId {
              id
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
              id
              wowheadId
              name
              lootLevel
            }
            raidByRaidId {
              date
              id
            }
          }
        }
        raidPlayersByPlayerId {
          nodes {
            passed
            id
            raidId
            raidByRaidId {
              id
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
            passed
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
