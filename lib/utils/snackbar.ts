import { snackbarService } from "uno-material-ui";

export function showInfoMessage(message: string) {
  snackbarService.showSnackbar(message, "info");
}
export function showSuccessMessage(message: string) {
  snackbarService.showSnackbar(message, "success");
}
export function showErrorMessage(message: string) {
  snackbarService.showSnackbar(message, "error");
}
