import { gql } from "apollo-boost";

export const CREATE_LOOT = gql`
  mutation CreateLoot($playerId: Int!, $itemId: Int!, $raidId: Int!) {
    createLoot(
      input: { loot: { playerId: $playerId, itemId: $itemId, raidId: $raidId } }
    ) {
      itemByItemId {
        name
      }
      playerByPlayerId {
        name
      }
    }
  }
`;
