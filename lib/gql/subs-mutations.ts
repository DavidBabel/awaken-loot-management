import { gql } from "apollo-boost";

export interface CreateSubsVariables {
  playerId: number;
  raidId: number;
  status: number;
}

export const CREATE_RAID_PLAYER_SUB = gql`
  mutation CreateRaidPlayersSub($playerId: Int!, $raidId: Int!, $status: Int!) {
    createRaidPlayersSub(
      input: {
        raidPlayersSub: {
          playerId: $playerId
          raidId: $raidId
          status: $status
        }
      }
    ) {
      clientMutationId
    }
  }
`;

export interface UpdateSubsVariables {
  raidPLayerSubId: number;
  status: number;
}

export const UPDATE_RAID_PLAYER_SUB = gql`
  mutation UpdateRaidPlayersSub($raidPLayerSubId: Int!, $status: Int!) {
    updateRaidPlayersSubById(
      input: { raidPlayersSubPatch: { status: $status }, id: $raidPLayerSubId }
    ) {
      clientMutationId
    }
  }
`;
