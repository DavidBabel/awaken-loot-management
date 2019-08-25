const availableQueries = [
  'allBossItems',
  'allBosses',
  'allClassItems',
  'allClasses',
  'allDonjons',
  'allItems',
  'allLoots',
  'allMerites',
  'allPlayerMerites',
  'allPlayerSlots',
  'allPlayers',
  'allRaidPlayers',
  'allRaids',
  'allSlots'
];
const availableMutations = [
  'createBoss',
  'createBossItem',
  'createClass',
  'createClassItem',
  'createDonjon',
  'createItem',
  'createLoot',
  'createMerite',
  'createPlayer',
  'createPlayerMerite',
  'createPlayerSlot',
  'createRaid',
  'createRaidPlayer',
  'createSlot'
];

const rights = {
  admin: {
    queries: true,
    mutations: true
  },
  officer: {
    queries: true,
    mutations: {
      createBoss: false,
      createBossItem: false,
      createClass: false,
      createClassItem: true,
      createDonjon: false,
      createItem: false,
      createLoot: true,
      createMerite: false,
      createPlayer: false,
      createPlayerMerite: true,
      createPlayerSlot: true,
      createRaid: true,
      createRaidPlayer: true,
      createSlot: false
    }
  },
  classMaster: {
    queries: true,
    mutations: {
      createBoss: false,
      createBossItem: false,
      createClass: false,
      createClassItem: false,
      createDonjon: false,
      createItem: false,
      createLoot: true,
      createMerite: false,
      createPlayer: false,
      createPlayerMerite: true,
      createPlayerSlot: true,
      createRaid: false,
      createRaidPlayer: false,
      createSlot: false
    }
  },
  player: {
    queries: true,
    mutations: false
  },
  guest: {
    queries: false,
    mutations: false
  }
};

/**
 *
 * @param {string} query
 * @param {boolean} securityCheck disable check on mutation
 */
function isQuery(query, securityCheck = true) {
  let isQuery = false;
  if (isSchemaIntrospect(query)) {
    return true;
  }
  availableQueries.forEach(availableQuery => {
    isQuery = isQuery || query.includes(availableQuery);
  });
  const isOk = securityCheck ? !isMutation(query, false) : true;
  return isQuery && query.includes('query ') && isOk;
}

/**
 *
 * @param {string} query
 * @param {boolean} securityCheck disable check on query
 */
function isMutation(query, securityCheck = true) {
  let isMutation = false;
  availableMutations.forEach(availableMutation => {
    isMutation = isMutation || query.includes(availableMutation);
  });
  const isOk = securityCheck ? !isQuery(query, false) : true;
  return isMutation && query.includes('mutation ') && isOk;
}

/**
 *
 * @param {string} query
 */
function getMutation(query) {
  let mutations = [];
  isMutation(query) &&
    availableMutations.forEach(availableMutation => {
      if (query.includes(availableMutation + '(')) {
        const toMatch = new RegExp(`(${availableMutation}\())`, 'gm');
        const count = (query.match(toMatch) || []).length;
        for (let i = 0; i < count; i++) {
          mutations.push(availableMutation);
        }
      }
    });
  return mutations;
}

/**
 *
 * @param {string} query
 */
function isSchemaIntrospect(query) {
  return query.includes('query IntrospectionQuery ');
}

/**
 *
 * @param {'admin'|'officer'|'classMaster'|'player'|'guest'} playerLevel
 * @param {string} request
 */
function checkRights(playerLevel = 'guest', request) {
  const { queries: queriesUserRights, mutations: mutationsUserRights } = rights[
    playerLevel
  ];

  if (!queriesUserRights && !mutationsUserRights) {
    // console.log('no rights for this user');
    return false;
  }
  if (isQuery(request) && isMutation(request)) {
    console.log('should never happend');
    return false;
  }
  if (isQuery(request) && !queriesUserRights) {
    // console.log('missing rights to query this');
    return false;
  }
  if (isQuery(request)) {
    return true;
  }
  if (isMutation(request) && !mutationsUserRights) {
    // console.log('missing rights to mutate this');
    return false;
  }
  const mutationsFound = getMutation(request);
  if (mutationsFound.length !== 1) {
    // console.log('multiple mutations found');
    return false;
  }
  const currentUserRight =
    mutationsUserRights === true || mutationsUserRights[mutationsFound[0]];
  if (isMutation(request) && currentUserRight) {
    return true;
  }
  // console.log(`Not a single right match found for query ${request}`);
  return false;
}

module.exports = {
  checkRights,
  getMutation,
  isMutation,
  isQuery,
  isSchemaIntrospect
};
