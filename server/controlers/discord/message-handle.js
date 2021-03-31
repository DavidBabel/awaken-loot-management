const Discord = require("discord.js");
const GSheetReader = require("g-sheets-api");
const AttribGrids = require("./attrib-grid.js");

let lastSheetId;

/**
 * @param {Discord.Message} message
 */
function getContent(message) {
  const [cmdTmp, optTmp, sheetUrl] = message.content.split(" ");
  const cmd = cmdTmp.toLowerCase();
  const opt = optTmp.toLowerCase();
  let sheetId;
  if (sheetUrl) {
    sheetId = sheetUrl.split("/d/")[1].split("/")[0];
    if (sheetId) {
      lastSheetId = sheetId;
    }
  } else {
    sheetId = lastSheetId;
  }

  return [cmd, opt, sheetId];
}

/**
 * @param {Discord.Message} message
 */
function checkMemberInChan(message) {
  const [cmd, chan, sheetId] = getContent(message);
  let channelId;
  let channelName;

  const inGbid = message.channel.id === "821021499913535548";

  if (cmd === "check") {
    if (chan.startsWith("pr")) {
      channelName = "Préparation";
      channelId = inGbid ? "690966680272240744" : "790299052159533058";
    } else if (chan.startsWith("ra")) {
      channelName = "Raid Naxx";
      channelId = "691448259062792213";
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
    if (aile.startsWith("anu")) {
      bosses = [AttribGrids.spider[0]];
    } else if (aile.startsWith("fae")) {
      bosses = [AttribGrids.spider[1]];
    } else if (aile.startsWith("mae")) {
      bosses = [AttribGrids.spider[2]];
    } else if (
      aile.startsWith("pat") ||
      aile.startsWith("le re") ||
      aile.startsWith("rec")
    ) {
      bosses = [AttribGrids.abominations[0]];
    } else if (aile.startsWith("gro")) {
      bosses = [AttribGrids.abominations[1]];
    } else if (aile.startsWith("glu")) {
      bosses = [AttribGrids.abominations[2]];
    } else if (aile.startsWith("tad")) {
      bosses = [AttribGrids.abominations[3]];
    } else if (aile.startsWith("no")) {
      bosses = [AttribGrids.peste[0]];
    } else if (aile.startsWith("hei") || aile.startsWith("ei")) {
      bosses = [AttribGrids.peste[1]];
    } else if (
      aile.startsWith("hor") ||
      aile.startsWith("loa") ||
      aile.startsWith("lao")
    ) {
      bosses = [AttribGrids.peste[2]];
    } else if (aile.startsWith("ra")) {
      bosses = [AttribGrids.militaire[0]];
    } else if (aile.startsWith("go")) {
      bosses = [AttribGrids.militaire[1]];
    } else if (
      aile.startsWith("cav") ||
      aile.startsWith("qua") ||
      aile.startsWith("4")
    ) {
      bosses = [AttribGrids.militaire[2]];
    } else if (aile.startsWith("ar") || aile.startsWith("sp")) {
      bosses = AttribGrids.spider;
    } else if (aile.startsWith("pe")) {
      bosses = AttribGrids.peste;
    } else if (aile.startsWith("ab")) {
      bosses = AttribGrids.abominations;
    } else if (aile.startsWith("mi")) {
      bosses = AttribGrids.militaire;
    } else if (aile.startsWith("so") || aile.startsWith("sa")) {
      bosses = AttribGrids.saphiron;
    } else if (aile.startsWith("k")) {
      bosses = AttribGrids.kt;
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
  getAttribs,
  getContent
};
