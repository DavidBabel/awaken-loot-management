import { gql } from "apollo-boost";

export const ALL_DONJONS = gql`
  query AllDonjons {
    allDonjons {
      edges {
        node {
          id
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

export const ONE_DONJON = gql`
  query OneDonjon($donjonId: Int) {
    allDonjons(condition: { id: $donjonId }) {
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
    allRaids(orderBy: DATE_DESC) {
      nodes {
        date
        id
        donjonByDonjonId {
          name
        }
        raidPlayersByRaidId {
          nodes {
            playerByPlayerId {
              name
              id
              classId
            }
          }
        }
      }
    }
  }
`;

export const ONE_RAID = gql`
  query GetOneRaid($raidId: Int) {
    allRaids(condition: { id: $raidId }) {
      nodes {
        date
        donjonByDonjonId {
          name
          shortName
          bossesByDonjonId {
            nodes {
              name
              id
              donjonId
              bossItemsByBossId {
                nodes {
                  itemByItemId {
                    wowheadId
                    name
                    id
                    classItemsByItemId {
                      nodes {
                        itemValueForThisClass
                        itemId
                        classByClassId {
                          color
                          name
                          id
                        }
                        id
                      }
                    }
                    lootsByItemId(orderBy: RAID_ID_DESC) {
                      nodes {
                        id
                        itemId
                        playerByPlayerId {
                          name
                          classByClassId {
                            name
                            color
                            id
                          }
                        }
                        raidByRaidId {
                          date
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        raidPlayersByRaidId {
          nodes {
            playerByPlayerId {
              name
              classId
              id
            }
          }
        }
      }
    }
  }
`;

export const CREATE_RAID = gql`
  mutation CreateRaid($date: String, $donjonId: Int) {
    createRaid(input: { raid: { date: $date, donjonId: $donjonId } }) {
      raid {
        id
      }
    }
  }
`;

// export const ITEM_LOOT_HISTORY = gql`
//   query GetItemLootHistory($itemId: Int) {
//     allLoots(condition: { itemId: $itemId }) {
//       nodes {
//         itemId
//         playerByPlayerId {
//           name
//           classByClassId {
//             name
//             color
//             id
//           }
//         }
//         raidByRaidId {
//           date
//         }
//       }
//     }
//   }
// `;
