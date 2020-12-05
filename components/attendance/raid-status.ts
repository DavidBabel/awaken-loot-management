export type RaidStatusKey =
  | "present"
  | "absent"
  | "pasDansGuilde"
  | "inAnotherId"
  | "rotation"
  | "raidFutur"
  | "inscritAbsent";

export interface RaidStatus {
  label: string;
  key: RaidStatusKey;
  id: number;
  color: string;
  isSettable: boolean;
  inLegend?: boolean;
}

export const raidStatusList: RaidStatus[] = [
  {
    label: "Présent",
    key: "present",
    id: 0,
    color: "#106010",
    isSettable: true
  },
  {
    label: "Dans un raid lié",
    key: "inAnotherId",
    id: 1,
    color: "#474747",
    isSettable: false
  },
  {
    label: "Absent/Malade",
    key: "absent",
    id: 2,
    color: "#b00000",
    isSettable: false
  },
  {
    label: "En rotation/Backup",
    key: "rotation",
    id: 3,
    color: "#b09000",
    isSettable: true
  },
  {
    label: "Inscrit mais absent",
    key: "inscritAbsent",
    id: 4,
    color: "#800080",
    isSettable: true
  },
  {
    label: "Raid futur",
    key: "raidFutur",
    id: 4,
    color: "#3F51B5",
    isSettable: false
  },
  {
    label: "Pas encore en raid",
    key: "pasDansGuilde",
    id: 5,
    color: "#242424",
    isSettable: true,
    inLegend: false
  }
];

export function getRaidStatusKeyFromId(id: number) {
  if (id === null) {
    return "present";
  }
  return raidStatusList.find(status => status.id === id).key;
}
