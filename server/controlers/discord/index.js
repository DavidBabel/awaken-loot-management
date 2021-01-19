const DiscordClient = require("./client");
/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 */
module.exports = async function discordRoute(req, res) {
  if (DiscordClient && DiscordClient.users) {
    DiscordClient.users
      .fetch(req.body.discordId)
      .then(user => {
        user.send(req.body.message);
        res.json({ result: "ok" }).send();
      })
      .catch(e => {
        // tslint:disable-next-line:no-console
        console.log("unable to send message to ", req.body.discordId, e);
        res.json({ result: "error" }).send();
      });
  } else {
    console.log(DiscordClient.users);
    res.json({ result: "no users" }).send();
  }
};
