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
          id
          name
          shortName
          active
          bossesByDonjonId {
            nodes {
              id
              name
              bossItemsByBossId {
                nodes {
                  id
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
          id
          name
          shortName
        }
        raidPlayersByRaidId {
          nodes {
            id
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
        id
        date
        donjonByDonjonId {
          name
          shortName
          bossesByDonjonId {
            nodes {
              id
              name
              donjonId
              bossItemsByBossId {
                nodes {
                  id
                  itemByItemId {
                    id
                    wowheadId
                    name
                    classId
                    classItemsByItemId {
                      nodes {
                        id
                        itemId
                        prio
                        classByClassId {
                          id
                          color
                          name
                        }
                      }
                    }
                    classByClassId {
                      id
                      name
                    }
                  }
                }
              }
            }
          }
        }
        raidPlayersByRaidId {
          nodes {
            id
            playerByPlayerId {
              id
              name
              classId
              classByClassId {
                id
                color
                name
              }
              lootsByPlayerId {
                nodes {
                  id
                  itemByItemId {
                    id
                    name
                  }
                  raidByRaidId {
                    id
                    date
                  }
                }
              }
              raidPlayersByPlayerId {
                nodes {
                  id
                  passed
                  raidByRaidId {
                    id
                    date
                    donjonByDonjonId {
                      id
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
            id
            active
            bossId
            lastActionBy
            lastActionDate
            itemByItemId {
              id
              name
              classId
              lootLevel
              wowheadId
              bossItemsByItemId {
                nodes {
                  id
                  bossByBossId {
                    id
                  }
                }
              }
              lootsByItemId {
                nodes {
                  id
                  playerByPlayerId {
                    id
                    name
                    classId
                    classByClassId {
                      id
                      color
                      name
                    }
                  }
                  itemByItemId {
                    id
                    name
                  }
                }
              }
            }
            raidByRaidId {
              id
              date
            }
            playerByPlayerId {
              id
              name
              classId
              classByClassId {
                id
                color
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
