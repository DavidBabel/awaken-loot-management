const { ADMIN, CLASS_MASTER, GUEST, OFFICER, PLAYER } = require("./roles");

/**
 * @param {string} role
 */
function isMoreThanPlayer(role) {
  return role === ADMIN || role === OFFICER || role === CLASS_MASTER;
}
function isAdmin(role) {
  return role === ADMIN;
}

/**
 * @param {{username: string, role: string, userid: number}} user
 * @param {any} parsedRequest
 * @param {Object} variables
 */
function playerItselfOnly(user = {}, parsedRequest, variables) {
  const { userid, username, role = GUEST } = user;

  if (isMoreThanPlayer(role)) {
    return true;
  }

  if (
    role !== GUEST &&
    variables &&
    variables.playerId &&
    variables.playerId === userid
  ) {
    return true;
  }

  throw new Error(`Awaken: player ${username} can only edit himself`);
}

/**
 * @param {{username: string, role: string, userid: number}} user
 * @param {any} parsedRequest
 * @param {Object} variables
 */
function playerCanOnlyCreateDisabledMerit(user = {}, parsedRequest, variables) {
  const { userid, username, role = GUEST } = user;

  if (isMoreThanPlayer(role)) {
    return true;
  }

  if (
    role !== GUEST &&
    variables &&
    variables.validated &&
    variables.validated === false
  ) {
    return true;
  }

  throw new Error(`Awaken: player ${username} can only create disabled merits`);
}

/**
 * @param {{username: string, role: string, userid: number}} user
 * @param {any} parsedRequest
 * @param {Object} variables
 */
function playerCanOnlyEditSpecialisation(user = {}, parsedRequest, variables) {
  const { userid, username, role = GUEST } = user;

  if (isAdmin(role)) {
    return true;
  }

  const variableNames = Object.keys(variables);

  if (
    role !== GUEST &&
    variables &&
    variableNames &&
    variableNames.length === 2 &&
    variableNames.includes("playerId") &&
    variableNames.includes("speLink")
  ) {
    return true;
  }

  throw new Error(
    `Awaken: player ${username} cannot update anything else than specialisation`
  );
}

module.exports = {
  playerCanOnlyCreateDisabledMerit,
  playerCanOnlyEditSpecialisation,
  playerItselfOnly
};
