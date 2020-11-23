export function getClassImageUrl(className: string) {
  return `/img/class/${className
    .replace(/\s/g, "-")
    .replace("é", "e")
    .replace("ê", "e")}.jpg`;
}

export function getDonjonImageUrl(donjonName: string) {
  return `/img/donjon/${donjonName
    .toLowerCase()
    .replace("‘", "-")
    .replace(/\s/g, "-")}.jpg`;
}

export function getDonjonIconUrl(donjonName: string) {
  return `/img/donjon/icons/${donjonName
    .toLowerCase()
    .replace("‘", "-")
    .replace(/\s/g, "-")}.png`;
}

export function getBossImageUrl(donjonShortname: string, bossName: string) {
  return `/img/boss/${donjonShortname}/${bossName
    .toLowerCase()
    .replace(/\s/g, "-")}.jpg`;
}
