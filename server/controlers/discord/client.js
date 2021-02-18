const CONFIG = require("../../config.js");
const Discord = require("discord.js");
const { checkMemberInChan, getAttribs } = require("./message-handle");
const DiscordClient = new Discord.Client();

DiscordClient.on("ready", () => {
  // tslint:disable-next-line:no-console
  console.log(`Discord Client Logged in as ${DiscordClient.user.tag}!`);
});

DiscordClient.on("message", message => {
  try {
    // BOT ID
    if (message.member.id !== "787447821766885416") {
      if (message.channel.id === "796362734081802250") {
        checkMemberInChan(message);
      } else if (message.channel.id === "811769354097917952") {
        getAttribs(message);
      }
    }
  } catch (e) {
    message.reply("something bad happened", e);
  }
});

function tryToLogin() {
  return DiscordClient.login(CONFIG.DISCORD_TOKEN);
}

DiscordClient.on("error", tryToLogin);

tryToLogin();

module.exports = DiscordClient;
