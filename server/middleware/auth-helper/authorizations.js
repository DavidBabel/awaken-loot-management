// ts-check

const { gql } = require("apollo-boost");

const ADMIN = "admin";
const OFFICER = "officer";
const CLASS_MASTER = "classMaster";
const PLAYER = "player";
const GUEST = "guest";

const NO_ONE = [];
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
  createPlayerMerit: PLAYER_MIN,
  createRaid: OFFICER_MIN,
  createRaidPlayer: CLASSMASTER_MIN,
  createPlayer: OFFICER_MIN,
  deletePlayerMerit: NO_ONE,
  deletePlayerMeritById: CLASSMASTER_MIN,
  deleteRaidPlayer: NO_ONE,
  deleteRaidPlayerById: NO_ONE,
  updateClassItem: NO_ONE,
  updateClassItemById: OFFICER_MIN,
  updateLoot: NO_ONE,
  updateLootById: CLASSMASTER_MIN,
  updatePlayer: NO_ONE,
  updatePlayerById: ADMIN_MIN,
  updatePlayerMerit: NO_ONE,
  updatePlayerMeritById: PLAYER_MIN,
  updateRaid: NO_ONE,
  updateRaidById: OFFICER_MIN,
  updateRaidPlayer: NO_ONE,
  updateRaidPlayerById: OFFICER_MIN
};

/**
 *
 * @param {'admin'|'officer'|'classMaster'|'player'|'guest'} playerLevel
 * @param {string} request
 */
function checkRights(playerLevel = GUEST, request) {
  const parsedRequest = gql(request);

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
    if (!rights[query].includes(playerLevel)) {
      throw new Error(
        `Awaken: role ${playerLevel} not allowed to perform ${query}`
      );
    }
  });

  return true;
}

module.exports = {
  checkRights
};
