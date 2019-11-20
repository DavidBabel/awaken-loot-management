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
          cdnImage
          bossesByDonjonId(orderBy: ORDER_ASC) {
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
          cdnImage
          bossesByDonjonId(orderBy: ORDER_ASC) {
            nodes {
              id
              name
              cdnImage
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
        id
        date
        title
        linkBetweenRaids
        donjonByDonjonId {
          id
          name
          shortName
        }
        raidPlayersByRaidId {
          totalCount
          nodes {
            id
            passed
            playerByPlayerId {
              id
              name
              classId
            }
          }
        }
        lootsByRaidId(condition: { active: true }) {
          totalCount
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
        title
        donjonByDonjonId {
          id
          name
          shortName
          bossesByDonjonId(orderBy: ORDER_ASC) {
            nodes {
              id
              name
              cdnImage
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
                      color
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
            lastActionType
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
