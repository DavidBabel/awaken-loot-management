const CONFIG = require("../../server/config.js");
const Discord = require("discord.js");
const DiscordClient = new Discord.Client();

DiscordClient.on("ready", () => {
  console.log(`Logged in as ${DiscordClient.user.tag}!`);
});

DiscordClient.on("message", message => {
  if (message.channel.id !== "796362734081802250") {
    console.log("mauvais chan");
    return;
  }
  const cmd = message.content.toLowerCase();
  let channelId;
  let channelName;

  if (cmd.startsWith("check pr")) {
    channelName = "Préparation";
    channelId = "790299052159533058";
  } else if (cmd.startsWith("check pi")) {
    channelName = "Pickup";
    channelId = "634181864118026249";
  } else if (cmd.startsWith("check th")) {
    channelName = "Thrall";
    channelId = "635546865831772190";
  } else if (cmd.startsWith("check vol")) {
    channelName = "Voljin";
    channelId = "640632937884287027";
  } else if (cmd.startsWith("check syl")) {
    channelName = "Sylvanas";
    channelId = "613338516465778706";
  } else if (cmd.startsWith("check rex")) {
    channelName = "Rexxar";
    channelId = "613338559012667422";
  } else if (cmd.startsWith("check art")) {
    channelName = "Arthas";
    channelId = "634182030560722944";
  } else {
    console.log("Channel non trouvé pour la commande:", cmd);
    return;
  }
  console.log("Selection du channel vocal: Raid -", channelName);
  const players = message.guild.channels
    .resolve(channelId)
    .members.map(member => member.nickname || member.user.username)
    .sort();

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
