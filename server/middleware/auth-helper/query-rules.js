const { ADMIN, CLASS_MASTER, GUEST, OFFICER, PLAYER } = require("./roles");

/**
 * @param {string} role
 */
function isMoreThanPlayer(role) {
  return role === ADMIN || role === OFFICER || role === CLASS_MASTER;
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

module.exports = {
  playerCanOnlyCreateDisabledMerit,
  playerItselfOnly
};
