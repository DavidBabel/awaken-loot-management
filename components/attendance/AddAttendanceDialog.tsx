import React from "react";

import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  IconButton,
  InputLabel,
  LinearProgress,
  MenuItem,
  Select,
  Snackbar,
  SnackbarContent
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import CloseIcon from "@material-ui/icons/Close";
import ForwardIcon from "@material-ui/icons/Forward";

import CONFIG from "../../server/config";

// const useStyles = makeStyles((theme: Theme) =>
//   createStyles({
//     dialog: {
//       [theme.breakpoints.down("sm")]: {
//         "& .MuiDialog-paperWidthLg": {
//           maxWidth: "1000px",
//           width: "100%",
//           margin: 0
//         }
//       }
//     }
//   })
// );

export default function AddLootDialog({}: {}) {
  return (
    <div>
      <Dialog
        className={classes.dialog}
        maxWidth={"lg"}
        open={open}
        keepMounted={true}
        onClose={handleClose}
        aria-labelledby="add-loot-dialog"
        aria-describedby="add loot window"
      >
        <DialogTitle id="add-loot-dialog">
          {"Ajouter un loot sur: " + bossName}
        </DialogTitle>
        {addLootIsLoading && (
          <LinearProgress className={classes.linearProgress} variant="query" />
        )}
        <DialogContent className={classes.lootInfoSelects}>
          <FormControl>
            <InputLabel htmlFor="demo-controlled-open-select">Item</InputLabel>
            <Select
              className={classes.selectItem}
              open={selectItemOpened}
              onClose={handleCloseSelectItem}
              onOpen={handleOpenSelectItem}
              value={itemIdToAdd}
              onChange={handleChangeSelectItem}
            >
              {loots.map(item => {
                let itemStyle = {
                  margin: 2,
                  borderLeft: "4px solid transparent"
                };

                if (item.itemByItemId.classId) {
                  const playerColor =
                    item.itemByItemId.classId === 1
                      ? "grey"
                      : item.itemByItemId.classByClassId.color;
                  itemStyle = {
                    borderLeft: "solid 4px " + playerColor,
                    margin: 2
                  };
                }

                return (
                  <MenuItem
                    key={`loot-list-${item.itemByItemId.id}`}
                    style={itemStyle}
                    value={item.itemByItemId.id}
                  >
                    {item.itemByItemId.name}
                  </MenuItem>
                );
              })}
            </Select>
          </FormControl>

          <ForwardIcon color="primary" className={classes.fleche} />
        </DialogContent>

        <DialogActions
          classes={{
            root: classes.dialogActions
          }}
        >
          <Button onClick={handleClose} color="primary">
            ANNULER
          </Button>
          <Button onClick={() => addLoot(CONFIG.ID_UNASSIGNED)} color="primary">
            AJOUT NON ASSIGNÉ
          </Button>
        </DialogActions>
      </Dialog>
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
    </div>
  );
}
