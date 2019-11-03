type Prios = "prio" | "ouvert" | "faible" | "fermé";
interface Roster {
  name: string;
  shivtrIcon: string;
  prepend: string;
  prio: Prios;
}

const roster: Roster[] = [
  {
    name: "Prêtre",
    shivtrIcon: "16",
    prepend: "H",
    prio: "ouvert"
  },
  { name: "Druide", shivtrIcon: "22", prepend: "R", prio: "prio" },
  { name: "Chaman", shivtrIcon: "18", prepend: "R", prio: "prio" },
  { name: "Mage", shivtrIcon: "19", prepend: "", prio: "faible" },
  { name: "Démoniste", shivtrIcon: "20", prepend: "", prio: "ouvert" },
  { name: "Voleur", shivtrIcon: "15", prepend: "", prio: "fermé" },
  { name: "Chasseur", shivtrIcon: "14", prepend: "", prio: "faible" },
  { name: "Guerrier Tank", shivtrIcon: "12", prepend: "", prio: "ouvert" },
  { name: "Guerrier DPS", shivtrIcon: "17", prepend: "", prio: "ouvert" }
];

const recrutement: Prios[] = ["prio", "ouvert", "faible", "fermé"];

const colors: { [key in Prios]: string } = {
  prio: "94ff6f",
  ouvert: "35cc00",
  faible: "acacac",
  fermé: "892602"
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
<div class="recruit" style="line-height: 16px; margin-bottom: 2px;">
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

const output = roster
  .sort((a: Roster, b: Roster) => {
    return recrutement.indexOf(a.prio) < recrutement.indexOf(b.prio) ? -1 : +1;
  })
  .map(getClass);

// tslint:disable-next-line:no-console
console.log(html(output));

export {};
