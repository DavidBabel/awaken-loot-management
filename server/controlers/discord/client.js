const CONFIG = require("../../config.js");
const Discord = require("discord.js");
const {
  checkMemberInChan,
  getAttribs,
  getContent,
  isBot,
  handleRenaming
} = require("./message-handle");
const DiscordClient = new Discord.Client();

DiscordClient.on("ready", () => {
  // tslint:disable-next-line:no-console
  console.log(`Discord Client Logged in as ${DiscordClient.user.tag}!`);
});

DiscordClient.on("message", message => {
  try {
    if (!isBot(message)) {
      if (
        message.channel.id === "821021499913535548" // gbid
      ) {
        const [cmd] = getContent(message);
        if (cmd === "attrib") {
          getAttribs(message);
        } else if (cmd === "check") {
          checkMemberInChan(message);
        }
      }
      if (message.channel.id === "826659258149240832") {
        handleRenaming(message);
      }

      if (
        message.channel.id === "796362734081802250" // awaken
      ) {
        checkMemberInChan(message);
      } else if (
        message.channel.id === "811769354097917952" // awaken
      ) {
        getAttribs(message);
      }
    }
  } catch (e) {
    message.reply("Putain t'as tout pété, contacte Devilhunter");
    console.log(e);
  }
});

function tryToLogin() {
  return DiscordClient.login(CONFIG.DISCORD_TOKEN);
}

DiscordClient.on("error", tryToLogin);

tryToLogin();

// module.exports = DiscordClient;
module.exports = {};
