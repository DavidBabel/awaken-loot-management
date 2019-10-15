import { RaidPlayer } from "../generatedTypes";

export function raidPlayerByClass(player1: RaidPlayer, player2: RaidPlayer) {
  const p1Class = player1.playerByPlayerId.classByClassId.id;
  const p2Class = player2.playerByPlayerId.classByClassId.id;
  if (p1Class === p2Class) {
    return player1.playerByPlayerId.name < player2.playerByPlayerId.name
      ? -1
      : 1;
  }
  return p1Class - p2Class;
}

export function byDate(accessor: string, orderDesc: boolean = true) {
  return (a: any, b: any) => {
    if (
      new Date(a[accessor]) > new Date(b[accessor]) ||
      a[accessor] === "Aucun"
    ) {
      return orderDesc ? -1 : 1;
    }
    if (
      new Date(b[accessor]) > new Date(a[accessor]) ||
      b[accessor] === "Aucun"
    ) {
      return orderDesc ? 1 : -1;
    }
    return 0;
  };
}

export function byValue(accessor: string, orderDesc: boolean = true) {
  return (a: any, b: any) =>
    orderDesc ? a[accessor] - b[accessor] : b[accessor] - a[accessor];
}
export function byAlphabet(accessor: string, orderDesc: boolean = true) {
  return (a: any, b: any) =>
    orderDesc
      ? a[accessor] > b[accessor]
        ? -1
        : 1
      : a[accessor] > b[accessor]
      ? 1
      : -1;
}
