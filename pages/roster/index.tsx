import { Button } from "@material-ui/core";
import { useState } from "react";
import { getClassImageUrl } from "../../lib/utils/image";

type Prios = "prio" | "ouvert" | "faible" | "profil++";
interface Roster {
  name: string;
  shivtrIcon: string;
  prepend: string;
  prio: Prios | "";
}

const roster: Roster[] = [
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prepend: "H",
    prio: ""
  },
  { name: "Druide", shivtrIcon: "22", prepend: "R", prio: "" },
  { name: "Chaman", shivtrIcon: "18", prepend: "R", prio: "" },
  { name: "Mage", shivtrIcon: "19", prepend: "", prio: "" },
  {
    name: "Démoniste",
    shivtrIcon: "20",
    prepend: "",
    prio: ""
  },
  { name: "Voleur", shivtrIcon: "15", prepend: "", prio: "" },
  { name: "Chasseur", shivtrIcon: "14", prepend: "", prio: "" },
  {
    name: "Guerrier Tank",
    shivtrIcon: "12",
    prepend: "",
    prio: ""
  },
  {
    name: "Guerrier DPS",
    shivtrIcon: "17",
    prepend: "",
    prio: ""
  }
];

const recrutement: Array<Prios | ""> = ["prio", "ouvert", "faible", "profil++"];

const colors: { [key in Prios]: string } = {
  prio: "94ff6f",
  ouvert: "35cc00",
  faible: "acacac",
  ["profil++"]: "892602"
};

const title: { [key in Prios]: string } = {
  prio: "Recrutement prioritaire",
  ouvert: "Recrutement ouvert",
  faible: "Recrutement des derniers joueurs",
  ["profil++"]: "Profil de joueur exceptionnel uniquement"
};

function capitalize(str: string) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function html(content: string[]) {
  return `
<div class="inner_content">
  <div class="sc_padding">
    <div class="message">
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
    <div style="vertical-align: middle; margin-right: 5px; max-width: 100%; height: auto; vertical-align: middle; border: 0;">
    <img
      alt="Out"
      src="http://cloudfront.shivtr.com/game_classes/${
        classe.shivtrIcon
      }/out.png"
    />&nbsp;<b>${classe.prepend}</b>${capitalize(classe.name)}
  </div>
</div>
`;
}

export default function Roster() {
  const [currentRoster, setRoster] = useState<Roster[]>(roster);

  const output = [...currentRoster]
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
        Merci de vérifier l'état actuel du recrutement sur le site de guilde :{" "}
        <a href="http://awaken.se/">http://awaken.se/</a>
      </div>
      <br />
      {currentRoster.map((classe: Roster, index: number) => {
        return (
          <div key={classe.name}>
            <div style={{ width: 140, display: "inline-block" }}>
              <img
                style={{ width: 18, height: 18 }}
                src={getClassImageUrl(classe.name)}
                alt=""
              />{" "}
              {classe.name}:
            </div>
            {recrutement.map((prio: Prios) => (
              <span key={`${classe.name}-${prio}`}>
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
      {countPrio === 9 && (
        <div>
          <textarea
            name="result"
            id="result"
            cols={150}
            rows={20}
            value={html(output)}
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
