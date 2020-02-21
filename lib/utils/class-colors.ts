const classColors = {
  ["Druide"]: "#FF7D0A",
  ["Chasseur"]: "#ABD473",
  ["Mage"]: "#69CCF0",
  ["Prêtre"]: "grey",
  ["Voleur"]: "#FFF569",
  ["Chaman"]: "#0070DE",
  ["Démoniste"]: "#9482C9",
  ["Guerrier Tank"]: "#C79C6E",
  ["Guerrier DPS"]: "#C41F3B",
  ["Prêtre Ombre"]: "grey",
  ["Druide Feral"]: "#FF7D0A",
  ["Chaman Amélio"]: "#0070DE"
};

const alternativeColor = {
  ...classColors,
  ["Prêtre"]: "rgba(255,255,255)",
  ["Prêtre Ombre"]: "rgba(255,255,255)"
};

export function getClassColor(classe: string, alternative: boolean = false) {
  // tslint:disable-next-line:no-console
  console.log(classe);
  if (alternative) {
    return alternativeColor[classe];
  } else {
    return classColors[classe];
  }
}
