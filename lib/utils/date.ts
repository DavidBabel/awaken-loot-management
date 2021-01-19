import { differenceInCalendarDays, format, parseISO } from "date-fns";
import { fr } from "date-fns/locale";
import { DATE_FORMAT } from "../../server/config";

export function formatDate(date: Date = new Date()) {
  return format(date, DATE_FORMAT);
}

export function getDayMonth(date: Date | string = new Date()) {
  if (date === "Aucun") {
    return "Aucun";
  }
  return getDate(date, "dd/MM");
}

export function getDate(
  date: Date | string = new Date(),
  output = "dd/MM/yyyy"
) {
  const dateToTreat = typeof date === "string" ? date : formatDate(date);
  const finalDate = parseISO(dateToTreat);
  return format(finalDate, output, { locale: fr });
}

export function getDateText(date: Date | string = new Date()) {
  return getDate(date, "EEEE d MMMM");
}
export function getDateTextYear(date: Date | string = new Date()) {
  return getDate(date, "EEEE d MMMM yyyy");
}

export function getCurrentYear() {
  return new Date().getFullYear();
}

export function getDurationBetween(
  date1: string,
  date2: string,
  durationFormat: "D" | "H" | "S" = "D"
): number {
  const durationTimestamp =
    Date.parse(date1) - Date.parse(date2) > 0
      ? Date.parse(date1) - Date.parse(date2)
      : Date.parse(date2) - Date.parse(date1);
  return durationFormat === "D"
    ? Math.floor(durationTimestamp / 1000 / 60 / 24 / 60)
    : durationFormat === "H"
    ? Math.floor(durationTimestamp / 1000 / 60 / 24)
    : durationFormat === "S"
    ? Math.floor(durationTimestamp / 1000 / 60)
    : 0;
}

export function getRaidDateInfos(raidDate: string) {
  const raidDateD = parseISO(raidDate);
  const inDays = differenceInCalendarDays(raidDateD, new Date());
  const isPast = inDays < 0;
  const locked = inDays <= 2;
  const plural = inDays > 1 || inDays < -1 ? "s" : "";
  const dateText = format(raidDateD, "EEEE dd MMMM", { locale: fr });
  const dayText =
    inDays === 0
      ? "Aujourd'hui"
      : isPast
      ? `Il y a ${String(inDays).replace("-", "")} jour${plural}`
      : `Dans ${inDays} jour${plural}`;

  const longDateText = `Le ${dateText} (${dayText})`;

  return {
    inDays,
    isPast,
    locked,
    dayText,
    dateText,
    longDateText
  };
}
