import { gql } from "apollo-boost";

export interface CreateSoftResaVariables {
  itemId: number;
  playerId: number;
  raidId: number;
}

export const CREATE_SOFTRESA = gql`
  mutation createSoftResa($itemId: Int!, $playerId: Int!, $raidId: Int!) {
    createSoftResa(
      input: {
        softResa: { itemId: $itemId, playerId: $playerId, raidId: $raidId }
      }
    ) {
      softResa {
        id
      }
    }
  }
`;

export interface DeleteSoftResaVariables {
  id: number;
}

export const DELETE_SOFTRESA = gql`
  mutation deleteSoftResa($id: Int!) {
    deleteSoftResaById(input: { id: $id }) {
      raidByRaidId {
        id
      }
    }
  }
`;
