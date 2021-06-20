import { wowClasses } from "../constants/classes";

export function getClassImageUrl(className: string) {
  const currentClasse = wowClasses.find(wc => wc.name.startsWith(className));
  return currentClasse?.icon || "";
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
