import { gql } from "apollo-boost";

export const ALL_BOSSES = gql`
  query AllBosses {
    allBosses {
      nodes {
        name
      }
    }
  }
`;
