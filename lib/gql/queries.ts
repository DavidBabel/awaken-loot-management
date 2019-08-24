import { gql } from 'apollo-boost';

export const ALL_DONJONS = gql`
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

export const ALL_RAIDS = gql`
  query AllRaids {
    allRaids {
      nodes {
        date
        id
        donjonByDonjonId {
          name
        }
      }
    }
  }
`;
