import { IconButton, Snackbar, SnackbarContent } from "@material-ui/core";
import CloseIcon from "@material-ui/icons/Close";
import React, { useEffect, useState } from "react";
import Emitter from "../emitter";

interface SnackBarMessage {
  message: string;
  action: "info" | "success" | "error";
  open: boolean;
  id: number;
}

const AUTO_DISMISS = 4000;
let snackId = 0;

export function SnackbarContainer() {
  const [snackMessages, setSnackMessages] = useState<SnackBarMessage[]>([]);

  function grabMessage(payload: SnackBarMessage) {
    payload.id = snackId++;
    payload.open = true;
    const newMessages = [...snackMessages, payload];
    setSnackMessages(newMessages);
  }

  useEffect(() => {
    Emitter.on("snackbar", grabMessage);
    return () => {
      Emitter.off("snackbar", grabMessage);
    };
  });

  function closeSnackBar(id: number) {
    const newSnackMessages = snackMessages.filter(sm => sm.id !== id);
    setSnackMessages(newSnackMessages);
  }

  return (
    <>
      {snackMessages
        .filter(sm => sm.open)
        .map((snackMessage, i) => {
          const closeSnackBarEvent = (
            event: React.SyntheticEvent | React.MouseEvent,
            reason?: string
          ) => {
            if (reason === "clickaway") {
              return;
            }
            closeSnackBar(snackMessage.id);
          };

          const backgroundColor =
            snackMessage.action === "error" ? "#D32F2F" : "#43A047";

          return (
            <Snackbar
              key={`snackbars-alert-${i}`}
              anchorOrigin={{
                vertical: "bottom",
                horizontal: "center"
              }}
              open={snackMessage.open}
              autoHideDuration={AUTO_DISMISS}
              onClose={closeSnackBarEvent}
            >
              <SnackbarContent
                style={{ backgroundColor }}
                message={<span id="message-id">{snackMessage.message}</span>}
                action={[
                  <IconButton
                    key="close"
                    aria-label="close"
                    color="inherit"
                    onClick={closeSnackBarEvent}
                  >
                    <CloseIcon />
                  </IconButton>
                ]}
              />
            </Snackbar>
          );
        })}
    </>
  );
}
