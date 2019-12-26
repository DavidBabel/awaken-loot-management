import { format, parseISO } from "date-fns";
import { DATE_FORMAT } from "../../server/config";

export function formatDate(date: Date = new Date()) {
  return format(date, DATE_FORMAT);
}

export function getDayMonth(date: Date | string = new Date()) {
  return getDate(date, "dd/MM");
}

export function getDate(
  date: Date | string = new Date(),
  output = "dd/MM/yyyy"
) {
  const dateToTreat = typeof date === "string" ? date : formatDate(date);
  const finalDate = parseISO(dateToTreat);
  return format(finalDate, output);
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
