const accounts = require('./accounts.json');

/**
 *
 * @param {string} user
 * @param {string} password hashed
 */
function checkLogin(username, password) {
  for (let i = 0; i < accounts.length; i++) {
    const account = accounts[i];
    if (account.username === username && account.password === password) {
      return account;
    }
  }
  return false;
}

// function addUser() {

// }

module.exports = {
  checkLogin
};
