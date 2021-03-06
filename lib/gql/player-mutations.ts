import { gql } from "apollo-boost";

export const CREATE_PLAYER = gql`
  mutation CreatePlayer($classId: Int!, $name: String!) {
    createPlayer(input: { player: { classId: $classId, name: $name } }) {
      player {
        id
        name
        role
        active
      }
    }
  }
`;

export interface UpdatePlayerVariables {
  id: number;
  active?: boolean;
  inRoster?: boolean;
  classId?: number;
  name?: string;
  password?: string;
  role?: string;
  rerollOf?: string;
  mdcOf?: number;
  discordId?: string;
}

export const UPDATE_PLAYER = gql`
  mutation UpdatePlayer(
    $id: Int!
    $active: Boolean
    $inRoster: Boolean
    $classId: Int
    $name: String
    $password: String
    $role: String
    $rerollOf: String
    $mdcOf: Int
    $discordId: String
  ) {
    updatePlayerById(
      input: {
        id: $id
        playerPatch: {
          active: $active
          inRoster: $inRoster
          classId: $classId
          name: $name
          password: $password
          role: $role
          rerollOf: $rerollOf
          mdcOf: $mdcOf
          discordId: $discordId
        }
      }
    ) {
      player {
        id
        active
        name
        inRoster
        classId
        password
        role
        rerollOf
        mdcOf
        discordId
      }
    }
  }
`;

export const UPDATE_PLAYER_SPE = gql`
  mutation MyMutation($playerId: Int!, $speLink: String) {
    updatePlayerById(
      input: { playerPatch: { specialisation: $speLink }, id: $playerId }
    ) {
      player {
        id
      }
    }
  }
`;
