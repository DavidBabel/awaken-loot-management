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
          cdnIconImage
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
          cdnIconImage
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

export const ALL_RAIDS_LIGHT = gql`
  query AllRaids {
    allRaids(orderBy: DATE_DESC, condition: { active: true }, first: 25) {
      nodes {
        id
        date
        title
        linkBetweenRaids
        donjonByDonjonId {
          id
          name
          shortName
          cdnIconImage
        }
        raidPlayersByRaidId {
          totalCount
        }
        lootsByRaidId(condition: { active: true }) {
          totalCount
        }
        softResasByRaidId {
          totalCount
        }
      }
    }
  }
`;

export const ALL_RAIDS = gql`
  query AllRaids {
    allRaids(orderBy: DATE_DESC, condition: { active: true }, first: 25) {
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
            status
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
                  itemId
                  itemByItemId {
                    id
                    wowheadId
                    name
                    classItemsByItemId {
                      nodes {
                        id
                        itemId
                        classByClassId {
                          id
                          color
                          cdnImage
                          name
                        }
                        comment
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
            id
            status
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
                name
                color
              }
            }
          }
        }
        softResasByRaidId {
          nodes {
            id
            playerByPlayerId {
              name
              id
            }
            itemByItemId {
              name
              id
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
