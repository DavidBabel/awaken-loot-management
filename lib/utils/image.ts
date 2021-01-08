export function getClassImageUrl(className: string) {
  const classIcons = {
    Prêtre: "https://i.imgur.com/jzdbh7x.jpg",
    Mage: "https://i.imgur.com/gGqRnTG.jpg",
    Démoniste: "https://i.imgur.com/dQQEbVF.jpg",
    Voleur: "https://i.imgur.com/XQXIauj.jpg",
    Druide: "https://i.imgur.com/9Tbuzod.jpg",
    Chasseur: "https://i.imgur.com/ZN9MWW8.jpg",
    Chaman: "https://i.imgur.com/Pzt7jF3.jpg",
    "Guerrier Tank": "https://i.imgur.com/ZESKCnu.jpg",
    "Guerrier DPS": "https://i.imgur.com/3d2GCGF.jpg",
    Paladin: "https://i.imgur.com/0ZZyrkG.jpg",
    "Prêtre Ombre": "https://i.imgur.com/ZTGeN3S.jpg",
    "Druide Feral": "https://i.imgur.com/x4tc57M.jpg",
    "Chaman Amélio": "https://i.imgur.com/n1DjsUN.jpg"
  };
  return classIcons[className];

  // return `/img/class/${className
  //   .replace(/\s/g, "-")
  //   .replace("é", "e")
  //   .replace("ê", "e")}.jpg`;
}

export function getDonjonImageUrl(donjonName: string) {
  return `/img/donjon/${donjonName
    .toLowerCase()
    .replace("‘", "-")
    .replace("'", "-")
    .replace(/\s/g, "-")}.jpg`;
}

export function getDonjonIconUrl(donjonName: string) {
  return `/img/donjon/icons/${donjonName
    .toLowerCase()
    .replace("‘", "-")
    .replace("'", "-")
    .replace(/\s/g, "-")}.png`;
}

export function getBossImageUrl(donjonShortname: string, bossName: string) {
  return `/img/boss/${donjonShortname}/${bossName
    .toLowerCase()
    .replace("‘", "-")
    .replace("'", "-")
    .replace(/\s/g, "-")}.jpg`;
}
