const jwt = require('jsonwebtoken');
const CONFIG = require('../config.js');
const { checkLogin } = require('../middleware/auth-helper/check-login');

// TODO query my graphqlserver directly to gather login / mdp
/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 */
module.exports = function loginRoute(req, res) {
  const account = checkLogin(req.body.username, req.body.password);
  if (req.body && account) {
    const payload = {
      username: account.username,
      role: account.role
    };
    res
      .json({
        ...payload,
        jwt: jwt.sign({ role: account.role }, CONFIG.JWT_SECRET, {
          expiresIn: CONFIG.COOKIE_LIFE
        })
      })
      .send();
  } else {
    res.status(401).json({
      error: {
        message: 'Wrong username or password!'
      }
    });
  }
};
