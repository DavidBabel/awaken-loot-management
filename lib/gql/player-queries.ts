import { gql } from "apollo-boost";

export const ALL_CLASSES = gql`
  query MyQuery {
    allClasses {
      nodes {
        id
        color
        cdnImage
        name
      }
    }
  }
`;

export const ALL_ACTIVE_PLAYERS = gql`
  query AllActivePlayers {
    allPlayers(condition: { active: true }) {
      nodes {
        id
        name
        active
        inRoster
        classId
        rerollOf
        role
        password
        specialisation
        classByClassId {
          id
          color
          cdnImage
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
            raidId
            status
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

export const ALL_PLAYERS = gql`
  query AllPlayers {
    allPlayers {
      nodes {
        id
        name
        active
        inRoster
        classId
        rerollOf
        mdcOf
        discordId
        role
        password
        specialisation
        classByClassId {
          id
          color
          name
          cdnImage
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
            status
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

export interface OnePlayerQueryVariables {
  playerId?: number;
}

export const ONE_PLAYER = gql`
  query getOnePlayer($playerId: Int) {
    allPlayers(condition: { id: $playerId }) {
      nodes {
        id
        name
        specialisation
        active
        rerollOf
        discordId
        classByClassId {
          id
          color
          cdnImage
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
            status
            raidId
            raidByRaidId {
              id
              active
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

export const ONE_PLAYER_LIGHT = gql`
  query getOnePlayer($playerId: Int) {
    allPlayers(condition: { id: $playerId }) {
      nodes {
        id
        name
        specialisation
        active
        rerollOf
        discordId
        classByClassId {
          id
          color
          cdnImage
          name
          playersByMdcOf {
            nodes {
              id
              discordId
            }
          }
        }
      }
    }
  }
`;
