import { gql } from "apollo-boost";

export const ALL_ITEMS = gql`
  query AllItems {
    allItems {
      nodes {
        id
        lootLevel
        name
        wowheadId
        classItemsByItemId {
          nodes {
            id
            classByClassId {
              id
              name
            }
            comment
          }
        }
        bossItemsByItemId {
          nodes {
            bossByBossId {
              name
            }
          }
        }
        lootsByItemId(condition: { active: true }) {
          totalCount
        }
      }
    }
  }
`;

export interface ItemLootVariables {
  itemId: number;
}

export const ITEM_LOOT = gql`
  query ItemLoot($itemId: Int) {
    allLoots(condition: { itemId: $itemId, active: true }) {
      nodes {
        id
        playerByPlayerId {
          id
          name
          active
          classByClassId {
            name
          }
        }
        raidByRaidId {
          date
        }
      }
    }
  }
`;
