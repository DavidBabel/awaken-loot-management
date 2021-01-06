const classColors = {
  ["Druide"]: "#FF7D0A",
  ["Chasseur"]: "#ABD473",
  ["Mage"]: "#69CCF0",
  ["Prêtre"]: "grey",
  ["Voleur"]: "rgb(255, 230, 0)",
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
  ["Prêtre"]: "rgb(255, 255, 255)",
  ["Prêtre Ombre"]: "rgb(255, 255, 255)"
};

export function getClassColor(classe: string, alternative: boolean = false) {
  // tslint:disable-next-line:no-console
  // console.log(classe);
  if (alternative) {
    return alternativeColor[classe];
  } else {
    return classColors[classe];
  }
}
