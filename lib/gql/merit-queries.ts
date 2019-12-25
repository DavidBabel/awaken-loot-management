import { gql } from "apollo-boost";

export const PLAYER_MERIT = gql`
  query OnePlayerMerit($playerId: Int) {
    allMerits {
      nodes {
        id
        name
        value
        comment
        categorie
        order
        delay
        active
        classByClassId {
          name
        }
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
          id
          value
          name
          comment
          categorie
          order
          delay
          active
          classByClassId {
            name
          }
        }
      }
    }
  }
`;
