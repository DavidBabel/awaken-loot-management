const CONFIG = require("../../server/config.js");
const Discord = require("discord.js");
const DiscordClient = new Discord.Client();
const GSheetReader = require("g-sheets-api");

DiscordClient.on("ready", () => {
  console.log(`Logged in as ${DiscordClient.user.tag}!`);
});

DiscordClient.on("message", message => {
  try {
    if (message.channel.id !== "796362734081802250") {
      return;
    }
    const [cmdTmp, chanTmp, sheet] = message.content.split(" ");
    const cmd = cmdTmp.toLowerCase();
    const chan = chanTmp.toLowerCase();
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
    } else {
      console.log("commande inconnue", cmd);
      return;
    }
    console.log("Selection du channel vocal: Raid -", channelName);

    const players = message.guild.channels
      .resolve(channelId)
      .members.map(member => member.nickname || member.user.username)
      .sort();

    if (players.length <= 0) {
      message.reply(
        " personne n'a été trouvé dans le chan vocal **Raid - " +
          channelName +
          "**"
      );
      return;
    }

    // https://www.npmjs.com/package/g-sheets-api
    if (sheet) {
      const sheetId = sheet.split("/d/")[1].split("/")[0];
      console.log("sheetid", sheetId);
      GSheetReader(
        {
          sheetId,
          sheetNumber: 1,
          returnAllResults: true
        },
        results => {
          const compoPlayers = Object.keys(results[0]);

          const missing = [];
          for (let i = 0; i < compoPlayers.length; i++) {
            const compoPlayer = compoPlayers[i];
            let found = false;
            for (let j = 0; j < players.length; j++) {
              if (
                players[j].toLowerCase().includes(compoPlayer.toLowerCase())
              ) {
                found = true;
                break;
              }
            }
            if (!found) {
              missing.push(compoPlayer);
            }
          }
          // console.log(compoPlayers);
          // console.log(players);

          message.reply(
            " voici la liste des joueurs manquants sur le chan vocal **Raid - " +
              channelName +
              "** \n\n" +
              missing.join("\n")
          );
        },
        error => {
          // OPTIONAL: handle errors here
          console.log(error);
        }
      );
    }
  } catch (e) {
    console.log("something bad happened", e);
  }
});

DiscordClient.login(CONFIG.DISCORD_TOKEN);
