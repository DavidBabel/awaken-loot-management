import { gql } from "apollo-boost";

export const CREATE_PLAYER = gql`
  mutation CreatePlayer($classId: Int!, $name: String!, $role: String!) {
    createPlayer(
      input: { player: { classId: $classId, name: $name, role: $role } }
    ) {
      player {
        id
        name
        role
        active
      }
    }
  }
`;

export const UPDATE_PLAYER = gql`
  mutation UpdatePlayer(
    $id: Int!
    $active: Boolean
    $inRoster: Boolean
    $name: String
    $password: String
    $role: String
  ) {
    updatePlayerById(
      input: {
        id: $id
        playerPatch: {
          active: $active
          inRoster: $inRoster
          name: $name
          password: $password
          role: $role
        }
      }
    ) {
      player {
        id
        active
        name
        inRoster
        password
        role
      }
    }
  }
`;
