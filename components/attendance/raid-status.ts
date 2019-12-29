export interface RaidStatus {
  label: string;
  id: number;
  color: string;
  isSettable: boolean;
}

export const raidStatusList: RaidStatus[] = [
  {
    label: "Présent",
    id: 0,
    color: "#106010",
    isSettable: true
  },
  {
    label: "Absent",
    id: 1,
    color: "#b00000",
    isSettable: false
  },
  {
    label: "Présent dans un raid lié",
    id: 2,
    color: "#474747",
    isSettable: false
  },
  {
    label: "En rotation / Backup",
    id: 3,
    color: "#b09000",
    isSettable: true
  },
  {
    label: "Inscrit mais absent",
    id: 4,
    color: "#800080",
    isSettable: true
  },
  {
    label: "Pas encore en raid",
    id: 5,
    color: "#242424",
    isSettable: true
  }
];
