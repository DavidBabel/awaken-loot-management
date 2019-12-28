const classColors = {
  ["Druide"]: "rgba(255,125,10)",
  ["Chasseur"]: "rgba(171,212,115)",
  ["Mage"]: "rgba(105,204,240)",
  ["Prêtre"]: "rgba(255,255,255)",
  ["Voleur"]: "rgba(255,245,105)",
  ["Chaman"]: "rgba(0,112,222)",
  ["Démoniste"]: "rgba(148,130,201)",
  ["Guerrier Tank"]: "rgba(199,156,110)",
  ["Guerrier DPS"]: "#C41F3B"
};

const alternativeColor = {
  ...classColors,
  ["Prêtre"]: "rgba(255,255,255)"
};

export function getClassColor(classe: string, alternative: boolean = false) {
  if (alternative) {
    return alternativeColor[classe];
  } else {
    return classColors[classe];
  }
}
