import { format, parseISO } from "date-fns";
import { DATE_FORMAT } from "../../server/config";

export function formatDate(date: Date = new Date()) {
  return format(date, DATE_FORMAT);
}

export function getDate(date: Date | string) {
  const dateToTreat = typeof date === "string" ? date : formatDate(date);
  const finalDate = parseISO(dateToTreat);
  return format(finalDate, "dd/MM/yyyy");
}

export function getCurrentYear() {
  return new Date().getFullYear();
}
