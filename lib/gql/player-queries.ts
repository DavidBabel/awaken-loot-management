import { gql } from "apollo-boost";

export const ALL_CLASSES = gql`
  query MyQuery {
    allClasses {
      nodes {
        id
        color
        name
      }
    }
  }
`;

export const ALL_PLAYERS = gql`
  query AllPlayers {
    allPlayers {
      nodes {
        id
        name
        active
        inRoster
        classId
        role
        password
        classByClassId {
          id
          color
          name
        }
        playerMeritsByPlayerId {
          nodes {
            id
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
            id
            active
            itemByItemId {
              id
              wowheadId
              name
              lootLevel
            }
            raidByRaidId {
              id
              date
            }
          }
        }
        raidPlayersByPlayerId {
          nodes {
            id
            passed
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
        id
        name
        active
        classByClassId {
          id
          color
          name
        }
        playerMeritsByPlayerId {
          nodes {
            id
            date
            validated
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
            id
            active
            itemByItemId {
              id
              wowheadId
              name
            }
            raidByRaidId {
              id
              date
            }
          }
        }
        raidPlayersByPlayerId {
          nodes {
            id
            passed
            raidId
            raidByRaidId {
              id
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
