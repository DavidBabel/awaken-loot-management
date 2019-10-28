import { gql } from "apollo-boost";

export const ALL_ITEMS = gql`
  query AllItems {
    allItems {
      nodes {
        id
        lootLevel
        name
        wowheadId
        lootsByItemId {
          nodes {
            active
            id
            playerByPlayerId {
              active
              id
              classId
              classByClassId {
                color
              }
              inRoster
              name
            }
          }
        }
      }
    }
  }
`;
