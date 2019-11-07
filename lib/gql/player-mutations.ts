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
