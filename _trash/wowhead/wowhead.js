if (typeof WH === "undefined") {
  var g_staticUrl = "https://wow.zamimg.com";
  var WH = {
    data: {},
    entities: {},
    wowheadRemote: true
  };
}
WH.isTouch = function() {
  if (!WH.wowheadRemote && typeof Platform !== "undefined") {
    WH.isTouch = function() {
      return Platform.isTouch();
    };
  } else {
    var b = navigator.userAgent || navigator.vendor || window.opera;
    var a = {
      isMobile: false,
      isTablet: false
    };
    if (
      /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(
        b
      ) ||
      /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(
        b.substr(0, 4)
      )
    ) {
      a.isMobile = true;
    }
    if (!a.isMobile && /(android|ipad|playbook|silk)/i.test(b)) {
      a.isTablet = true;
    }
    WH.isTouch = function(c) {
      return c.isMobile || c.isTablet;
    }.bind(null, a);
    WH.isMobile = function(c) {
      return c;
    }.bind(null, a.isMobile);
    WH.isTablet = function(c) {
      return c;
    }.bind(null, a.isTablet);
  }
  return WH.isTouch();
};
if (typeof $WowheadPower === "undefined") {
  var $WowheadPower = new (function() {
    var ad = {
      1: {
        name: "NPC",
        path: "npc",
        data: {},
        maxId: 500000
      },
      2: {
        name: "Object",
        path: "object",
        data: {},
        maxId: 750000
      },
      3: {
        name: "Item",
        path: "item",
        data: {},
        maxId: 500000
      },
      4: {
        name: "Item Set",
        path: "item-set",
        data: {},
        maxId: 10000,
        minId: -5000
      },
      5: {
        name: "Quest",
        path: "quest",
        data: {},
        maxId: 100000
      },
      6: {
        name: "Spell",
        path: "spell",
        data: {},
        maxId: 500000
      },
      7: {
        name: "Zone",
        path: "zone",
        data: {},
        maxId: 50000
      },
      10: {
        name: "Achievement",
        path: "achievement",
        data: {},
        maxId: 50000
      },
      12: {
        name: "Holiday",
        path: "event",
        data: {},
        maxId: 10000
      },
      17: {
        name: "Currency",
        path: "currency",
        data: {},
        maxId: 10000
      },
      20: {
        name: "Building",
        path: "building",
        data: {},
        maxId: 1000
      },
      21: {
        name: "Follower",
        path: "follower",
        data: {},
        maxId: 10000
      },
      22: {
        name: "Mission Ability",
        path: "mission-ability",
        data: {},
        maxId: 10000
      },
      23: {
        name: "Mission",
        path: "mission",
        data: {},
        maxId: 10000
      },
      25: {
        name: "Ship",
        path: "ship",
        data: {},
        maxId: 10000
      },
      26: {
        name: "Threat",
        path: "threat",
        data: {},
        maxId: 1000
      },
      27: {
        name: "Resource",
        path: "resource",
        data: {},
        maxId: 100,
        minId: 0
      },
      28: {
        name: "Champion",
        path: "champion",
        data: {},
        maxId: 10000
      },
      30: {
        name: "Order Advancement",
        path: "order-advancement",
        data: {},
        maxId: 5000
      },
      38: {
        name: "BFA Champion",
        path: "bfa-champion",
        data: {},
        maxId: 10000
      },
      40: {
        name: "Affix",
        path: "affix",
        data: {},
        maxId: 1000
      },
      42: {
        name: "Azerite Essence Power",
        path: "azerite-essence-power",
        data: {},
        maxId: 1000
      },
      43: {
        name: "Azerite Essence",
        path: "azerite-essence",
        data: {},
        maxId: 100
      },
      100: {
        name: "Guide",
        path: "guide",
        data: {}
      },
      101: {
        name: "Transmog Set",
        path: "transmog-set",
        data: {},
        maxId: 50000
      },
      110: {
        name: "Outfit",
        path: "outfit",
        data: {}
      },
      200: {
        name: "Pet Ability",
        path: "pet-ability",
        data: {},
        maxId: 10000
      }
    };
    var P = WH.wowheadRemote;
    var B = false;
    var aB = {
        applyto: 3
      },
      M = document.getElementsByTagName("head")[0],
      aP,
      aG = {
        attach: 3,
        attachToIcon: 1,
        attachWithoutScreenshot: 4,
        float: 0,
        floatWithoutIcon: 5,
        screen: 2
      },
      A = 550,
      aW = {
        colorLinks: "colorlinks",
        iconizeLinks: "iconizelinks",
        renameLinks: "renamelinks"
      },
      al,
      F,
      U,
      ay,
      p,
      aq,
      aw,
      av,
      ap = aG["float"],
      H = false,
      af = null,
      G = 1,
      E = 1,
      aK = -1,
      o = 0,
      e = 1,
      O = 0,
      ag = 1,
      aF = 2,
      g = 3,
      an = 4,
      y = 5,
      ae = 1,
      V = 2,
      x = 3,
      l = 4,
      aI = 5,
      ai = 6,
      Y = 7,
      Z = 10,
      m = 12,
      X = 13,
      k = 17,
      aH = 20,
      ac = 21,
      D = 22,
      aJ = 23,
      t = 25,
      aj = 26,
      q = 27,
      N = 28,
      aV = 30,
      aR = 38,
      d = 40,
      aO = 42,
      T = 43,
      n = 100,
      aN = 101,
      b = 110,
      at = 200,
      aA = [Z, T, aO, x, ai],
      f = 15,
      C = 15,
      a = {
        0: {
          achievementComplete: "Achievement earned by $1 on $2/$3/$4",
          loading: "Loadingâ€¦",
          noResponse: "No response from server :(",
          notFound: "%s Not Found"
        },
        1: {
          achievementComplete: "$1ì´(ê°€) $2/$3/$4ì— ì—…ì ì„ ë‹¬ì„±í•¨",
          loading: "ë¡œë”© ì¤‘â€¦",
          noResponse: "ì„œë²„ê°€ ì‘ë‹µí•˜ì§€ ì•ŠìŠµë‹ˆë‹¤ :(",
          notFound: "%s ì„(ë¥¼) ì°¾ì„ ìˆ˜ ì—†ìŒ"
        },
        2: {
          achievementComplete: "Haut-fait reÃ§u par $1 le $2/$3/$4",
          loading: "Chargementâ€¦",
          noResponse: "Pas de rÃ©ponse du serveur :(",
          notFound: "%s non trouvÃ©"
        },
        3: {
          achievementComplete: "Erfolg wurde von $1 am $3.$2.$4 errungen",
          loading: "LÃ¤dtâ€¦",
          noResponse: "Keine Antwort vom Server :(",
          notFound: "%s nicht gefunden"
        },
        4: {
          achievementComplete: "$1åœ¨$2/$3/$4ä¸ŠèŽ·å¾—æˆå°±",
          loading: "æ­£åœ¨è½½å…¥â€¦",
          noResponse: "æœåŠ¡å™¨æ²¡æœ‰å“åº” :(",
          notFound: "%sæœªæ‰¾åˆ°"
        },
        6: {
          achievementComplete: "Logro conseguido por $1 el $2/$3/$4",
          loading: "Cargandoâ€¦",
          noResponse: "No hay respuesta del servidor :(",
          notFound: "%s no encontrado/a"
        },
        7: {
          achievementComplete:
            "$1 Ð¿Ð¾Ð»ÑƒÑ‡Ð¸Ð»(Ð°) ÑÑ‚Ð¾ Ð´Ð¾ÑÑ‚Ð¸Ð¶ÐµÐ½Ð¸Ðµ $2/$3/$4",
          loading: "Ð—Ð°Ð³Ñ€ÑƒÐ·ÐºÐ°â€¦",
          noResponse: "ÐÐµÑ‚ Ð¾Ñ‚Ð²ÐµÑ‚Ð° Ð¾Ñ‚ ÑÐµÑ€Ð²ÐµÑ€Ð° :(",
          notFound: "%s Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾"
        },
        8: {
          achievementComplete: "Conquista conseguida por $1 em $3/$2/$4",
          loading: "Carregandoâ€¦",
          noResponse: "Sem resposta do servidor :(",
          notFound: "%s nÃ£o encontrado(a)"
        },
        9: {
          achievementComplete: "Impresa compiuta da $1 su $2/$3/$4",
          loading: "Caricamentoâ€¦",
          noResponse: "Nessuna risposta dal server :(",
          notFound: "%s Non Trovato"
        }
      },
      v = [n];
    var ab = new (function() {
      var a1 = {};
      var a0 = {};
      var aZ = {};
      var aY = {};
      this.fetch = function(a5, a7) {
        if (!aY.hasOwnProperty(a5) || aY[a5].hasOwnProperty(a7)) {
          return;
        }
        aY[a5][a7] = ag;
        a1[a5][a7] = [];
        var a6 = WH.dataEnvTerm[a7];
        switch (a7) {
          case WH.dataEnv.BETA:
            a6 = WH.BETA_DOMAIN || a6;
            break;
          case WH.dataEnv.MAIN:
            a6 = "www";
            break;
        }
        var a4 = ak(a6) + a0[a5];
        a4 += typeof g_wow_build !== "undefined" ? "&" + g_wow_build : "";
        a4 += "&json";
        WH.xhrJsonRequest(
          a4,
          function(a8, ba, a9) {
            if (!a9) {
              WH.error(
                "Wowhead tooltips failed to load scaling data for " + ax(a8)
              );
              return;
            }
            ab.setData(a8, ba, a9);
          }.bind(null, a5, a7)
        );
      };
      this.getSpellsBySpec = function(a4, a5) {
        var a6 = U || WH.getDataEnv();
        this.registerCallback(X, a6, function() {
          var a8 = aZ[X][a6];
          var a7 = [];
          if (a8.specMap.hasOwnProperty(a4)) {
            a7 = a8["class"][a8.specMap[a4]].concat(a8.spec[a4] || []);
          }
          a5(a7);
        });
      };
      this.isLoaded = function(a4, a5) {
        if (!aY.hasOwnProperty(a4)) {
          return true;
        }
        if (aY[a4][a5] === an) {
          a2();
          return true;
        }
        return false;
      };
      this.registerCallback = function(a4, a6, a5) {
        if (this.isLoaded(a4, a6)) {
          window.requestAnimationFrame(a5);
          return;
        }
        if (!a1[a4].hasOwnProperty(a6)) {
          this.fetch(a4, a6);
        }
        a1[a4][a6].push(a5);
      };
      this.setData = function(a5, a7, a6) {
        aY[a5][a7] = an;
        a1[a5][a7] = a1[a5][a7] || [];
        aZ[a5][a7] = a6;
        a2();
        var a4 = a1[a5][a7];
        while (a4.length) {
          a4.shift()();
        }
      };

      function a3() {
        a0[x] = "/data/item-scaling";
        a0[ai] = "/data/spell-scaling";
        a0[X] = "/data/spec-spells";
        for (var a4 in a0) {
          if (!a0.hasOwnProperty(a4)) {
            continue;
          }
          aY[a4] = {};
          a1[a4] = {};
          aZ[a4] = {};
        }
      }

      function a2() {
        var a5 = U || WH.getDataEnv();
        var a4;
        if ((a4 = aZ[x][a5])) {
          WH.staminaFactor = a4.staminaByIlvl;
          WH.convertRatingToPercent.RB = a4.combatRatingsBase;
          WH.convertRatingToPercent.LH = a4.ratingsToPercentLH;
          WH.convertRatingToPercent.RM = a4.ratingsToPercentRM;
          WH.convertRatingToPercent.LT = a4.ratingsToPercentLT;
          WH.convertScalingFactor.SV = a4.itemScalingValue;
          WH.convertScalingFactor.SD = a4.scalingFactors;
          WH.curvePoints = a4.curvePoints;
          WH.applyStatModifications.ScalingData = a4.scalingData;
          WH.data.artifactKnowledgeMultiplier = a4.artifactKnowledgeMultiplier;
        }
        if ((a4 = aZ[ai][a5])) {
          WH.convertScalingSpell.SV = a4.scalingValue;
          WH.convertScalingSpell.SpellInformation = a4.spellInformation;
          WH.convertScalingSpell.RandPropPoints = a4.randPropPoints;
        }
      }
      a3();
    })();
    this.setScales = ab.setData;
    var s = {
      0: "enus",
      1: "kokr",
      2: "frfr",
      3: "dede",
      4: "zhcn",
      6: "eses",
      7: "ruru",
      8: "ptbr",
      9: "itit"
    };
    var aa = {
      getId: function() {
        return 0;
      },
      getName: function() {
        return "enus";
      }
    };
    if (typeof aQ === "undefined") {
      var aQ = {
        tooltip_genericrating:
          '<span class="q2">Equip: Increases your $1 by <!--rtg$2-->$3&nbsp;<small>(<!--rtg%$2-->0&nbsp;@&nbsp;L<!--lvl-->0)</small>.</span><br />',
        tooltip_reforged: "Reforged ($1 $2 &rarr; $1 $3)",
        traits: {
          agi: ["Agility", "Agi", "Agi"],
          arcres: ["Arcane resistance", "Arcane Resist", "ArcR"],
          arcsplpwr: ["Arcane spell power", "Arcane Power", "ArcP"],
          armor: ["Armor", "Armor", "Armor"],
          armorbonus: ["Additional armor", "Bonus Armor", "AddAr"],
          armorpenrtng: ["Armor penetration rating", "Armor Pen", "Pen"],
          atkpwr: ["Attack power", "AP", "AP"],
          block: ["Block value", "Block Value", "BkVal"],
          blockrtng: ["Block rating", "Block", "Block"],
          critstrkrtng: ["Critical strike rating", "Crit", "Crit"],
          defrtng: ["Defense rating", "Defense", "Def"],
          dmg: ["Weapon damage", "Damage", "Dmg"],
          dmgmax1: ["Maximum damage", "Max Damage", "Max"],
          dmgmin1: ["Minimum damage", "Min Damage", "Min"],
          dodgertng: ["Dodge rating", "Dodge", "Dodge"],
          dps: ["Damage per second", "DPS", "DPS"],
          exprtng: ["Expertise rating", "Expertise", "Exp"],
          firres: ["Fire resistance", "Fire Resist", "FirR"],
          firsplpwr: ["Fire spell power", "Fire Power", "FireP"],
          frores: ["Frost resistance", "Frost Resist", "FroR"],
          frosplpwr: ["Frost spell power", "Frost Power", "FroP"],
          hastertng: ["Haste rating", "Haste", "Haste"],
          health: ["Health", "Health", "Hlth"],
          healthrgn: ["Health regeneration", "HP5", "HP5"],
          hitrtng: ["Hit rating", "Hit", "Hit"],
          holres: ["Holy resistance", "Holy Resist", "HolR"],
          holsplpwr: ["Holy spell power", "Holy Power", "HolP"],
          int: ["Intellect", "Int", "Int"],
          level: ["Level", "Level", "Lvl"],
          mana: ["Mana", "Mana", "Mana"],
          manargn: ["Mana regeneration", "MP5", "MP5"],
          mastrtng: ["Mastery rating", "Mastery", "Mastery"],
          mleatkpwr: ["Melee attack power", "Melee AP", "AP"],
          mlecritstrkrtng: [
            "Melee critical strike rating",
            "Melee Crit",
            "Crit"
          ],
          mledmgmax: ["Melee maximum damage", "Melee Max Damage", "Max"],
          mledmgmin: ["Melee minimum damage", "Melee Min Damage", "Min"],
          mledps: ["Melee DPS", "Melee DPS", "DPS"],
          mlehastertng: ["Melee haste rating", "Melee Haste", "Haste"],
          mlehitrtng: ["Melee hit rating", "Melee Hit", "Hit"],
          mlespeed: ["Melee speed", "Melee Speed", "Speed"],
          natres: ["Nature resistance", "Nature Resist", "NatR"],
          natsplpwr: ["Nature spell power", "Nature Power", "NatP"],
          nsockets: ["Number of sockets", "Sockets", "Sockt"],
          parryrtng: ["Parry rating", "Parry", "Parry"],
          reqarenartng: [
            "Required personal and team arena rating",
            "Req Rating",
            "Rating"
          ],
          reqlevel: ["Required level", "Req Level", "Level"],
          resirtng: ["PvP Resilience rating", "PvP Resilience", "Resil"],
          rgdatkpwr: ["Ranged attack power", "Ranged AP", "RAP"],
          rgdcritstrkrtng: [
            "Ranged critical strike rating",
            "Ranged Crit",
            "Crit"
          ],
          rgddmgmax: ["Ranged maximum damage", "Ranged Max Damage", "Max"],
          rgddmgmin: ["Ranged minimum damage", "Ranged Min Damage", "Min"],
          rgddps: ["Ranged DPS", "Ranged DPS", "DPS"],
          rgdhastertng: ["Ranged haste rating", "Ranged Haste", "Haste"],
          rgdhitrtng: ["Ranged hit rating", "Ranged Hit", "Hit"],
          rgdspeed: ["Ranged speed", "Ranged Speed", "Speed"],
          sepbasestats: "Base stats",
          sepdefensivestats: "Defensive stats",
          sepindividualstats: "Individual stats",
          sepoffensivestats: "Offensive stats",
          sepresistances: "Resistances",
          sepweaponstats: "Weapon stats",
          shares: ["Shadow resistance", "Shadow Resist", "ShaR"],
          shasplpwr: ["Shadow spell power", "Shadow Power", "ShaP"],
          speed: ["Speed", "Speed", "Speed"],
          spi: ["Spirit", "Spi", "Spi"],
          splcritstrkrtng: [
            "Spell critical strike rating",
            "Spell Crit",
            "Crit"
          ],
          spldmg: ["Damage done by spells", "Spell Damage", "Dmg"],
          splheal: ["Healing done by spells", "Healing", "Heal"],
          splpwr: ["Spell power", "Spell Power", "SP"],
          splhastertng: ["Spell haste rating", "Spell Haste", "Haste"],
          splhitrtng: ["Spell hit rating", "Spell Hit", "Hit"],
          splpen: ["Spell penetration", "Spell Pen", "Pen"],
          sta: ["Stamina", "Sta", "Sta"],
          str: ["Strength", "Str", "Str"],
          pvppower: ["PvP Power", "PvPPower", "PvPPower"]
        }
      };
    }

    function au() {
      if (WH.Tooltip) {
        WH.wowheadRemotePreload = true;
      }
      if (P) {
        if (!WH.wowheadRemotePreload) {
          var aY = ["basic.js?22"];
          if (j("iconSize")) {
            aY.push("global/WH/Icon.js?1");
          }
          for (var a1 = 0, a0; (a0 = aY[a1]); a1++) {
            var aZ = document.createElement("script");
            aZ.src = g_staticUrl + "/js/" + a0;
            M.appendChild(aZ);
          }
        }
      } else {
        R();
        u(function() {
          aa = window.Locale;
          ab.fetch(x, WH.getDataEnv());
          ab.fetch(ai, WH.getDataEnv());
        });
      }
    }

    function az() {
      var aZ = j("hide");
      if (!aZ) {
        return;
      }
      if (typeof aP !== "undefined") {
        return;
      }
      if (!document.styleSheets) {
        return;
      }
      var a0 = document.createElement("style");
      a0.type = "text/css";
      M.appendChild(a0);
      if (!window.createPopup) {
        M.appendChild(document.createTextNode(""));
      }
      aP = document.styleSheets[document.styleSheets.length - 1];
      for (var aY in aZ) {
        if (!aZ.hasOwnProperty(aY) || !aZ[aY]) {
          continue;
        }
        if (aP.insertRule) {
          aP.insertRule(
            ".wowhead-tooltip .whtt-" + aY + "{display: none}",
            aP.cssRules.length
          );
        } else {
          if (aP.addRule) {
            aP.addRule(".wowhead-tooltip .whtt-" + aY, "display: none", -1);
          }
        }
      }
    }
    this.getEntity = function(aZ, a2, a1, aY) {
      var a0 = aU(aZ);
      a0[a2] = a0[a2] || {};
      a0[a2][a1] = a0[a2][a1] || {};
      a0[a2][a1][aY] = a0[a2][a1][aY] || {
        status: O,
        callbacks: [],
        data: {}
      };
      return a0[a2][a1][aY];
    };

    function aU(aY) {
      if (typeof ad[aY] !== "object") {
        throw new Error(
          "Wowhead tooltips could not find config for entity #" + aY
        );
      }
      return ad[aY].data;
    }

    function aL(aY) {
      if (typeof ad[aY] !== "object") {
        WH.error("Wowhead tooltips could not find config for entity #" + aY);
        return undefined;
      }
      if (!WH.wowheadRemote || !ad[aY].hasOwnProperty("maxId")) {
        return undefined;
      }
      return {
        min: ad[aY].hasOwnProperty("minId") ? ad[aY].minId : 1,
        max: ad[aY].maxId
      };
    }

    function ax(aY) {
      if (typeof ad[aY] !== "object") {
        WH.error("Wowhead tooltips could not find config for entity #" + aY);
        return "Entity";
      }
      return ad[aY].name;
    }

    function ao(aY) {
      if (typeof ad[aY] !== "object") {
        WH.error("Wowhead tooltips could not find config for entity #" + aY);
        return "unknown";
      }
      return ad[aY].path;
    }

    function c(aY, aZ) {
      var a0 = a[aY] || a[0];
      return a0[aZ] || "";
    }

    function j(aZ) {
      var aY = S();
      if (!aY) {
        return null;
      }
      if (!aY.hasOwnProperty(aZ)) {
        if (aW[aZ] && aY.hasOwnProperty(aW[aZ])) {
          return aY[aW[aZ]];
        }
        return null;
      }
      return aY[aZ];
    }

    function S() {
      if (typeof whTooltips === "object") {
        return whTooltips;
      }
      if (typeof wowhead_tooltips === "object") {
        return wowhead_tooltips;
      }
      return null;
    }

    function R() {
      if (H) {
        return;
      }
      H = true;
      WH.aE(document, "keydown", function(aY) {
        aY = WH.normalizeEvent(aY);
        switch (aY.keyCode) {
          case 27:
            $WowheadPower.clearTouchTooltip();
            WH.Tooltip.hide();
            break;
        }
      });
      if (WH.isTouch()) {
        i();
      } else {
        WH.aE(document, "mouseover", I);
      }
    }
    this.attachTouchTooltips = function(aY) {
      if (!WH.isTouch()) {
        return;
      }
      if (aY && aY.nodeType === 1) {
        i(aY);
      }
    };

    function u(aY) {
      if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", aY);
      } else {
        aY();
      }
    }

    function i(aY) {
      if (!WH.isTouch()) {
        return;
      }
      u(function() {
        aY = aY || document.body;
        var aZ = WH.gE(aY, "a");
        for (var a0 in aZ) {
          if (aZ[a0].onclick == null) {
            aZ[a0].onclick = r;
            continue;
          }
          WH.aE(aZ[a0], "click", r);
        }
      });
    }
    this.init = function() {
      if (j("iconSize") && typeof Icon === "undefined") {
        setTimeout($WowheadPower.init, 10);
        return;
      }
      if (P) {
        if (!WH.wowheadRemotePreload) {
          WH.ae(
            M,
            WH.ce("link", {
              type: "text/css",
              href: g_staticUrl + "/css/basic.css?&14",
              rel: "stylesheet"
            })
          );
          if (j("iconSize")) {
            WH.ae(
              M,
              WH.ce("link", {
                type: "text/css",
                href: g_staticUrl + "/css/global/icon.css",
                rel: "stylesheet"
              })
            );
          }
        }
      }
      R();
      u(function() {
        if (
          j("renameLinks") ||
          j("colorLinks") ||
          j("iconizeLinks") ||
          j("iconSize")
        ) {
          for (var aY = 0; aY < document.links.length; aY++) {
            var aZ = document.links[aY];
            J(aZ);
          }
          az();
        }
      });
    };

    function L(aY) {
      var aZ = WH.getCursorPos(aY);
      aw = aZ.x;
      av = aZ.y;
    }

    function am(aZ, a0) {
      if (aZ.classList) {
        aZ.classList.add.apply(aZ.classList, a0);
      } else {
        for (var aY = 0; aY < a0.length; aY++) {
          if ((" " + aZ.className + " ").indexOf(" " + a0[aY] + " ") < 0) {
            aZ.className = (aZ.className ? aZ.className + " " : "") + a0[aY];
          }
        }
      }
    }

    function J(a1, bm) {
      if (bm && a1.dataset && a1.dataset.simpleTooltip) {
        if (!WH.isTouch() && !a1.onmouseout) {
          a1.onmousemove = aD;
          a1.onmouseout = ah;
        }
        WH.Tooltip.show(
          a1,
          a1.dataset.simpleTooltip.length < 30
            ? '<div class="no-wrap">' + a1.dataset.simpleTooltip + "</div>"
            : a1.dataset.simpleTooltip
        );
        return e;
      }
      if (a1.nodeName !== "A" && a1.nodeName !== "AREA") {
        return aK;
      }
      var a5 = a1.rel;
      try {
        if (a1.dataset && a1.dataset.hasOwnProperty("wowhead")) {
          a5 = a1.dataset.wowhead;
        } else {
          if (a1.getAttribute && a1.getAttribute("data-wowhead")) {
            a5 = a1.getAttribute("data-wowhead");
          }
        }
      } catch (bs) {
        void 0;
      }
      if (
        (!a1.href.length && !a5) ||
        (a5 && /^np\b/.test(a5)) ||
        a1.getAttribute("data-disable-wowhead-tooltip") === "true" ||
        (WH.isTouch() &&
          a1.getAttribute("data-disable-wowhead-touch-tooltip") === "true")
      ) {
        return o;
      }
      var bj,
        bi,
        bh,
        aZ,
        bp = {};
      p = bp;
      var a4 = function(bu, bv, bw) {
        switch (bv) {
          case "buff":
          case "map":
          case "noimage":
          case "nomajor":
          case "notip":
          case "premium":
          case "pvp":
          case "sock":
          case "text":
          case "twcata":
          case "twmists":
          case "twtbc":
          case "twwotlk":
            bp[bv] = true;
            break;
          case "artk":
          case "c":
          case "dd":
          case "ddsize":
          case "diff":
          case "diffnew":
          case "ench":
          case "gem1lvl":
          case "gem2lvl":
          case "gem3lvl":
          case "ilvl":
          case "level":
          case "lvl":
          case "nlc":
          case "pwr":
          case "q":
          case "rand":
          case "rank":
          case "spec":
          case "tink":
          case "upgd":
            bp[bv] = parseInt(bw);
            break;
          case "abil":
          case "azerite-essence-powers":
          case "azerite-powers":
          case "bonus":
          case "cri":
          case "forg":
          case "gem1bonus":
          case "gem2bonus":
          case "gem3bonus":
          case "gems":
          case "know":
          case "pcs":
          case "rewards":
            bp[bv] = bw.split(":");
            break;
          case "domain":
          case "who":
            bp[bv] = bw;
            break;
          case "image":
            if (bw === "premium") {
              bp[bw] = true;
            } else {
              bp[bv] = bw ? "_" + bw : "";
            }
            break;
          case "transmog":
            if (bw === "hidden") {
              bp[bv] = bw;
            } else {
              bp[bv] = parseInt(bw);
            }
            break;
          case "when":
            bp[bv] = new Date(parseInt(bw));
            break;
        }
      };
      if (aB.applyto & 1) {
        bi = 2;
        bh = 3;
        if (
          a1.href.indexOf("http://") == 0 ||
          a1.href.indexOf("https://") == 0
        ) {
          bj = 1;
          aZ = a1.href.match(
            /^https?:\/\/(.+?)?\.?(?:wowhead)\.com(?:\:\d+)?\/\??(item|quest|spell|zone|achievement|event|itemset|item-set|transmog-set|outfit|guide|statistic|currency|npc|object|pet-ability|petability|building|follower|champion|bfa-champion|garrisonability|mission-ability|mission|ship|threat|resource|order-advancement|affix|azerite-essence|azerite-essence-power)[=/](?:[^/?&#]+-)?(-?\d+(?:\.\d+)?)/
          );
          if (!aZ) {
            aZ = a1.href.match(
              /^https?:\/\/(.+?)?\.?(?:wowhead)\.com(?:\:\d+)?\/(guide)s\/([^\?&#]+)/
            );
          }
          E = 0;
        } else {
          aZ = a1.href.match(
            /()\/\??(item|quest|spell|zone|achievement|event|itemset|item-set|transmog-set|outfit|statistic|currency|npc|object|pet-ability|petability|building|follower|champion|bfa-champion|garrisonability|mission-ability|mission|ship|threat|resource|order-advancement|affix|azerite-essence|azerite-essence-power|guide)[=/](?:[^/?&#]+-)?(-?\d+(?:\.\d+)?)/
          );
          if (!aZ) {
            aZ = a1.href.match(/()\/(guide)s\/([^\?&#]+)/);
          }
          E = 1;
        }
      }
      if (aZ == null && a5 && aB.applyto & 2) {
        bj = 0;
        bi = 1;
        bh = 2;
        aZ = a5.match(
          /(item|quest|spell|zone|achievement|event|itemset|item-set|transmog-set|outfit|statistic|currency|npc|object|pet-ability|petability|building|follower|champion|bfa-champion|garrisonability|mission-ability|mission|ship|threat|resource|order-advancement|affix|azerite-essence|azerite-essence-power|guide).?(-?\d+(?:\.\d+)?)/
        );
        E = 1;
      }
      if (!aZ) {
        return o;
      }
      a1.href.replace(/([a-zA-Z0-9-]+)=?([^&?#]*)/g, a4);
      if (a5) {
        a5.replace(/([a-zA-Z0-9-]+)=?([^&?#]*)/g, a4);
      }
      if (bp.gems && bp.gems.length > 0) {
        var bn;
        for (bn = Math.min(3, bp.gems.length - 1); bn >= 0; --bn) {
          if (parseInt(bp.gems[bn])) {
            break;
          }
        }
        ++bn;
        if (bn == 0) {
          delete bp.gems;
        } else {
          if (bn < bp.gems.length) {
            bp.gems = bp.gems.slice(0, bn);
          }
        }
      }
      var a0 = ["bonus", "gem1bonus", "gem2bonus", "gem3bonus"];
      for (var be = 0, a6; (a6 = a0[be]); be++) {
        if (bp[a6] && bp[a6].length > 0) {
          for (bn = Math.min(16, bp[a6].length - 1); bn >= 0; --bn) {
            if (parseInt(bp[a6][bn])) {
              break;
            }
          }
          ++bn;
          if (bn == 0) {
            delete bp[a6];
          } else {
            if (bn < bp[a6].length) {
              bp[a6] = bp[a6].slice(0, bn);
            }
          }
        }
      }
      if (bp.abil && bp.abil.length > 0) {
        var bn,
          br = [],
          bl;
        for (bn = 0; bn < Math.min(8, bp.abil.length); bn++) {
          if ((bl = parseInt(bp.abil[bn]))) {
            br.push(bl);
          }
        }
        if (br.length == 0) {
          delete bp.abil;
        } else {
          bp.abil = br;
        }
      }
      if (bp.rewards && bp.rewards.length > 0) {
        var bn;
        for (bn = Math.min(3, bp.rewards.length - 1); bn >= 0; --bn) {
          if (/^\d+.\d+$/.test(bp.rewards[bn])) {
            break;
          }
        }
        ++bn;
        if (bn == 0) {
          delete bp.rewards;
        } else {
          if (bn < bp.rewards.length) {
            bp.rewards = bp.rewards.slice(0, bn);
          }
        }
      }
      aq = a1;
      var bt = null;
      var bk = aa.getId();
      var aY = WH.getDataEnv();
      if (bp.domain) {
        bt = bp.domain.toLowerCase();
      } else {
        if (bj && aZ[bj]) {
          bt = aZ[bj].toLowerCase().replace(/(?:^|\.)(staging|dev)$/, "");
        }
      }
      if (bt !== null) {
        aY = WH.dataEnv.MAIN;
        bk = WH.getLocaleFromDomain(bt);
        if (new RegExp("\\b" + WH.BETA_DOMAIN + "\\b").test(bt)) {
          aY = WH.dataEnv.BETA;
        } else {
          for (var bc in WH.dataEnv) {
            if (
              !WH.dataEnv.hasOwnProperty(bc) ||
              !WH.dataEnvTerm.hasOwnProperty(WH.dataEnv[bc])
            ) {
              continue;
            }
            if (
              new RegExp("\\b" + WH.dataEnvTerm[WH.dataEnv[bc]] + "\\b").test(
                bt
              )
            ) {
              aY = WH.dataEnv[bc];
              break;
            }
          }
        }
      }
      if (aY === WH.dataEnv.PTR && !WH.isPtrActive()) {
        aY = WH.dataEnv.MAIN;
      }
      if (aY === WH.dataEnv.BETA && !WH.isBetaActive()) {
        aY = WH.dataEnv.MAIN;
      }
      if ([WH.dataEnv.BETA, WH.dataEnv.PTR].indexOf(aY) >= 0) {
        bk = 0;
      }
      if (
        a1.href.indexOf("#") != -1 &&
        document.location.href.indexOf(aZ[bi] + "=" + aZ[bh]) != -1
      ) {
        return o;
      }
      var a9 = false;
      if (WH.isTouch()) {
        if ("innerWidth" in window) {
          a9 = window.innerWidth < A;
        } else {
          var bq = document.documentElement || document.body;
          a9 = !isNaN(bq.clientWidth) && bq.clientWidth < A;
        }
      }
      ap = aG["float"];
      if (a9) {
        ap = aG.screen;
      } else {
        if (
          (a1.parentNode.className.indexOf("icon") == 0 &&
            a1.parentNode.nodeName == "DIV") ||
          a1.getAttribute("data-whattach") == "icon"
        ) {
          ap = aG.attachToIcon;
        } else {
          if (WH.isTouch() || a1.getAttribute("data-whattach") == "true") {
            ap = aG.attach;
          } else {
            var a8 = a1.parentNode;
            var a7 = 0;
            while (a8) {
              if (a8.className && a8.className.indexOf("menu-inner") == 0) {
                ap = aG.attachWithoutScreenshot;
                break;
              }
              a7++;
              if (a7 > 9) {
                break;
              }
              a8 = a8.parentNode;
            }
          }
        }
      }
      if (!WH.isTouch() && !a1.onmouseout) {
        if (ap === aG["float"]) {
          a1.onmousemove = aD;
        }
        a1.onmouseout = ah;
      }
      if (ap === aG["float"] && a1.dataset.whtticon === "false") {
        ap = aG.floatWithoutIcon;
      }
      var ba = aZ[bi];
      var a3 = WH.getTypeIdFromTypeString(ba);
      var a2 = aZ[bh];
      if (bm) {
        B = true;
        L(bm);
        WH.Tooltip.showingTooltip = true;
        if (typeof a1.overrideTooltip == "object") {
          var bd = a1.overrideTooltip.html;
          var bb = a1.overrideTooltip.html2;
          if (typeof a1.overrideTooltip.htmlGenerator == "function") {
            bd = a1.overrideTooltip.htmlGenerator(a1.overrideTooltip);
          }
          if (typeof a1.overrideTooltip.html2Generator == "function") {
            bb = a1.overrideTooltip.html2Generator(a1.overrideTooltip);
          }
          if (a1.overrideTooltip.spanClass) {
            bd =
              '<span class="' +
              a1.overrideTooltip.spanClass +
              '">' +
              bd +
              "</span>";
            if (bb) {
              bb =
                '<span class="' +
                a1.overrideTooltip.spanClass +
                '">' +
                bb +
                "</span>";
            }
          }
          aT(
            bk,
            bd,
            a1.overrideTooltip.icon,
            a1.overrideTooltip.map,
            a1.overrideTooltip.spellData,
            bb,
            a1.overrideTooltip.image,
            a1.overrideTooltip.imageClass
          );
        } else {
          h(a3, a2, aY, bk, bp);
        }
      }
      if (bm || !S()) {
        return e;
      }
      var bf = $WowheadPower.getEntity(a3, ar(a3, a2, bp), aY, bk);
      var bg = [];
      if (
        (j("renameLinks") &&
          a1.getAttribute("data-wh-rename-link") !== "false") ||
        a1.getAttribute("data-wh-rename-link") === "true"
      ) {
        bg.push(function() {
          delete a1.dataset.whIconAdded;
          a1.innerHTML = "<span>" + bf.data.name + "</span>";
        });
      }
      var bo = a1.getAttribute("data-wh-icon-size");
      if ((bo || j("iconizeLinks")) && aA.indexOf(a3) !== -1) {
        if (!bo) {
          bo = j("iconSize");
        }
        bg.push(function() {
          if (bf.data.icon && a1.dataset.whIconAdded !== "true") {
            aE(a1, bf.data, bo);
          }
        });
      }
      if (j("colorLinks") && a3 === x) {
        bg.push(function() {
          am(a1, ["q" + bf.data.quality]);
        });
      }
      if (bg.length) {
        if (bf.status === O || bf.status === ag) {
          bf.callbacks = bf.callbacks.concat(bg);
          if (bf.status === O) {
            aC(a3, a2, aY, bk, true, bp);
          }
        } else {
          if (bf.status === an || bf.status === y) {
            while (bg.length) {
              bg.shift()();
            }
          }
        }
      }
      return e;
    }

    function aE(aZ, a0, aY) {
      if (!aY || typeof WH.Icon === "undefined" || !WH.Icon.isValidSize(aY)) {
        aY = "tiny";
      }
      var a1 = a0.icon.toLocaleLowerCase();
      if (aY === "tiny") {
        am(aZ, ["icontinyl"]);
        if (aZ.style.setProperty) {
          aZ.style.setProperty("padding-left", "18px", "important");
        } else {
          aZ.style.paddingLeft = "18px";
        }
        aZ.style.verticalAlign = "center";
        aZ.style.background =
          "url(" +
          g_staticUrl +
          "/images/wow/icons/tiny/" +
          a1 +
          ".gif) left center no-repeat";
      } else {
        if (aZ.getAttribute("data-wh-icon-added") === "true") {
          return;
        }
        WH.aef(
          aZ,
          WH.Icon.create(a1, aY, null, {
            span: true
          })
        );
      }
      aZ.setAttribute("data-wh-icon-added", "true");
    }

    function I(a0) {
      a0 = WH.normalizeEvent(a0);
      var aZ = a0._target;
      var aY = 0;
      while (aZ != null && aY < 5 && J(aZ, a0) === aK) {
        aZ = aZ.parentNode;
        ++aY;
      }
    }

    function r(a1) {
      a1 = WH.normalizeEvent(a1);
      var a0 = this;
      if (a0.hasWHTouchTooltip === true) {
        return;
      }
      var aZ = 0;
      var aY;
      while (a0 != null && aZ < 5 && (aY = J(a0, a1)) === aK) {
        a0 = a0.parentNode;
        ++aZ;
      }
      if (aY === e) {
        if (af !== null) {
          af.removeAttribute("data-showing-touch-tooltip");
          af.hasWHTouchTooltip = false;
        }
        af = a0;
        af.hasWHTouchTooltip = true;
        if (a1.stopPropagation) {
          a1.stopPropagation();
        }
        if (a1.preventDefault) {
          a1.preventDefault();
        }
        return false;
      }
    }

    function aD(aY) {
      aY = WH.normalizeEvent(aY);
      L(aY);
      WH.Tooltip.move(aw, av, 0, 0, f, C);
    }

    function ah() {
      al = null;
      aq = null;
      WH.Tooltip.hide();
    }

    function ak(a0) {
      if (!WH.isDev()) {
        return "https://" + a0 + ".wowhead.com";
      }
      var aY = document.location.hostname.split(".");
      aY = aY[aY.length - 3];
      if (a0 === "www") {
        a0 = aY;
      } else {
        a0 = a0 + "." + aY;
      }
      var aZ = "https://" + a0 + ".wowhead.com";
      if (document.location.port !== "") {
        aZ +=
          (document.location.port.indexOf(":") < 0 ? ":" : "") +
          document.location.port;
      }
      if (document.location.protocol !== "https:") {
        aZ = aZ.replace(/^https:/, "http:");
      }
      return aZ;
    }

    function w(aZ) {
      var aY = "tooltip";
      if (p && p.buff) {
        aY = "buff";
      }
      if (p && p.text) {
        aY = "text";
      }
      if (p && p.premium) {
        aY = "tooltip_premium";
      }
      return aY + (aZ || "");
    }

    function aS() {
      return p && p.text ? "text_icon" : "icon";
    }

    function aX() {
      return (p && p.buff ? "buff" : "") + "spells";
    }

    function z(aY) {
      if (typeof aY === "undefined") {
        return "image_NONE";
      }
      return "image" + aY;
    }

    function h(a3, aZ, a0, a5, a1) {
      if (!a1) {
        a1 = {};
      }
      var a4 = ar(a3, aZ, a1);
      al = a3;
      F = a4;
      U = a0;
      ay = a5;
      p = a1;
      ab.isLoaded(a3, a0);
      var a2 = $WowheadPower.getEntity(a3, a4, a0, a5);
      if (a2.status === an || a2.status === g) {
        var a6 = a2.data[z(a1.image)];
        var a7 = a2.data["image" + a1.image + "_class"];
        var aY = K(a3, aZ, a0);
        if (aY) {
          a6 = aY[0];
          a7 = aY[1];
        }
        aT(
          a5,
          a2.data[w()],
          a2.data[aS()],
          a2.data.map,
          a2.data[aX()],
          a2.data[w(2)],
          a6,
          a7
        );
      } else {
        if (a2.status === ag || a2.status === y) {
          if (WH.inArray(v, a3) == -1) {
            aT(a5, c(a5, "loading"));
          }
        } else {
          aC(a3, aZ, a0, a5, WH.inArray(v, a3) != -1, a1);
        }
      }
    }

    function aC(a8, aZ, a0, bb, a7, a1) {
      var a9 = ar(a8, aZ, a1);
      var a3 = $WowheadPower.getEntity(a8, a9, a0, bb);
      if (a3.status !== O && a3.status !== aF) {
        return;
      }
      a3.status = ag;
      var a5 = aL(a8);
      if (a5 && (parseInt(aZ, 10) < a5.min || parseInt(aZ, 10) > a5.max)) {
        $WowheadPower.register(a8, aZ, a0, bb, {
          error: "ID is out of range"
        });
        return;
      }
      if (!a7) {
        a3.timer = setTimeout(W.bind(this, a8, a9, a0, bb), 333);
      }
      var bc = [];
      for (var a4 in a1) {
        switch (a4) {
          case "spec":
            if (a8 === ai || a8 === aO) {
              break;
            }
          case "abil":
          case "artk":
          case "azerite-essence-powers":
          case "azerite-powers":
          case "bonus":
          case "dd":
          case "ddsize":
          case "diff":
          case "diffnew":
          case "ench":
          case "gem1bonus":
          case "gem1lvl":
          case "gem2bonus":
          case "gem2lvl":
          case "gem3bonus":
          case "gem3lvl":
          case "gems":
          case "ilvl":
          case "level":
          case "lvl":
          case "nlc":
          case "nomajor":
          case "pvp":
          case "q":
          case "rand":
          case "rank":
          case "rewards":
          case "sock":
          case "tink":
          case "transmog":
          case "twcata":
          case "twmists":
          case "twtbc":
          case "twwotlk":
          case "upgd":
            if (typeof a1[a4] === "object") {
              bc.push(a4 + "=" + a1[a4].join(":"));
            } else {
              if (a1[a4] === true) {
                bc.push(a4);
              } else {
                bc.push(a4 + "=" + a1[a4]);
              }
            }
            break;
        }
      }
      var a2 = WH.getDomainFromLocale(bb);
      switch (a0) {
        case WH.dataEnv.MAIN:
          break;
        case WH.dataEnv.BETA:
          if (WH.BETA_DOMAIN) {
            a2 += (a2 ? "." : "") + WH.BETA_DOMAIN;
            break;
          }
        default:
          a2 += (a2 ? "." : "") + WH.dataEnvTerm[a0];
      }
      if (!a2) {
        a2 = "www";
      }
      var a6 = ak(a2);
      if (a0 === WH.dataEnv.PTR || a0 === WH.dataEnv.BETA) {
        if (typeof g_wow_build !== "undefined") {
          bc.push(g_wow_build);
        }
      }
      if (!ab.isLoaded(a8, a0)) {
        ab.fetch(a8, a0);
      }
      if (a8 == x && a1 && a1.hasOwnProperty("lvl") && !ab.isLoaded(ai, a0)) {
        ab.fetch(ai, a0);
      }
      var aY = bc.length ? "?" + bc.join("&") : "";
      var ba = a6 + "/tooltip/" + ao(a8) + "/" + aZ + aY;
      WH.xhrJsonRequest(
        ba,
        function(bf, bi, be, bh, bd, bg) {
          if (!bg) {
            WH.error(
              "Wowhead tooltips failed to load data for " + ax(bf) + " #" + bi
            );
            return;
          } else {
            if (bg.error) {
              WH.error(
                "Wowhead tooltip request responded with an error",
                bg.error,
                ax(bf) + " #" + bi
              );
            }
          }
          $WowheadPower.register(bf, be, bh, bd, bg);
        }.bind(null, a8, aZ, a9, a0, bb)
      );
    }

    function aT(bf, bi, a5, bh, aY, bp, a0, a4) {
      az();
      if (!B) {
        return;
      }
      if (aq && aq._fixTooltip) {
        bi = aq._fixTooltip(bi, al, F, aq);
      }
      var bl = false;
      if (!bi) {
        bi = c(bf, "notFound").replace("%s", ax(al));
        a5 = "inv_misc_questionmark";
        bl = true;
      } else {
        if (p != null) {
          if (WH.reforgeStats && p.forg && WH.reforgeStats[p.forg]) {
            var a3 = WH.reforgeStats[p.forg];
            var by = [a3.i1];
            for (var bv in WH.individualToGlobalStat) {
              if (WH.individualToGlobalStat[bv] == by[0]) {
                by.push(bv);
              }
            }
            var bt;
            if (
              (bt = bi.match(
                new RegExp(
                  "(<!--(stat|rtg)(" + by.join("|") + ")-->)[+-]?([0-9]+)"
                )
              )) &&
              !bi.match(new RegExp("<!--(stat|rtg)" + a3.i2 + "-->[+-]?[0-9]+"))
            ) {
              var bq = Math.floor(bt[4] * a3.v),
                bo = aQ.traits[a3.s2][0];
              if (a3.i2 == 6) {
                bi = bi.replace("<!--rs-->", "<br />+" + bq + " " + bo);
              } else {
                bi = bi.replace(
                  "<!--rr-->",
                  WH.sprintfGlobal(
                    aQ.tooltip_genericrating,
                    bo.toLowerCase(),
                    a3.i2,
                    bq
                  )
                );
              }
              bi = bi.replace(bt[0], bt[1] + (bt[4] - bq));
              bi = bi.replace(
                "<!--rf-->",
                '<span class="q2">' +
                  WH.sprintfGlobal(
                    aQ.tooltip_reforged,
                    bq,
                    aQ.traits[a3.s1][2],
                    aQ.traits[a3.s2][2]
                  ) +
                  "</span><br />"
              );
            }
          }
          if (p.pcs && p.pcs.length) {
            var bs = 0;
            for (var bv = 0, a9 = p.pcs.length; bv < a9; ++bv) {
              var bt;
              var be = new RegExp(
                "<span><!--si([0-9]+:)*" +
                  p.pcs[bv] +
                  '(:[0-9]+)*--><a href="/??item=(\\d+)">(.+?)</a></span>'
              );
              if ((bt = bi.match(be))) {
                var bx = !isNaN(parseInt(ay)) ? s[ay] : "enus";
                var a7 =
                  WH.isSet("g_items") && g_items[p.pcs[bv]]
                    ? g_items[p.pcs[bv]]["name_" + bx]
                    : bt[4];
                var a1 = '<a href="/item=' + bt[3] + '">' + a7 + "</a>";
                var bd =
                  '<span class="q13"><!--si' +
                  p.pcs[bv] +
                  "-->" +
                  a1 +
                  "</span>";
                bi = bi.replace(bt[0], bd);
                ++bs;
              }
            }
            if (bs > 0) {
              bi = bi.replace("(0/", "(" + bs + "/");
              bi = bi.replace(
                new RegExp("<span>\\(([0-" + bs + "])\\)", "g"),
                '<span class="q2">($1)'
              );
            }
          }
          if (p.know && p.know.length) {
            bi = WH.setTooltipSpells(bi, p.know, aY);
          }
          if (p.lvl) {
            bi = WH.setTooltipLevel(bi, p.lvl ? p.lvl : 100, p.buff);
          }
          if (p.who && p.when) {
            bi = bi.replace(
              "<table><tr><td><br />",
              '<table><tr><td><br /><span class="q2">' +
                WH.sprintf(
                  c(bf, "achievementComplete"),
                  p.who,
                  p.when.getMonth() + 1,
                  p.when.getDate(),
                  p.when.getFullYear()
                ) +
                "</span><br /><br />"
            );
            bi = bi.replace(/class="q0"/g, 'class="r3"');
          }
          if (p.notip && a0) {
            bi = "";
            a5 = null;
          }
          if (al == at && p.pwr) {
            bi = bi.replace(/<!--sca-->(\d+)<!--sca-->/g, function(bz, bA) {
              return Math.floor(parseInt(bA) * (1 + 0.05 * p.pwr));
            });
          }
          if (al == Z && p.cri) {
            for (var bv = 0; bv < p.cri.length; bv++) {
              bi = bi.replace(
                new RegExp("<!--cr" + parseInt(p.cri[bv]) + ":[^<]+", "g"),
                '<span class="q2">$&</span>'
              );
            }
          }
        }
      }
      if (
        !P &&
        WH.isSet("g_user") &&
        "lists" in g_user &&
        WH.isSet("g_completion") &&
        WH.isRetailTree(U)
      ) {
        var a2 = "";
        var aZ =
          al in g_types && g_types[al] in g_completion
            ? g_completion[g_types[al]]
            : false;
        var a8 = $WowheadPower.getEntity(al, F);
        if (aZ && al == aI) {
          if (
            bl ||
            bi === c(bf, "loading") ||
            (a8.hasOwnProperty("worldquesttype") && a8.worldquesttype != 0) ||
            (a8.hasOwnProperty("daily") && a8.daily != 0) ||
            (a8.hasOwnProperty("weekly") && a8.weekly != 0)
          ) {
            aZ = false;
          }
        }
        var bk = !(
          aZ &&
          al in g_completion_categories &&
          WH.inArray(g_completion_categories[al], a8.completion_category) === -1
        );
        if (aZ) {
          for (var bw in g_user.lists) {
            var bu = g_user.lists[bw];
            if (!(bu.id in aZ)) {
              continue;
            }
            var bj = /^-?\d+(?:\.\d+)?/.exec(F);
            bj = bj && bj.length ? bj[0] : F;
            var ba = WH.inArray(aZ[bu.id], bj) != -1;
            if (!ba && !bk) {
              continue;
            }
            a2 +=
              '<br><span class="progress-icon ' +
              (ba ? "progress-8" : "progress-0") +
              '"></span> ';
            a2 += bu.character + " - " + bu.realm + " " + bu.region;
          }
        }
        if (a2 != "") {
          bi +=
            '<br><span class="q">' + window.LANG.completion + ":</span>" + a2;
        }
      }
      if (
        !P &&
        al == x &&
        WH.isSet("g_completion") &&
        "bagscans" in g_completion &&
        WH.isRetailTree(U)
      ) {
        var bb = /^\d+/.exec(F);
        if (bb) {
          bb = bb[0];
        } else {
          bb = -1;
        }
        var br = [];
        for (var bg in g_completion.bagscans) {
          br.push(bg);
        }
        var bn = "";
        while ((bg = br.pop())) {
          if (g_completion.bagscans[bg].items.hasOwnProperty(bb)) {
            bn +=
              '<tr><td class="q2" style="text-align: right">' +
              g_completion.bagscans[bg].items[bb] +
              '&nbsp;</td><td style="white-space: nowrap">' +
              g_completion.bagscans[bg].name +
              "</td></tr>";
          }
        }
        if (bn != "") {
          bi +=
            '<br><span class="q">' +
            window.LANG.tooltip_bagscanner +
            "</span><br><table>" +
            bn +
            "</table>";
        }
      }
      if (
        !P &&
        al == aN &&
        typeof WH.getPreferredTransmogRace !== "undefined"
      ) {
        var a6 = WH.getPreferredTransmogRace();
        bi = bi.replace(
          /\/modelviewer(\/classic)?\/transmog\/\d+\/\d+\//g,
          "/modelviewer$1/transmog/" + a6.race + "/" + (a6.gender - 1) + "/"
        );
      }
      if (!P && bi && (p.diff || p.diffnew || p.noimage)) {
        a0 = "";
        a4 = "";
      }
      bi = bi.replace("http://", "https://");
      if (p.map && bh && bh.getMap) {
        bp = bh.getMap();
      }
      var bm = function(bA, bz) {
        if (
          al !== bA.type ||
          F !== bA.id ||
          U !== bA.dataEnv ||
          ay !== bA.locale ||
          p !== bA.params
        ) {
          return;
        }
        switch (ap) {
          case aG.screen:
            WH.Tooltip.showInScreen(aq, bz, null, bp, a0, a4, a5);
            break;
          case aG.attachToIcon:
          case aG.attach:
            WH.Tooltip.setIcon(ap == aG.attachToIcon ? null : a5);
            WH.Tooltip.show(aq, bz, null, null, null, bp, a0, a4);
            break;
          case aG.attachWithoutScreenshot:
            WH.Tooltip.setIcon(a5);
            WH.Tooltip.show(aq, bz, null, null, null, bp);
            break;
          case aG.floatWithoutIcon:
            WH.Tooltip.setIcon(null);
            WH.Tooltip.showAtXY(bz, aw, av, f, C, bp, a0, a4);
            break;
          case aG["float"]:
          default:
            WH.Tooltip.setIcon(a5);
            WH.Tooltip.showAtXY(bz, aw, av, f, C, bp, a0, a4);
        }
        if (P && WH.Tooltip.logo) {
          WH.Tooltip.logo.style.display = E ? "block" : "none";
        }
      };
      var bc = {
        type: al,
        id: F,
        dataEnv: U,
        locale: ay,
        params: p
      };
      aM(bi, aY, bm.bind(this, bc), bc);
    }

    function aM(aZ, a0, a2, a1) {
      switch (a1.type) {
        case aO:
          var aY = $WowheadPower.getEntity(
            a1.type,
            a1.id,
            a1.dataEnv,
            a1.locale
          );
          if (a1.params.spec && !(a1.params.know && a1.params.know.length)) {
            ab.getSpellsBySpec(a1.params.spec, function(a3) {
              aZ = aZ.replace(/<!--embed:([^>]+)-->/g, function(a4, a5) {
                return WH.setTooltipSpells(
                  aY.data.embeds[a5].tooltip,
                  a3,
                  aY.data.embeds[a5].spells
                );
              });
              a2(aZ);
            });
            break;
          } else {
            aZ = aZ.replace(/<!--embed:([^>]+)-->/g, function(a3, a4) {
              return WH.setTooltipSpells(
                aY.data.embeds[a4].tooltip,
                a1.params.know,
                aY.data.embeds[a4].spells
              );
            });
          }
          window.requestAnimationFrame(a2.bind(null, aZ));
          break;
        case ai:
          if (a1.params.spec && !(a1.params.know && a1.params.know.length)) {
            ab.getSpellsBySpec(a1.params.spec, function(a3) {
              aZ = WH.setTooltipSpells(aZ, a3, a0);
              a2(aZ);
            });
            break;
          }
          window.requestAnimationFrame(a2.bind(null, aZ));
          break;
        default:
          window.requestAnimationFrame(a2.bind(null, aZ));
      }
    }

    function W(a0, a2, a1, aY) {
      if (al == a0 && F == a2 && U == a1 && ay == aY) {
        aT(aY, c(aY, "loading"));
        var aZ = $WowheadPower.getEntity(a0, a2, a1, aY);
        aZ.timer = setTimeout(Q.bind(this, a0, a2, a1, aY), 3850);
      }
    }

    function Q(a0, a2, a1, aY) {
      var aZ = $WowheadPower.getEntity(a0, a2, a1, aY);
      aZ.status = aF;
      if (al == a0 && F == a2 && U == a1 && ay == aY) {
        aT(aY, c(aY, "noResponse"));
      }
    }

    function ar(aY, a0, aZ) {
      return (
        a0 +
        (aZ.rand ? "r" + aZ.rand : "") +
        (aZ.ench ? "e" + aZ.ench : "") +
        (aZ.gems ? "g" + aZ.gems.join(",") : "") +
        (aZ.sock ? "s" : "") +
        (aZ.upgd ? "u" + aZ.upgd : "") +
        (aZ.twtbc ? "twtbc" : "") +
        (aZ.twwotlk ? "twwotlk" : "") +
        (aZ.twcata ? "twcata" : "") +
        (aZ.twmists ? "twmists" : "") +
        (aZ.ilvl ? "ilvl" + aZ.ilvl : "") +
        (aZ.lvl ? "lvl" + aZ.lvl : "") +
        (aZ.gem1lvl ? "g1lvl" + aZ.gem1lvl : "") +
        (aZ.gem2lvl ? "g2lvl" + aZ.gem2lvl : "") +
        (aZ.gem3lvl ? "g3lvl" + aZ.gem3lvl : "") +
        (aZ.artk ? "ak" + aZ.artk : "") +
        (aZ.nlc ? "nlc" + aZ.nlc : "") +
        (aZ.transmog ? "transmog" + aZ.transmog : "") +
        (aZ.tink ? "tink" + aZ.tink : "") +
        (aZ.pvp ? "pvp" : "") +
        (aZ.bonus ? "b" + aZ.bonus.join(",") : "") +
        (aZ.gem1bonus ? "g1b" + aZ.gem1bonus.join(",") : "") +
        (aZ.gem2bonus ? "g2b" + aZ.gem2bonus.join(",") : "") +
        (aZ.gem3bonus ? "g3b" + aZ.gem3bonus.join(",") : "") +
        (aZ.q ? "q" + aZ.q : "") +
        (aZ.level ? "level" + aZ.level : "") +
        (aZ.abil ? "abil" + aZ.abil.join(",") : "") +
        (aZ.dd ? "dd" + aZ.dd : "") +
        (aZ.ddsize ? "ddsize" + aZ.ddsize : "") +
        (aZ.diff == ai ? "diff" + aZ.diff : "") +
        (aZ.rank ? "rank" + aZ.rank : "") +
        (aY !== ai && aZ.spec ? "spec" + aZ.spec : "") +
        (aZ.rewards ? "rewards" + aZ.rewards.join(":") : "") +
        (aZ["azerite-powers"] ? "azPowers" + aZ["azerite-powers"] : "") +
        (aZ["azerite-essence-powers"]
          ? "aePowers" + aZ["azerite-essence-powers"]
          : "") +
        (aZ.nomajor ? "nomajor" : "")
      );
    }
    this.clearTouchTooltip = function(a0) {
      if (af) {
        if (a0 !== true) {
          af.removeAttribute("data-showing-touch-tooltip");
        }
        af.hasWHTouchTooltip = false;
      }
      af = null;
      if (a0 !== true && document.querySelectorAll) {
        var aY = document.querySelectorAll("[data-showing-touch-tooltip]");
        if (aY && aY.length) {
          for (var a1 = 0, aZ; (aZ = aY[a1]); a1++) {
            aZ.removeAttribute("data-showing-touch-tooltip");
          }
        }
      }
      if (WH.Tooltip.screen) {
        WH.Tooltip.screenInnerWrapper.scrollTop = 0;
        WH.Tooltip.screenInnerWrapper.scrollLeft = 0;
        WH.Tooltip.screen.style.display = "none";
        WH.Tooltip.mobileTooltipShown = false;
      }
      WH.Tooltip.hide();
      $WowheadPower.setParent();
    };

    function K(aZ, a1, a0) {
      if (P) {
        return false;
      }
      if (!WH.User.isPremium()) {
        return false;
      }
      if (WH.Tooltip.hideScreenshots) {
        return false;
      }
      var aY = WH.Gatherer.get(aZ, a1, a0, true);
      if (aY && aY.screenshot) {
        return [WH.getScreenshotUrl(aY.screenshot, "small"), "screenshot"];
      }
      return false;
    }
    this.register = function(a5, aZ, a0, a6, a4) {
      var a3 = this.getEntity(a5, aZ, a0, a6);
      if (a4.hasOwnProperty("additionalIds")) {
        var a1 = a4.additionalIds;
        delete a4.additionalIds;
        if (a1.length) {
          for (var a7 = 0; a7 < a1.length; a7++) {
            this.register(a5, a1[a7], a0, a6, a4);
          }
        }
      }
      if (!ab.isLoaded(a5, a0)) {
        a3.status = y;
        ab.registerCallback(
          a5,
          a0,
          this.register.bind(this, a5, aZ, a0, a6, a4)
        );
        return;
      }
      if (
        typeof aZ === "string" &&
        (aZ.indexOf("lvl") === 0 || aZ.match(/[^i]lvl/)) &&
        !ab.isLoaded(ai, a0)
      ) {
        a3.status = y;
        ab.registerCallback(
          ai,
          a0,
          this.register.bind(this, a5, aZ, a0, a6, a4)
        );
        return;
      }
      if (a3.timer) {
        clearTimeout(a3.timer);
        delete a3.timer;
      }
      if (!WH.wowheadRemote && a4.map) {
        if (a3.data.map == null) {
          a3.data.map = new Mapper({
            parent: WH.ce("div"),
            zoom: 3,
            zoomable: false,
            buttons: false
          });
        }
        a3.data.map.update(a4.map);
        delete a4.map;
      }
      for (var a2 in a4) {
        if (!a4.hasOwnProperty(a2)) {
          continue;
        }
        a3.data[a2] = a4[a2];
      }
      switch (a3.status) {
        case ag:
        case y:
        case O:
          if (a3.data[w()]) {
            a3.status = an;
          } else {
            a3.status = g;
          }
      }
      if (
        WH.Tooltip.showingTooltip &&
        al == a5 &&
        F == aZ &&
        U == a0 &&
        ay == a6
      ) {
        var a8 = a3.data[z(p.image)];
        var a9 = a3.data["image" + p.image + "_class"];
        var aY = K(a5, aZ, a0);
        if (aY) {
          a8 = aY[0];
          a9 = aY[1];
        }
        aT(
          a6,
          a3.data[w()],
          a3.data.icon,
          a3.data.map,
          a3.data[aX()],
          a3.data[w(2)],
          a8,
          a9
        );
      }
      while (a3.callbacks.length) {
        a3.callbacks.shift()();
      }
    };
    this.request = function(a0, a3, a2, aY, a1) {
      if (!a1) {
        a1 = {};
      }
      if (aY === undefined) {
        aY = aa.getId();
      }
      if (!a2) {
        a2 = WH.getDataEnv();
      }
      var aZ = ar(a0, a3, a1);
      this.getEntity(a0, aZ, a2, aY);
      aC(a0, a3, a2, aY, true, a1);
    };
    this.triggerTooltip = function(aZ, aY) {
      J(
        aZ,
        aY || {
          target: aZ
        }
      );
    };
    this.refreshLinks = function(aY) {
      if (
        aY === true ||
        j("renameLinks") ||
        j("colorLinks") ||
        j("iconizeLinks")
      ) {
        for (var aZ = 0; aZ < document.links.length; aZ++) {
          var a1 = document.links[aZ];
          var a0 = a1.parentNode;
          var a2 = false;
          while (a0 != null) {
            if (
              (" " + a0.className + " ")
                .replace(/[\n\t]/g, " ")
                .indexOf(" wowhead-tooltip ") > -1
            ) {
              a2 = true;
              break;
            }
            a0 = a0.parentNode;
          }
          if (!a2) {
            J(a1);
          }
        }
      }
      this.hideTooltip();
    };
    this.setParent = function(aY) {
      WH.Tooltip.reset();
      WH.Tooltip.prepare(aY);
    };
    this.replaceWithTooltip = function(a8, a4, aZ, a0, a6, a1) {
      if (!a1) {
        a1 = {};
      }
      if (a6 === undefined) {
        a6 = aa.getId();
      }
      if (!a0) {
        a0 = WH.getDataEnv();
      }
      if (typeof a8 == "string") {
        a8 = document.getElementById(a8);
      }
      if (!a8) {
        return false;
      }
      var a5 = ar(a4, aZ, a1);
      var a2 = this.getEntity(a4, a5, a0, a6);
      switch (a2.status) {
        case an:
          if (!a8.parentNode) {
            return true;
          }
          while (a8.hasChildNodes()) {
            a8.removeChild(a8.firstChild);
          }
          var aY = ["wowhead-tooltip-inline"];
          if (a2.data.icon) {
            aY.push("wowhead-tooltip-inline-icon");
          }
          am(a8, aY);
          var a3 = a2.data[w()];
          var a7 = function(a9) {
            WH.Tooltip.append(a8, a9, true, a2.data.icon);
          };
          aM(a3, a2.data[aX()], a7, {
            type: a4,
            id: aZ,
            dataEnv: a0,
            locale: a6,
            params: a1
          });
          return true;
        case ag:
        case O:
          a2.callbacks.push(
            this.replaceWithTooltip.bind(this, a8, a4, aZ, a0, a6, a1)
          );
          this.request(a4, aZ, a0, a6, a1);
          return true;
      }
      return false;
    };
    if (P) {
      this.set = function(aY) {
        WH.cO(aB, aY);
      };
      this.showTooltip = function(a0, aZ, aY) {
        L(a0);
        aT(0, aZ, aY);
      };
      this.hideTooltip = function() {
        if (
          typeof WH === "undefined" ||
          typeof WH.Tooltip === "undefined" ||
          typeof WH.Tooltip.hide !== "function"
        ) {
          return;
        }
        WH.Tooltip.hide();
      };
      this.moveTooltip = function(aY) {
        aD(aY);
      };
    }
    au();
  })();
}
