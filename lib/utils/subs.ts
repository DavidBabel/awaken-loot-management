import { SubscribeStatus } from "../../components/subscribe/subscribe-status";
import { SubChange } from "../../pages/admin/raid";
import { classesPerRaid } from "../constants/classes";
import { Player, Raid } from "../generatedTypes";

export function hasSubMoved(
  subChanges: SubChange[],
  raid: Raid,
  player: Player
) {
  return Boolean(
    subChanges.find(sc => sc.player.id === player.id && sc.raid.id === raid.id)
  );
}

export function formatDatas(
  playerSubsRaw: Player[],
  displayedClasses: boolean[]
) {
  const playerSubs = playerSubsRaw.reduce(
    (previous, next) => {
      const currentStatus =
        next.raidPlayersSubsByPlayerId?.nodes[0]?.status ||
        SubscribeStatus.NonInscrit;
      previous[next.classByClassId.name][currentStatus].push(next);
      // david du futur si tu lis ce code, je suis désolé
      const classIndex = next.classByClassId.id;
      if (displayedClasses[classIndex]) {
        previous.counter.classes[classIndex] =
          classesPerRaid[next.classByClassId.name];
        previous.counter[currentStatus]++;
      }

      return previous;
    },
    {
      counter: {
        classes: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [SubscribeStatus.NonInscrit]: 0,
        [SubscribeStatus.Present]: 0,
        [SubscribeStatus.Absent]: 0,
        [SubscribeStatus.SiBesoin]: 0,
        [SubscribeStatus.Valide]: 0,
        [SubscribeStatus.EnRotation]: 0
      },
      Prêtre: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Mage: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Démoniste: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Voleur: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Druide: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Chasseur: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      Chaman: {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      "Guerrier Tank": {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      "Guerrier DPS": {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      "Prêtre Ombre": {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      "Druide Feral": {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      },
      "Chaman Amélio": {
        [SubscribeStatus.NonInscrit]: [],
        [SubscribeStatus.Present]: [],
        [SubscribeStatus.Absent]: [],
        [SubscribeStatus.SiBesoin]: [],
        [SubscribeStatus.Valide]: [],
        [SubscribeStatus.EnRotation]: []
      }
    }
  );
  return playerSubs;
}
