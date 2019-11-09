const { checkRights } = require("./auth-helper/authorizations");

/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 * @param {Function} next
 */
module.exports = function(req, res, next) {
  if (req.body) {
    if (!req.body.query) {
      return next();
    }

    if (req.user && checkRights(req.user, req.body.query)) {
      return next();
    }
  }
  return res.status(403).json({
    error: {
      msg: "UNAUTHORIZED: you are not allowed to perform this action"
    }
  });
};
