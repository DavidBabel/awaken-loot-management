// ts-check

const { gql } = require("apollo-boost");

const ADMIN = "admin";
const OFFICER = "officer";
const CLASS_MASTER = "classMaster";
const PLAYER = "player";
const GUEST = "guest";

const NO_ONE = [];
const OFFICER_MIN = [ADMIN, OFFICER];
const CLASSMASTER_MIN = [ADMIN, OFFICER, CLASS_MASTER];
const PLAYER_MIN = [ADMIN, OFFICER, CLASS_MASTER, PLAYER];

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
  allPlayerSlots: PLAYER_MIN,
  allPlayers: PLAYER_MIN,
  allRaidPlayers: PLAYER_MIN,
  allRaids: PLAYER_MIN,
  allSlots: PLAYER_MIN,
  createClassItem: OFFICER_MIN,
  createLoot: CLASSMASTER_MIN,
  createPlayerMerit: PLAYER_MIN,
  createPlayerSlot: CLASSMASTER_MIN,
  createRaid: OFFICER_MIN,
  createRaidPlayer: OFFICER_MIN,
  deletePlayerMerit: NO_ONE,
  deletePlayerMeritById: CLASSMASTER_MIN,
  deleteRaidPlayer: NO_ONE,
  deleteRaidPlayerById: OFFICER_MIN,
  updateClassItem: NO_ONE,
  updateClassItemById: OFFICER_MIN,
  updateLoot: NO_ONE,
  updateLootById: CLASSMASTER_MIN,
  updatePlayerMerit: NO_ONE,
  updatePlayerMeritById: PLAYER_MIN,
  updatePlayerSlot: NO_ONE,
  updatePlayerSlotById: PLAYER_MIN,
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
  // tslint:disable-next-line:no-console
  // console.log('parsedRequest :');
  // console.dir(parsedRequest, { depth: null, colors: true, showHidden: false });

  const queries = parsedRequest.definitions.map(q =>
    q.selectionSet.selections.map(x => x.name.value)
  );
  if (queries.length !== 1 || queries[0].length) {
    throw new Error("This API only accept one query at a time");
  }

  const gqlQuery = queries[0][0];
  if (!Object.keys(rights).includes(gqlQuery)) {
    throw new Error(`Unknow query ${gqlQuery}`);
  }

  return rights[gqlQuery].includes(playerLevel);
}

module.exports = {
  checkRights
  // getMutation,
  // isMutation,
  // isQuery,
  // isSchemaIntrospect
};
