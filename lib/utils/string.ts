export function normalizeText(str: string) {
  return str
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/\-/g, " ")
    .toLowerCase();
}

export function stringToId(str: string) {
  return normalizeText(str)
    .replace(/\//g, "")
    .replace(/\s+/g, "-");
}
