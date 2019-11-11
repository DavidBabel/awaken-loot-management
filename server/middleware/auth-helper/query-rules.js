const { gql } = require("apollo-boost");

/**
 *
 * @param {{username: string, playerLevel: string}} user
 * @param {any} parsedRequest // TODO tru to type this
 */
function playerItself(user = {}, parsedRequest) {
  const { username, playerLevel = GUEST } = user;

  console.log("username :");
  console.log(username);

  console.log("parsedRequest :");
  console.dir(parsedRequest, { depth: null, colors: true, showHidden: false });

  return true;
}

module.exports = {
  playerItself
};
