// ts-check

const { gql } = require("apollo-boost");
const {
  playerItselfOnly,
  playerCanOnlyCreateDisabledMerit,
  playerCanOnlyEditSpecialisation
} = require("./query-rules");
const { ADMIN, CLASS_MASTER, GUEST, OFFICER, PLAYER } = require("./roles");

// const NO_ONE = [];
const ADMIN_MIN = [ADMIN];
const OFFICER_MIN = [ADMIN, OFFICER];
const CLASSMASTER_MIN = [ADMIN, OFFICER, CLASS_MASTER];
const PLAYER_MIN = [ADMIN, OFFICER, CLASS_MASTER, PLAYER];

// TODO : check if we have right for EVERY mutation in base on service launch

const rights = {
  allBossItems: PLAYER_MIN,
  allBosses: PLAYER_MIN,
  allClassItems: PLAYER_MIN,
  allClasses: PLAYER_MIN,
  allDonjons: PLAYER_MIN,
  allItems: PLAYER_MIN,
  allLoots: PLAYER_MIN,
  allMerits: PLAYER_MIN,
  allPlayerMerits: PLAYER_MIN,
  allPlayers: PLAYER_MIN,
  allRaidPlayers: PLAYER_MIN,
  allRaids: PLAYER_MIN,
  createClassItem: ADMIN_MIN,
  createLoot: CLASSMASTER_MIN,
  createPlayer: OFFICER_MIN,
  createPlayerMerit: PLAYER_MIN,
  createRaid: OFFICER_MIN,
  createRaidPlayer: CLASSMASTER_MIN,
  createSoftResa: OFFICER_MIN,
  // deletePlayerMerit: NO_ONE,
  deletePlayerMeritById: PLAYER_MIN,
  // deleteRaidPlayer: NO_ONE,
  // deleteRaidPlayerById: NO_ONE,
  deleteSoftResaById: ADMIN_MIN,
  // updateClassItem: NO_ONE,
  updateClassItemById: OFFICER_MIN,
  // updateLoot: NO_ONE,
  updateLootById: OFFICER_MIN,
  // updatePlayer: NO_ONE,
  updatePlayerById: PLAYER_MIN,
  // updatePlayerMerit: NO_ONE,
  updatePlayerMeritById: CLASSMASTER_MIN,
  // updateRaid: NO_ONE,
  updateRaidById: OFFICER_MIN,
  // updateRaidPlayer: NO_ONE,
  updateRaidPlayerById: CLASSMASTER_MIN
};

const constraints = {
  createPlayerMerit: [playerItselfOnly, playerCanOnlyCreateDisabledMerit],
  updatePlayerById: [playerItselfOnly, playerCanOnlyEditSpecialisation]
};

/**
 *
 * @param {'admin'|'officer'|'classMaster'|'player'|'guest'} playerLevel
 * @param {{query: string, variables: Object}} requestBody
 */
function checkRights(user, requestBody) {
  const { username, role = GUEST } = user;
  const { query: gqlQuery, variables } = requestBody;
  const parsedRequest = gql(gqlQuery);

  const queries = parsedRequest.definitions.map(q =>
    q.selectionSet.selections.map(x => x.name.value)
  );
  if (queries.length !== 1) {
    throw new Error("Awaken: This API only accept one query at a time");
  }

  queries[0].forEach(query => {
    if (!Object.keys(rights).includes(query)) {
      throw new Error(`Awaken: Unknow query ${query}`);
    }
    if (!rights[query].includes(role)) {
      throw new Error(`Awaken: role ${role} not allowed to perform ${query}`);
    }
    if (constraints[query]) {
      constraints[query].forEach(isValidQuery => {
        if (!isValidQuery(user, parsedRequest, variables)) {
          throw new Error(
            `Awaken: role ${role} or player ${username} is not allowed to perform ${query}`
          );
        }
      });
    }
  });

  return true;
}

module.exports = {
  checkRights
};
