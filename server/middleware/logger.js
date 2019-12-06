const winston = require("winston");
const { gql } = require("apollo-boost");

const logger = winston.createLogger({
  defaultMeta: { service: "user-service" },
  format: winston.format.simple(),
  level: "info",
  transports: [
    // //
    // // - Write to all logs with level `info` and below to `combined.log`
    // // - Write all logs error (and below) to `error.log`.
    // //
    // new winston.transports.File({ filename: "error.log", level: "error" }),
    new winston.transports.File({ filename: "requests.log" })
  ]
});

// TODO

/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 * @param {Function} next
 */
module.exports = function(req, res, next) {
  // const playerLevel = req.user.role;
  const gqlRequest = req.body.query;

  // const parsedRequest = gql(gqlRequest);

  if (req.body) {
    if (!req.body.query) {
      return next();
    }

    if (req.user && checkRights(req.user.role, req.body.query)) {
      return next();
    }
  }
  return res.status(403).json({
    error: {
      msg: "UNAUTHORIZED: you are not allowed to perform this action"
    }
  });
};
