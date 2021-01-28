import { IconButton, Snackbar, SnackbarContent } from "@material-ui/core";
import CloseIcon from "@material-ui/icons/Close";
import React, {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useState
} from "react";

type SnackBarAction = "error" | "success";
interface SnackbarMessage {
  id: number;
  message: string;
  action: SnackBarAction;
  open: boolean;
}

export const SnackBarContext = createContext<{
  addSnackBar: (message: string, action: SnackBarAction) => void;
}>({} as any);

const AUTO_DISMISS = 5000;
let snackId = 0;

export function SnackBarProvider({ children }) {
  const [snackMessages, setSnackMessages] = useState<SnackbarMessage[]>([]);

  const activeAlertIds = snackMessages.map(sm => sm.message).join(",");
  useEffect(() => {
    let timer: NodeJS.Timeout;
    if (activeAlertIds.length > 0) {
      timer = setTimeout(
        () =>
          setSnackMessages(snackMessage =>
            snackMessage.slice(0, snackMessage.length - 1)
          ),
        AUTO_DISMISS
      );
    }
    return () => clearTimeout(timer);
  }, [activeAlertIds]);

  const addSnackBar = useCallback(
    (message: string, action: SnackBarAction = "success") => {
      setSnackMessages(snackMessage => [
        { id: snackId++, message, action, open: true },
        ...snackMessage
      ]);
    },
    []
  );

  function closeSnackBar(id: number) {
    const newSnackMessages = snackMessages.filter(sm => sm.id !== id);
    setSnackMessages(newSnackMessages);
  }

  return (
    <SnackBarContext.Provider value={{ addSnackBar }}>
      {children}
      {snackMessages.map((snackMessage, i) => {
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
              message={<span id="message-id">{alert}</span>}
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
    </SnackBarContext.Provider>
  );
}

export const useSnackBarsContext = () => useContext(SnackBarContext);
