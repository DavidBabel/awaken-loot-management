export enum SubscribeStatus {
  NonInscrit,
  Present,
  Absent,
  PresentSiBesoin,
  Valide,
  EnRotation,
  SiBesoin
}

const subStatus = [
  {
    id: 0,
    label: "Non Inscrit"
  },
  {
    id: 1,
    label: "Disponible"
  },
  {
    id: 2,
    label: "Absent"
  },
  {
    id: 5,
    label: "Si besoin"
  },
  {
    id: 3,
    label: "Validé"
  },
  {
    id: 4,
    label: "En Rotation"
  },
  {
    id: 5,
    label: "Si besoin"
  }
];

export function getSubscribeLabel(status: SubscribeStatus) {
  return subStatus[status].label;
}

// export interface SubscribeStatus {
//   label: string;
//   key: string;
//   id: number;
//   color: string;

//   isSettable: boolean;
//   inLegend?: boolean;
// }

// export const subscribeStatus: SubscribeStatus[] = [
//   {
//     label: "Non inscrit",
//     key: "non_inscrit",
//     id: undefined,
//     color: "#106010",
//     isSettable: true
//   },
//   {
//     label: "Présent",
//     key: "present",
//     id: 0,
//     color: "#106010",
//     isSettable: true
//   },
//   {
//     label: "Absent",
//     key: "absent",
//     id: 1,
//     color: "#474747",
//     isSettable: false
//   },
//   {
//     label: "Validé",
//     key: "valide",
//     id: 2,
//     color: "#b00000",
//     isSettable: false
//   },
//   {
//     label: "En rotation/Backup",
//     key: "rotation",
//     id: 3,
//     color: "#b09000",
//     isSettable: true
//   }
// ];

// export function getRaidStatusKeyFromId(id: number) {
//   if (id === null) {
//     return "present";
//   }
//   return raidStatusList.find(status => status.id === id).key;
// }
