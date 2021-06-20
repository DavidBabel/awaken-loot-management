import { gql } from "apollo-boost";

export const SCORE_LOOT = gql`
  query ScoreLoot {
    allPlayers(condition: { active: true }) {
      nodes {
        name
        id
        inRoster
        lootsByPlayerId(last: 5, condition: { active: true }) {
          nodes {
            itemByItemId {
              lootLevel
              id
              doesNotCount
            }
            raidByRaidId {
              date
            }
          }
        }
        softResasByPlayerId(last: 20) {
          nodes {
            itemId
          }
        }
        raidPlayersByPlayerId(last: 10) {
          nodes {
            status
            raidId
            raidByRaidId {
              date
            }
          }
        }
      }
    }
  }
`;
