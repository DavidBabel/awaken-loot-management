import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Checkbox,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  Fab,
  FormControl,
  FormControlLabel,
  IconButton,
  LinearProgress,
  Snackbar,
  SnackbarContent
} from "@material-ui/core/";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { Add as AddIcon } from "@material-ui/icons";
import CloseIcon from "@material-ui/icons/Close";
import { ApolloQueryResult } from "apollo-boost";
import React, { useContext, useState } from "react";
import MemberContext from "../../lib/context/member";
import { BossItem, Mutation, Query } from "../../lib/generatedTypes";
import { CREATE_LOOT, CreateLootVariables } from "../../lib/gql/loot-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";
import { formatDate } from "../../lib/utils/date";
import CONFIG from "../../server/config";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    dialog: {
      [theme.breakpoints.down("sm")]: {
        "& .MuiDialog-paperWidthLg": {
          maxWidth: "1000px",
          width: "100%",
          margin: 0
        }
      }
    },
    lootInfoSelects: {
      display: "flex",
      justifyContent: "space-between",
      alignItems: "center"
    },
    dialogActions: {
      marginTop: 10
    },
    linearProgress: {
      marginBottom: 10
    }
  })
);

interface Props {
  raidId: number;
  bossId: number;
  bossName: string;
  bossItems: BossItem[];
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
  scrollDown: () => void;
}

export default function AddUnasignedDialog({
  raidId,
  bossId,
  bossName,
  bossItems,
  refetchOneRaid,
  scrollDown
}: Props) {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  const [open, setOpen] = useState<boolean>(false);
  const [itemsToAdd, setItemsToAdd] = useState<number[]>([]);
  const [addLootIsLoading, setAddLootIsLoading] = useState<boolean>(false);
  const [createLoot] = useMutation<Mutation, CreateLootVariables>(CREATE_LOOT);

  const {
    snackBarOpen,
    snackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    snackBarMessage
  } = useSnackBar();

  function handleOpen() {
    setOpen(true);
  }

  function handleClose() {
    setItemsToAdd([]);
    setOpen(false);
  }

  function addItemToList(item: number) {
    setItemsToAdd([...itemsToAdd, item]);
  }

  function removeItemFromList(item: number) {
    setItemsToAdd(itemsToAdd.filter(current => current !== item));
  }

  function addItems() {
    setAddLootIsLoading(true);
    Promise.all(
      itemsToAdd.map(itemIdToAdd =>
        createLoot({
          variables: {
            playerId: parseInt(CONFIG.ID_UNASSIGNED),
            itemId: itemIdToAdd,
            raidId,
            bossId,
            lastActionBy: member.name,
            lastActionType: "add",
            lastActionDate: formatDate()
          }
        })
      )
    )
      .then(() => {
        openSnackBar(`Objets ajoutés`, "success");
        setAddLootIsLoading(false);
        handleClose();
        refetchOneRaid()
          .then(() => {
            scrollDown();
          })
          .catch(err => {
            openSnackBar(err.message, "error");
          });
      })
      .catch(err => {
        openSnackBar(err.message, "error");
        setAddLootIsLoading(false);
      });
  }

  return (
    <div>
      <Fab size="small" color="secondary" aria-label="add" onClick={handleOpen}>
        <AddIcon />
      </Fab>
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
          {"Ajouter des loots non assignés sur: " + bossName}
        </DialogTitle>
        {addLootIsLoading && (
          <LinearProgress className={classes.linearProgress} variant="query" />
        )}
        <DialogContent className={classes.lootInfoSelects}>
          <FormControl>
            {bossItems.map(bossItem => {
              const itemId = bossItem.itemId;
              const checked = itemsToAdd.includes(itemId);
              let itemStyle = {
                margin: 1,
                borderLeft: "4px solid transparent"
              };
              if (bossItem.itemByItemId.classId) {
                const playerColor =
                  bossItem.itemByItemId.classId === 1
                    ? "grey"
                    : bossItem.itemByItemId.classByClassId.color;
                itemStyle = {
                  borderLeft: "solid 4px " + playerColor,
                  margin: 1
                };
              }
              return (
                <FormControlLabel
                  key={`item-lists-${bossName}-${itemId}`}
                  style={itemStyle}
                  control={
                    <Checkbox
                      checked={checked}
                      onChange={() =>
                        checked
                          ? removeItemFromList(itemId)
                          : addItemToList(itemId)
                      }
                      value={itemId}
                      color="primary"
                    />
                  }
                  label={bossItem.itemByItemId.name}
                />
              );
            })}
          </FormControl>
        </DialogContent>
        <DialogActions
          classes={{
            root: classes.dialogActions
          }}
        >
          <Button onClick={handleClose} color="primary">
            ANNULER
          </Button>
          <Button onClick={addItems} color="primary">
            AJOUTER TOUS
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
