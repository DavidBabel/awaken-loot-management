const jwt = require('jsonwebtoken');
const CONFIG = require('../config.js');

/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 * @param {Function} next
 */
module.exports = function(req, res, next) {
  if (
    req.hasOwnProperty('headers') &&
    req.headers.hasOwnProperty('authorization')
  ) {
    try {
      req.user = jwt.verify(req.headers['authorization'], CONFIG.JWT_SECRET);
    } catch (err) {
      return res.status(401).json({
        error: {
          msg: 'Failed to authenticate token!'
        }
      });
    }
  } else {
    return res.status(401).json({
      error: {
        msg: 'No token!'
      }
    });
  }
  return next();
};
