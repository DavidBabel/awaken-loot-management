const jwt = require("jsonwebtoken");
const CONFIG = require("../config.js");
const { checkLogin } = require("../middleware/auth-helper/check-login");

/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 */
module.exports = async function loginRoute(req, res) {
  const account = await checkLogin(req.body.username, req.body.password);
  if (req.body && account) {
    console.log(account);
    const payload = {
      role: account.role,
      userid: account.id,
      username: account.name,
      discordId: account.discordId,
      classId: account.classId
    };
    res
      .json({
        ...payload,
        jwt: jwt.sign(payload, CONFIG.JWT_SECRET, {
          expiresIn: CONFIG.COOKIE_LIFE
        })
      })
      .send();
  } else {
    res.status(401).json({
      error: {
        message: "Wrong username or password!"
      }
    });
  }
};
