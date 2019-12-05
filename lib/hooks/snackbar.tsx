import { IconButton, Snackbar, SnackbarContent } from "@material-ui/core";
import CloseIcon from "@material-ui/icons/Close";
import { Dispatch, SetStateAction, useState } from "react";

export function useSnackBar(): {
  snackBarOpen: boolean;
  setSnackBarOpen: Dispatch<SetStateAction<boolean>>;
  snackBarMessage: string;
  setSnackBarMessage: Dispatch<SetStateAction<string>>;
  snackBarBackgroundColor: string;
  setSnackBarBackgroundColor: Dispatch<SetStateAction<string>>;
  openSnackBar: (msg: string, action: "error" | "success") => void;
  closeSnackBar: (
    event: React.SyntheticEvent | React.MouseEvent,
    reason?: string
  ) => void;
  DefaultSnackBar: React.ReactNode;
} {
  const [snackBarOpen, setSnackBarOpen] = useState<boolean>(false);
  const [snackBarMessage, setSnackBarMessage] = useState<string>("");
  const [snackBarBackgroundColor, setSnackBarBackgroundColor] = useState<
    string
  >("#D32F2F");
  const openSnackBar = (msg: string, action: "error" | "success") => {
    if (action === "error") {
      setSnackBarBackgroundColor("#D32F2F");
    } else {
      setSnackBarBackgroundColor("#43A047");
    }
    setSnackBarMessage(msg);
    setSnackBarOpen(true);
  };

  const closeSnackBar = (
    event: React.SyntheticEvent | React.MouseEvent,
    reason?: string
  ) => {
    if (reason === "clickaway") {
      return;
    }
    setSnackBarOpen(false);
  };

  function DefaultSnackBar() {
    return (
      <Snackbar
        anchorOrigin={{
          vertical: "bottom",
          horizontal: "center"
        }}
        open={snackBarOpen}
        autoHideDuration={3000}
        onClose={closeSnackBar}
      >
        <SnackbarContent
          style={{ backgroundColor: snackBarBackgroundColor }}
          message={<span id="message-id">{snackBarMessage}</span>}
          action={[
            <IconButton
              key="close"
              aria-label="close"
              color="inherit"
              onClick={closeSnackBar}
            >
              <CloseIcon />
            </IconButton>
          ]}
        />
      </Snackbar>
    );
  }

  return {
    snackBarOpen,
    setSnackBarOpen,
    snackBarMessage,
    setSnackBarMessage,
    snackBarBackgroundColor,
    setSnackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    DefaultSnackBar: <DefaultSnackBar />
  };
}
