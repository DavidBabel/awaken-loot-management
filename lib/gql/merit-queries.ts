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

export const ALL_MERITS = gql`
  query AllMerits {
    allMerits {
      edges {
        node {
          value
          name
          id
          comment
          categorie
          active
        }
      }
    }
  }
`;
