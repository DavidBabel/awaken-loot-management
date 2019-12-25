import { gql } from "apollo-boost";

export const UPDATE_PLAYER_MERIT = gql`
  mutation UpdatePlayerMerit(
    $id: Int!
    $date: String
    $meritId: Int!
    $playerId: Int!
    $validated: Boolean
  ) {
    updatePlayerMeritById(
      input: {
        playerMeritPatch: {
          date: $date
          meritId: $meritId
          playerId: $playerId
          validated: $validated
        }
        id: $id
      }
    ) {
      playerMerit {
        id
        validated
      }
    }
  }
`;

export const CREATE_PLAYER_MERIT = gql`
  mutation CreatePlayerMerit(
    $date: String
    $meritId: Int!
    $playerId: Int!
    $validated: Boolean
  ) {
    createPlayerMerit(
      input: {
        playerMerit: {
          date: $date
          meritId: $meritId
          playerId: $playerId
          validated: $validated
        }
      }
    ) {
      playerMerit {
        id
        validated
      }
    }
  }
`;

export const DELETE_PLAYER_MERIT = gql`
  mutation DeletePlayerMerit($id: Int!) {
    deletePlayerMeritById(input: { id: $id }) {
      playerMerit {
        validated
      }
    }
  }
`;
