import { gql } from 'apollo-boost';

export const CREATE_RAID = gql`
  query AllDonjons {
    allDonjons {
      edges {
        node {
          name
          shortName
          active
          bossesByDonjonId {
            nodes {
              name
              bossItemsByBossId {
                nodes {
                  itemId
                }
              }
            }
          }
        }
      }
    }
  }
`;
