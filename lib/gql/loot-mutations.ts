import { gql } from "apollo-boost";

export const CREATE_LOOT = gql`
  mutation CreateLoot(
    $playerId: Int!
    $itemId: Int!
    $raidId: Int!
    $bossId: Int
    $lastActionBy: String
    $lastActionDate: String
  ) {
    createLoot(
      input: {
        loot: {
          playerId: $playerId
          itemId: $itemId
          raidId: $raidId
          bossId: $bossId
          lastActionBy: $lastActionBy
          lastActionDate: $lastActionDate
        }
      }
    ) {
      itemByItemId {
        id
        name
      }
      playerByPlayerId {
        id
        name
      }
    }
  }
`;

export const UPDATE_LOOT = gql`
  mutation updateLoot($id: Int!) {
    updateLootById(input: { id: $id, lootPatch: { active: false } }) {
      loot {
        id
        active
      }
    }
  }
`;
