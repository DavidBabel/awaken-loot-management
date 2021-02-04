import { wowClasses } from "../constants/classes";

export function getClassImageUrl(className: string) {
  if (className === "Paladin") {
    return "https://i.imgur.com/0ZZyrkG.jpg";
  }
  const currentClasse = wowClasses.find(wc => wc.name === className);
  return currentClasse.icon;
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
