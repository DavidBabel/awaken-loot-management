import Emitter from "../emitter";

export function showInfoMessage(message: string) {
  Emitter.emit("snackbar", { message, action: "info" });
}
export function showSuccessMessage(message: string) {
  Emitter.emit("snackbar", { message, action: "sucess" });
}
export function showErrorMessage(message: string) {
  Emitter.emit("snackbar", { message, action: "info" });
}
