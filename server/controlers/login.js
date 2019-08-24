const jwt = require('jsonwebtoken');
const CONFIG = require('../config.js');

// TODO query my graphqlserver directly to gather login / mdp
/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 */
module.exports = function loginRoute(req, res) {
  console.log('login route');
  console.log(req.body);
  if (
    req.body &&
    req.body.username === 'admin' &&
    req.body.password === 'admin'
  ) {
    const payload = {
      id: 1,
      username: 'admin',
      role: 'admin'
    };
    res
      .json({
        ...payload,
        jwt: jwt.sign({ id: 1, role: 'admin' }, CONFIG.JWT_SECRET, {
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
