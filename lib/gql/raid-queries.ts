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
          shortName
        }
        raidPlayersByRaidId {
          nodes {
            passed
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
                    classId
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
              classByClassId {
                color
                name
                id
              }
              lootsByPlayerId {
                nodes {
                  itemByItemId {
                    name
                  }
                  raidByRaidId {
                    date
                  }
                }
              }
              raidPlayersByPlayerId {
                nodes {
                  passed
                  raidByRaidId {
                    date
                    donjonByDonjonId {
                      name
                    }
                  }
                }
              }
            }
          }
        }
        lootsByRaidId {
          nodes {
            itemByItemId {
              name
              lootsByItemId {
                nodes {
                  playerByPlayerId {
                    name
                    classId
                    classByClassId {
                      color
                      name
                    }
                  }
                  itemByItemId {
                    name
                  }
                }
              }
            }
          }
        }
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
