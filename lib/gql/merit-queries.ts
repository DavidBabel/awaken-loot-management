import { gql } from "apollo-boost";

export interface PlayerMeritVariables {
  playerId: number;
}

export const PLAYER_MERIT = gql`
  query OnePlayerMerit($playerId: Int) {
    allMerits(condition: { active: true }) {
      nodes {
        id
        name
        value
        comment
        categorie
        order
        delay
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
    allMerits(condition: { active: true }) {
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
        }
      }
    }
  }
`;
