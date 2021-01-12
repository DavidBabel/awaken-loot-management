const CONFIG = require("../../config.js");
const Discord = require("discord.js");
const DiscordClient = new Discord.Client();
const GSheetReader = require("g-sheets-api");

DiscordClient.on("ready", () => {
  // tslint:disable-next-line:no-console
  console.log(`Discord Client Logged in as ${DiscordClient.user.tag}!`);
});

DiscordClient.on("message", message => {
  if (message.channel.id !== "796362734081802250") {
    return;
  }
  const [cmd, chan, sheet] = message.content.toLowerCase().split(" ");
  let channelId;
  let channelName;

  if (cmd === "check") {
    if (chan.startsWith("pr")) {
      channelName = "Préparation";
      channelId = "790299052159533058";
    } else if (chan.startsWith("pi")) {
      channelName = "Pickup";
      channelId = "634181864118026249";
    } else if (chan.startsWith("th")) {
      channelName = "Thrall";
      channelId = "635546865831772190";
    } else if (chan.startsWith("vo")) {
      channelName = "Voljin";
      channelId = "640632937884287027";
    } else if (chan.startsWith("sy")) {
      channelName = "Sylvanas";
      channelId = "613338516465778706";
    } else if (chan.startsWith("re")) {
      channelName = "Rexxar";
      channelId = "613338559012667422";
    } else if (chan.startsWith("ar")) {
      channelName = "Arthas";
      channelId = "634182030560722944";
    } else {
      console.log("Channel non trouvé pour la commande:", cmd);
      message.reply("Seuls les chans de raid sont listables");
      return;
    }
  }
  console.log("Selection du channel vocal: Raid -", channelName);
  const players = message.guild.channels
    .resolve(channelId)
    .members.map(member => member.nickname || member.user.username)
    .sort();

  // https://www.npmjs.com/package/g-sheets-api
  if (sheet) {
    const sheetId = sheet.split("/d/")[1].split("/")[0];
    GSheetReader(
      {
        sheetId,
        sheetNumber: 1,
        returnAllResults: true
      },
      results => {
        // do something with the results here
        console.log(results);
      },
      error => {
        // OPTIONAL: handle errors here
        console.log(error);
      }
    );
  }

  if (players.length > 0) {
    message.reply(
      " voici la liste des joueurs du chan vocal **Raid - " +
        channelName +
        "** \n\n" +
        players.join("\n")
    );
  } else {
    message.reply(
      " personne n'a été trouvé dans le chan vocal **Raid - " +
        channelName +
        "**"
    );
  }
});

DiscordClient.login(CONFIG.DISCORD_TOKEN);

module.exports = DiscordClient;

module.exports = {};
