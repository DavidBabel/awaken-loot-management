import { gql } from "apollo-boost";

export const CREATE_RAID = gql`
  mutation CreateRaid($date: String, $donjonId: Int!) {
    createRaid(input: { raid: { date: $date, donjonId: $donjonId } }) {
      raid {
        id
      }
    }
  }
`;
