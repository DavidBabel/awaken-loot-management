export function isProduction() {
  const host = "awaken-loot-management.herokuapp.com";
  if (typeof window !== "undefined") {
    return window.location.href.includes(host);
  } else {
    return false;
  }
}
