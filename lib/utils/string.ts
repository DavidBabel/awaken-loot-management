export function normalizeText(str: string) {
  return str
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\-/g, " ")
    .replace(/\‘/g, " ")
    .toLowerCase();
}

export function normalizeTextWithStrip(str: string) {
  return normalizeText(str).replace(/\s/g, "");
}

export function stringToId(str: string) {
  return normalizeText(str)
    .replace(/\//g, "")
    .replace(/\s+/g, "-");
}

export function capitalizeFirstLetter(str: string) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}
