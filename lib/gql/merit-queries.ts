import { gql } from "apollo-boost";

export const PLAYER_MERIT = gql`
  query OnePlayerMerit($playerId: Int) {
    allMerits {
      nodes {
        name
        comment
        categorie
        id
        active
        playerMeritsByMeritId(condition: { playerId: $playerId }) {
          nodes {
            id
            validated
            date
            playerId
          }
        }
      }
    }
  }
`;
