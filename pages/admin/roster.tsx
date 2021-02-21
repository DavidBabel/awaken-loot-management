import { Button, Checkbox } from "@material-ui/core";
import { useState } from "react";
import { getClassImageUrl } from "../../lib/utils/image";

type Prios = "prio" | "ouvert" | "faible" | "profil++" | "caché" | "";
interface Roster {
  name: string;
  speIcon?: string;
  shivtrIcon: string;
  prio: Prios;
}

const roster: Roster[] = [
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prio: "caché"
  },
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prio: "",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/spell_shadow_shadowform.jpg"
  },
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/priest_holy.png"
  },
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/priest_discipline.png"
  },
  {
    name: "Druide",
    shivtrIcon: "22",
    prio: "caché"
  },
  {
    name: "Druide",
    shivtrIcon: "22",
    prio: "",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/spell_nature_healingtouch.jpg"
  },
  {
    name: "Druide",
    shivtrIcon: "22",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/druid_feral.png"
  },
  {
    name: "Druide",
    shivtrIcon: "22",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/druid_balance.png"
  },
  {
    name: "Chaman",
    shivtrIcon: "18",
    prio: "caché"
  },
  {
    name: "Chaman",
    shivtrIcon: "18",
    prio: "prio",
    speIcon: "https://raidplan.io/assets/img/icons/class/shaman_elemental.png"
  },
  {
    name: "Chaman",
    shivtrIcon: "18",
    prio: "prio",
    speIcon: "https://raidplan.io/assets/img/icons/class/shaman_restoration.png"
  },
  {
    name: "Chaman",
    shivtrIcon: "18",
    prio: "prio",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/spell_fire_flametounge.jpg"
  },
  {
    name: "Mage",
    shivtrIcon: "19",
    prio: "caché"
  },
  {
    name: "Mage",
    shivtrIcon: "19",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/mage_arcane.png"
  },
  {
    name: "Mage",
    shivtrIcon: "19",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/mage_fire.png"
  },
  {
    name: "Mage",
    shivtrIcon: "19",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/mage_frost.png"
  },
  {
    name: "Démoniste",
    shivtrIcon: "20",
    prio: "caché"
  },
  {
    name: "Démoniste",
    shivtrIcon: "20",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/warlock_affliction.png"
  },
  {
    name: "Démoniste",
    shivtrIcon: "20",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/warlock_demonology.png"
  },
  {
    name: "Démoniste",
    shivtrIcon: "20",
    prio: "",
    speIcon:
      "https://raidplan.io/assets/img/icons/class/warlock_destruction.png"
  },
  {
    name: "Voleur",
    shivtrIcon: "15",
    prio: "caché"
  },
  {
    name: "Voleur",
    shivtrIcon: "15",
    prio: "caché",
    speIcon: "https://wow.zamimg.com/images/wow/icons/large/ability_stealth.jpg"
  },
  {
    name: "Voleur",
    shivtrIcon: "15",
    prio: "",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/ability_backstab.jpg"
  },
  {
    name: "Voleur",
    shivtrIcon: "15",
    prio: "caché",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/ability_rogue_eviscerate.jpg"
  },
  {
    name: "Chasseur",
    shivtrIcon: "14",
    prio: "caché"
  },
  {
    name: "Chasseur",
    shivtrIcon: "14",
    prio: "",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/ability_druid_ferociousbite.jpg"
  },
  {
    name: "Chasseur",
    shivtrIcon: "14",
    prio: "caché",
    speIcon:
      "https://wow.zamimg.com/images/wow/icons/large/ability_marksmanship.jpg"
  },
  {
    name: "Chasseur",
    shivtrIcon: "14",
    prio: "",
    speIcon:
      "https://cdn.jsdelivr.net/gh/wowfanet/w/wdb/images/wow/icons/large/ability_rogue_findweakness.jpg"
  },
  {
    name: "Paladin",
    shivtrIcon: "3",
    prio: "prio"
  },
  {
    name: "Paladin",
    shivtrIcon: "3",
    prio: "caché",
    speIcon:
      "https://raidplan.io/assets/img/icons/class/paladin_retribution.png"
  },
  {
    name: "Paladin",
    shivtrIcon: "3",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/warrior_protection.png"
  },
  {
    name: "Paladin",
    shivtrIcon: "3",
    prio: "caché",
    speIcon: "https://raidplan.io/assets/img/icons/class/paladin_holy.png"
  },
  {
    name: "Guerrier",
    shivtrIcon: "12",
    prio: ""
  },
  {
    name: "Guerrier",
    shivtrIcon: "12",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/warrior_protection.png"
  },
  {
    name: "Guerrier",
    shivtrIcon: "12",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/warrior_fury.png"
  },
  {
    name: "Guerrier",
    shivtrIcon: "12",
    prio: "",
    speIcon: "https://raidplan.io/assets/img/icons/class/warrior_arms.png"
  }
];

const recrutement: Array<Prios | ""> = [
  "prio",
  "ouvert",
  "faible",
  "profil++",
  "caché"
];

const colors: { [key in Prios]: string } = {
  prio: "94ff6f",
  ouvert: "35cc00",
  faible: "acacac",
  ["profil++"]: "892602",
  ["caché"]: "ffffff",
  [""]: "ffffff"
};

const title: { [key in Prios]: string } = {
  prio: "Recrutement prioritaire",
  ouvert: "Recrutement ouvert",
  faible: "Recrutement des derniers joueurs",
  ["profil++"]: "Profil de joueur exceptionnel uniquement",
  ["caché"]: "",
  [""]: ""
};

