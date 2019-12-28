export function refreshWowhead() {
  try {
    window.$WowheadPower.refreshLinks();
  } catch (e) {}
}
