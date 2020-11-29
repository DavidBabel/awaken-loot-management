import { gql } from "apollo-boost";

export const ALL_ITEMS = gql`
  query AllItems {
    allItems {
      nodes {
        id
        lootLevel
        name
        wowheadId
        classId
        lootsByItemId {
          nodes {
            id
            active
            playerByPlayerId {
              id
              active
              classId
              inRoster
              name
              classByClassId {
                id
                color
                name
              }
            }
          }
        }
        classItemsByItemId {
          nodes {
            id
            prio
            classByClassId {
              id
              name
            }
            comment
          }
        }
        classByClassId {
          name
          id
        }
        bossItemsByItemId {
          nodes {
            bossByBossId {
              name
            }
          }
        }
      }
    }
  }
`;
