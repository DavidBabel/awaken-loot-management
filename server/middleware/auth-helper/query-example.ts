export default {
  BROKEN_QUERY: `
  anyName {
    allDonjons {
    }
  }`,
  QUERY_BOSSITEMS: `
  query anyName {
    allBossItems {
    }
  }`,
  QUERY_BOSSES: `
  query anyName {
    allBosses {
    }
  }`,
  QUERY_CLASSITEMS: `
  query anyName {
    allClassItems {
    }
  }`,
  QUERY_CLASSES: `
  query anyName {
    allClasses {
    }
  }`,
  QUERY_DONJONS: `
  query anyName {
    allDonjons {
    }
  }`,
  QUERY_ITEMS: `
  query anyName {
    allItems {
    }
  }`,
  QUERY_LOOTS: `
  query anyName {
    allLoots {
    }
  }`,
  QUERY_MERITS: `
  query anyName {
    allMerits {
    }
  }`,
  QUERY_PLAYERMERITS: `
  query anyName {
    allPlayerMerits {
    }
  }`,
  QUERY_PLAYERSLOTS: `
  query anyName {
    allPlayerSlots {
    }
  }`,
  QUERY_PLAYERS: `
  query anyName {
    allPlayers {
    }
  }`,
  QUERY_RAIDPLAYERS: `
  query anyName {
    allRaidPlayers {
    }
  }`,
  QUERY_RAIDS: `
  query anyName {
    allRaids {
    }
  }`,
  QUERY_SLOTS: `
  query anyName {
    allSlots {
    }
  }`,
  BROKEN_MUTATION: `
  anyName {
    createBoss(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_BOSS: `
  mutation anyName {
    createBoss(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_BOSSITEM: `
  mutation anyName {
    createBossItem(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_CLASS: `
  mutation anyName {
    createClass(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_CLASSITEM: `
  mutation anyName {
    createClassItem(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_DONJON: `
  mutation anyName {
    createDonjon(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_ITEM: `
  mutation anyName {
    createItem(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_LOOT: `
  mutation anyName {
    createLoot(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_MERIT: `
  mutation anyName {
    createMerit(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_PLAYER: `
  mutation anyName {
    createPlayer(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_PLAYERMERIT: `
  mutation anyName {
    createPlayerMerit(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_PLAYERSLOT: `
  mutation anyName {
    createPlayerSlot(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_RAID: `
  mutation anyName {
    createRaid(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_RAIDPLAYER: `
  mutation anyName {
    createRaidPlayer(input: {query}) {
      clientMutationId
    }
  }`,
  MUTATION_SLOT: `
  mutation anyName {
    createSlot(input: {query}) {
      clientMutationId
    }
  }
  `,
  QUERY_MUTATION: `
  query anyName {
    allBosses {
    }
  }
  mutation anyName {
    createSlot(input: {query}) {
      clientMutationId
    }
  }
  `,
  MULTIPLE_MUTATION: `
  mutation anyName {
    createRaidPlayer(input: {query}) {
      clientMutationId
    }
  }
  mutation anyName {
    createSlot(input: {query}) {
      clientMutationId
    }
  }
  `,
  MULTIPLE_SAME_MUTATION: `
  mutation anyName {
    createSlot(input: {query}) {
      clientMutationId
    }
  }
  mutation anyName {
    createSlot(input: {query}) {
      clientMutationId
    }
  }
  `,
  INTROSPECTION_QUERY: `
  query IntrospectionQuery {
    anyquery() {
      clientMutationId
    }
  }
  `
};
