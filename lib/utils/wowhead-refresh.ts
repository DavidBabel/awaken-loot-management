export function refreshWowhead() {
  if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
    try {
      window.$WowheadPower.refreshLinks();
    } catch (e) {}
  }
}