function capitalize(str: string) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function html(content: string[], isTBC: boolean) {
  const url = isTBC
    ? "http://awaken.se/forums/2281974"
    : "http://awaken.se/forums/2213013";
  return `
<div class="inner_content">
  <div class="sc_padding">
    <div class="message">
      <a href="${url}" target="_blank" style="display: block; text-align:center; color: #801a1a; margin-top: -18px; margin-bottom: 8px; font-size: 14px">>> Postuler <<</a>
      ${content.join("")}
    </div>
  </div>
</div>
  `.replace(/\n/g, "");
}

function getClass(classe: Roster) {
  return `
<div class="recruit" style="line-height: 16px; margin-bottom: 2px;" title="${
    title[classe.prio]
  }">
  <small
    class="recruit-status other_text"
    style="float: right; color: #${colors[classe.prio]}; font-weight: bold;"
    >${capitalize(classe.prio)}</small
  >
  <div class="recruit-type">
    <div style="white-space:nowrap; vertical-align: middle; margin-right: 5px; max-width: 100%; height: auto; vertical-align: middle; border: 0;">
    ${
      classe.speIcon
        ? `
    <img
      alt="Spé ${classe.name}"
      style="width:12px; height:12px;"
      src="${classe.speIcon}"
    />`
        : `
    <img
      alt="blank"
      style="width:12px; height:12px;"
      src="https://i.imgur.com/duHQnZk.png"
    />`
    }
    <img
      alt="${classe.name}"
      src="http://cloudfront.shivtr.com/game_classes/${
        classe.shivtrIcon
      }/out.png"
    />&nbsp;${capitalize(
      classe.name
    )}<span style="color:#1D1D1D;font-size:1px;">&nbsp;${roster.indexOf(
    classe
  )}</span>
    </div>
  </div>
</div>
`;
}

export default function Roster() {
  const [currentRoster, setRoster] = useState<Roster[]>(roster);
  const [isTBC, setIsTBC] = useState(true);

  function loadFromSite() {
    try {
      const content = (document.getElementById(
        "loadFromSite"
      ) as HTMLTextAreaElement).value;

      const parts = content.split("\n").map(l => l.toLowerCase());
      const newRoster = [...currentRoster].map(r => {
        r.prio = "caché";
        return r;
      });
      let prioKeptValue: Prios = "";
      let isTBCtemp = false;
      parts.forEach(line => {
        if (line.includes("tbc")) {
          isTBCtemp = true;
          return;
        } else if (line.startsWith("recrut")) {
          return;
        } else if (line.includes("postule")) {
          return;
        } else if (!prioKeptValue) {
          prioKeptValue = line.trim() as Prios;
          return;
        } else {
          const indexToUpdate = Number(line.split(" ").pop());
          newRoster[indexToUpdate].prio = prioKeptValue;
          prioKeptValue = "";
          return;
        }
      });

      setIsTBC(isTBCtemp);
      setRoster(newRoster);
    } catch (e) {
      // tslint:disable-next-line:no-console
      console.log("not loaded");
    }
  }

  const output = [...currentRoster]
    .filter(r => r.prio !== "caché")
    .sort((a: Roster, b: Roster) => {
      return recrutement.indexOf(a.prio) < recrutement.indexOf(b.prio)
        ? -1
        : +1;
    })
    .map(getClass);

  const countPrio = [...currentRoster].reduce((sum, next) => {
    const add = next.prio === "" ? 0 : 1;
    return sum + add;
  }, 0);

  return (
    <div>
      <div>
        Vous pouvez charger le recrutement actuel depuis :{" "}
        <a target="_blank" href="http://awaken.se/">
          http://awaken.se/
        </a>
      </div>
      <textarea
        name=""
        id="loadFromSite"
        cols={60}
        rows={3}
        placeholder="copier ici le roster du site"
      />
      <br />
      <Button variant="outlined" onClick={() => loadFromSite()}>
        Charger depuis le site
      </Button>
      <br />
      <Checkbox
        checked={isTBC}
        onClick={() => {
          setIsTBC(!isTBC);
        }}
      />{" "}
      Pour TBC
      <br />
      <br />
      {currentRoster.map((classe: Roster, index: number) => {
        return (
          <div key={classe.name + index}>
            <div style={{ width: 140, display: "inline-block" }}>
              <img
                style={{ width: 18, height: 18 }}
                src={getClassImageUrl(classe.name)}
                alt=""
              />{" "}
              <img
                style={{ width: 18, height: 18 }}
                src={classe.speIcon}
                alt=""
              />
              &nbsp;&nbsp;
              {classe.name}:
            </div>
            {recrutement.map((prio: Prios) => (
              <span key={`${classe.name}-${index}-${prio}`}>
                <label>
                  <input
                    type="checkbox"
                    checked={classe.prio === prio}
                    onClick={() => {
                      currentRoster[index].prio = prio;
                      setRoster([...currentRoster]);
                    }}
                  />{" "}
                  {prio}
                </label>
              </span>
            ))}
          </div>
        );
      })}
      <br />
      <br />
      <br />
      {countPrio === roster.length && (
        <div>
          <textarea
            name="result"
            id="result"
            cols={150}
            rows={20}
            value={html(output, isTBC)}
          />
          <div>
            <Button
              variant="outlined"
              onClick={() => {
                (document.querySelector("#result") as any).select();
                document.execCommand("copy");
              }}
            >
              Copier
            </Button>
          </div>
        </div>
      )}
    </div>
  );
}
