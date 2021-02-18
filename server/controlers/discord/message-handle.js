const Discord = require("discord.js");
const GSheetReader = require("g-sheets-api");
const AttribGrids = require("./attrib-grid.js");

/**
 * @param {Discord.Message} message
 */
function getContent(message) {
  const [cmdTmp, optTmp, sheetUrl] = message.content.split(" ");
  const cmd = cmdTmp.toLowerCase();
  const opt = optTmp.toLowerCase();
  const sheetId = sheetUrl.split("/d/")[1].split("/")[0];

  return [cmd, opt, sheetId];
}

/**
 * @param {Discord.Message} message
 */
function checkMemberInChan(message) {
  const [cmd, chan, sheetId] = getContent(message);
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
      // console.log("Channel non trouvé pour la commande:", cmd);
      message.reply("Seuls les chans de raid sont listables");
      return;
    }
  } else {
    // console.log("commande inconnue", cmd);
    return;
  }
  // console.log("Selection du channel vocal: Raid -", channelName);

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
  if (sheetId) {
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
            if (players[j].toLowerCase().includes(compoPlayer.toLowerCase())) {
              found = true;
              break;
            }
          }
          if (!found) {
            missing.push(compoPlayer);
          }
        }

        message.reply(
          " voici la liste des joueurs manquants sur le chan vocal **Raid - " +
            channelName +
            "** \n\n" +
            missing.join("\n")
        );
      },
      error => {
        // OPTIONAL: handle errors here
        message.reply(error);
      }
    );
  }
}

/**
 * @param {Discord.Message} message
 */
function getAttribs(message) {
  const [cmd, aile, sheetId] = getContent(message);
  let bosses;

  if (cmd === "attrib") {
    if (aile.startsWith("tr")) {
      bosses = AttribGrids.trashs;
    } else if (aile.startsWith("ar") || aile.startsWith("sp")) {
      bosses = AttribGrids.spider;
    } else if (aile.startsWith("pe")) {
      bosses = AttribGrids.peste;
    } else if (aile.startsWith("ab")) {
      bosses = AttribGrids.abominations;
    } else if (aile.startsWith("mi")) {
      bosses = AttribGrids.militaire;
    } else if (
      aile.startsWith("so") ||
      aile.startsWith("sa") ||
      aile.startsWith("k")
    ) {
      bosses = AttribGrids.sommet;
    } else {
      // console.log("Channel non trouvé pour la commande:", cmd);
      message.reply("Aile non trouvée");
      return;
    }
  } else {
    // console.log("commande inconnue", cmd);
    return;
  }
  // https://www.npmjs.com/package/g-sheets-api
  if (sheetId) {
    GSheetReader(
      {
        sheetId,
        sheetNumber: 4,
        returnAllResults: true
      },
      results => {
        const attribs = results.filter(line => bosses.includes(line.boss));
        let numero = 1;
        let messageToSend = `
        `;
        attribs.forEach(attrib => {
          messageToSend += `\n**${attrib.boss}**:  *${
            attrib.type
          }* (${numero++})\n${attrib.attribs.replace(/\n/g, "\n > ").trim()}
          `;
        });
        message.reply(messageToSend);
      },
      error => {
        // OPTIONAL: handle errors here
        message.reply(error);
      }
    );
  }
}

module.exports = {
  checkMemberInChan,
  getAttribs
};
