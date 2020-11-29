import { gql } from "apollo-boost";

export interface CreateLootVariables {
  playerId: number;
  itemId: number;
  raidId: number;
  bossId: number;
  lastActionBy: string;
  lastActionDate: string;
  lastActionType: string;
}

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
          lastActionType: "add"
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

export interface UpdateLootVariables {
  id: number;
  active: boolean;
  lastActionBy: string;
  lastActionDate: string;
  actionType: string;
}

export const UPDATE_LOOT = gql`
  mutation updateLoot(
    $id: Int!
    $active: Boolean!
    $lastActionBy: String!
    $lastActionDate: String!
    $actionType: String!
  ) {
    updateLootById(
      input: {
        id: $id
        lootPatch: {
          active: $active
          lastActionBy: $lastActionBy
          lastActionDate: $lastActionDate
          lastActionType: $actionType
        }
      }
    ) {
      loot {
        id
        active
        lastActionBy
        lastActionDate
        lastActionType
      }
    }
  }
`;
