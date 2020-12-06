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
        lootsByItemId {
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
