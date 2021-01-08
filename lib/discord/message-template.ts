import {
  getSubscribeLabel,
  SubscribeStatus
} from "../../components/subscribe/subscribe-status";
import CONFIG from "../../server/config";
import { Raid } from "../generatedTypes";
import { getRaidDateInfos } from "../utils/date";

export function discordMessageSubMember(
  raid: Raid,
  playerName: string,
  status: SubscribeStatus
) {
  const { dateText } = getRaidDateInfos(raid.date);
  return `
    Ton inscription **"${getSubscribeLabel(
      status
    )}"** au raid du ${dateText} à **${
    raid.donjonByDonjonId.name
  }** à été prise en compte.
  `.trim();
}

export function discordMessageChangedMember(
  raid: Raid,
  playerName: string,
  status: SubscribeStatus
) {
  const { dateText } = getRaidDateInfos(raid.date);
  if (status === SubscribeStatus.EnRotation) {
    return `
    Ton MDC t'a mis ${getSubscribeLabel(
      status
    ).toLowerCase()} pour le raid du ${dateText} à **${
      raid.donjonByDonjonId.name
    }**. Voir : ${CONFIG.SERVER_URL}/player/raid.
  `.trim();
  } else if (status === SubscribeStatus.Valide) {
    return `
      Ton MDC a **${getSubscribeLabel(
        status
      ).toLowerCase()}** ta participation au raid du ${dateText} à **${
      raid.donjonByDonjonId.name
    }**. Voir : ${CONFIG.SERVER_URL}/player/raid.
    `.trim();
  } else if (status === SubscribeStatus.Present) {
    return `
      Ton MDC t'a ajouté comme ${getSubscribeLabel(
        status
      ).toLowerCase()} au raid du ${dateText} à **${
      raid.donjonByDonjonId.name
    }**. Voir : ${CONFIG.SERVER_URL}/player/raid.
      Si ce n'est pas toi qui lui a demandé, contacte le rapidement.
    `.trim();
  } else if (status === SubscribeStatus.Absent) {
    return `
      Ton MDC t'a ajouté comme ${getSubscribeLabel(
        status
      ).toLowerCase()} au raid du ${dateText} à **${
      raid.donjonByDonjonId.name
    }**. Voir : ${CONFIG.SERVER_URL}/player/raid.
      Si ce n'est pas toi qui lui a demandé, contacte le rapidement.
    `.trim();
  }
  return "";
}

export function discordMessageSubMDC(
  raid: Raid,
  playerName: string,
  status: SubscribeStatus
) {
  const { dateText } = getRaidDateInfos(raid.date);
  return `
    **${playerName}** vient de s'inscrire **"${getSubscribeLabel(
    status
  )}"** au raid du ${dateText} à **${raid.donjonByDonjonId.name}**. Voir: ${
    CONFIG.SERVER_URL
  }/admin/raid.
  `.trim();
}
