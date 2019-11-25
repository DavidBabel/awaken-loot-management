import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Card,
  CardActions,
  CardContent,
  CardHeader,
  CardMedia,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  IconButton,
  LinearProgress,
  List,
  ListItem,
  ListItemSecondaryAction,
  ListItemText,
  makeStyles,
  Snackbar,
  SnackbarContent,
  Tooltip
} from "@material-ui/core";
import CachedIcon from "@material-ui/icons/Cached";
import CloseIcon from "@material-ui/icons/Close";
import DeleteForeverIcon from "@material-ui/icons/DeleteForever";
import { ApolloQueryResult } from "apollo-boost";
import Link from "next/link";
import { useContext, useEffect, useRef, useState } from "react";
import AddLootDialog from "../../components/Raid/AddLootDialog";
import MemberContext from "../../lib/context/member";
import { Boss, Loot, Mutation, Player, Query } from "../../lib/generatedTypes";
import { UPDATE_LOOT } from "../../lib/gql/loot-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";
import { role } from "../../lib/role-level";
import { formatDate } from "../../lib/utils/date";
import { getBossImageUrl } from "../../lib/utils/image";
import { refreshWowhead } from "../../lib/utils/wowhead-refresh";

declare global {
  interface Window {
    $WowheadPower: any;
  }
}
interface UpdateLootVariables {
  id: number;
  active: boolean;
  lastActionBy: string;
  lastActionDate: string;
  actionType: string;
}
const useStyles = makeStyles({
  card: {
    position: "relative",
    width: 500,
    maxHeight: 600,
    margin: "10px",
    backgroundColor: "white",
    paddingBottom: "40px",
    boxShadow: "0 0 20px 0 rgba(0,0,0,0.35)"
  },
  header: {
    position: "absolute",
    top: "0px",
    backgroundColor: "#F50057",
    color: "white",
    zIndex: 2,
    padding: "5px 15px",
    borderBottomRightRadius: "10px"
  },
  media: {
    height: 180,
    clipPath: "polygon(0 0, 100% 0, 100% 79%, 0% 100%)"
  },
  cardContent: {
    maxHeight: 300,
    height: "auto",
    overflow: "auto"
  },
  cardActions: {
    position: "absolute",
    bottom: 0,
    right: 10,
    margin: "auto"
  },
  itemCell: {
    width: 240,
    whiteSpace: "nowrap",
    lineHeight: "44px",
    overflow: "hidden",
    "& a": {
      textDecoration: "none"
    },
    "& a span:nth-child(1)": {
      margin: "0px 5px 0px 0px"
    }
  },
  playerCell: {
    width: 120,
    lineHeight: "44px",
    margin: "0px 10px",
    textAlign: "center",
    backgroundColor: "#F5F5F5",
    border: "1px solid",
    borderRadius: "4px",
    overflow: "hidden",
    boxShadow: "0 0 20px 0 rgba(0,0,0,0.25)"
  },
  confirmUpdateContent: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    "& a": {
      marginRight: 10
    }
  },
  linearProgress: {
    marginBottom: 10
  },
  lootDeleted: {
    backgroundColor: "rgba(0,0,0,0.2)"
  }
});

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots },
  donjonShortName,
  looted,
  raidId,
  refetchOneRaid,
  refetchAllPlayers,
  allPlayers,
  cdnImage
}: Boss & {
  donjonShortName: string;
  looted: Loot[];
  raidId: number;
  allPlayers: Player[];
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
}) {
  const classes = useStyles("");
  const member = useContext(MemberContext);
  const bossCardContentElem = useRef(null);
  loots.sort((a, b) => (a.itemByItemId.name > b.itemByItemId.name ? 1 : -1));
  const [updateLoot] = useMutation<Mutation, UpdateLootVariables>(UPDATE_LOOT);
  const [updateLootConfirm, setUpdateLootConfirm] = useState<boolean>(false);
  const [currentLootToBeUpdated, setCurrentLootToBeUpdated] = useState<{
    loot: Loot;
    actionType: string;
  }>(null);
  const [updateLootIsLoading, setUpdateLootIsLoading] = useState<boolean>(
    false
  );
  const {
    snackBarOpen,
    snackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    snackBarMessage
  } = useSnackBar();

  const openUpdateLootConfirm = (loot: Loot, actionType: string) => {
    setCurrentLootToBeUpdated({ loot, actionType });
    setUpdateLootConfirm(true);
    setTimeout(() => {
      if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
        try {
          window.$WowheadPower.refreshLinks();
        } catch (e) {}
      }
    }, 50);
  };
  const closeUpdateLootConfirm = () => {
    setUpdateLootConfirm(false);
  };
  const confirmUpdateLoot = () => {
    setUpdateLootIsLoading(true);
    updateLoot({
      variables: {
        id: currentLootToBeUpdated.loot.id,
        active: currentLootToBeUpdated.actionType === "restore" ? true : false,
        lastActionBy: member.name,
        lastActionDate: formatDate(),
        actionType: currentLootToBeUpdated.actionType
      }
    })
      .then(resp => {
        openSnackBar(
          "Loot " +
            (currentLootToBeUpdated.actionType === "delete"
              ? "supprimé"
              : "ajouté") +
            " avec succès",
          "success"
        );
        setCurrentLootToBeUpdated(null);
        setUpdateLootConfirm(false);
        setUpdateLootIsLoading(false);
      })
      .catch(err => {
        openSnackBar(err.message, "error");
        setCurrentLootToBeUpdated(null);
        setUpdateLootConfirm(false);
        setUpdateLootIsLoading(false);
      });
  };
  const scrollDown = () => {
    if (bossCardContentElem) {
      if (bossCardContentElem.current.scrollBy) {
        bossCardContentElem.current.scrollBy({
          top: bossCardContentElem.current.scrollHeight,
          left: 0,
          behavior: "smooth"
        });
      } else {
        bossCardContentElem.current.scrollTop =
          bossCardContentElem.current.offsetHeight;
      }
    }
  };
  useEffect(refreshWowhead, [looted]);
  return (
    <>
      <Card className={classes.card}>
        <CardHeader className={classes.header} title={name} subheader="" />
        <CardMedia
          className={classes.media}
          image={cdnImage || getBossImageUrl(donjonShortName, name)}
          title={name}
        />
        <CardContent className={classes.cardContent} ref={bossCardContentElem}>
          <List>
            {looted.map((loot, index) => {
              return (
                <Tooltip
                  key={
                    loot.itemByItemId.id +
                    loot.playerByPlayerId.id +
                    index.toString()
                  }
                  title={
                    loot.lastActionBy && loot.lastActionDate
                      ? `${
                          loot.lastActionType === "delete"
                            ? "Supprimé"
                            : loot.lastActionType === "restore"
                            ? "Restauré"
                            : "Ajouté"
                        } par ${loot.lastActionBy} le ${loot.lastActionDate}`
                      : ""
                  }
                  placement="left"
                >
                  <ListItem
                    className={
                      loot.lastActionType === "delete"
                        ? classes.lootDeleted
                        : ""
                    }
                    divider={true}
                    role={undefined}
                    alignItems="flex-start"
                  >
                    <ListItemText className={classes.itemCell}>
                      <a
                        onClick={e => {
                          e.preventDefault();
                        }}
                        href={`https://fr.classic.wowhead.com/item=${loot.itemByItemId.wowheadId}`}
                      >
                        {loot.itemByItemId.name}
                      </a>
                    </ListItemText>
                    <ListItemText
                      style={{
                        borderColor:
                          loot.playerByPlayerId.classByClassId.id !== 1
                            ? loot.playerByPlayerId.classByClassId.id !== 4
                              ? loot.playerByPlayerId.classByClassId.color
                              : "#d4d000"
                            : "grey"
                      }}
                      className={classes.playerCell}
                      primary={
                        <Link
                          href="/player/view/[id]"
                          as={`/player/view/${loot.playerByPlayerId.id}`}
                        >
                          <a
                            target="_blank"
                            style={{
                              color:
                                loot.playerByPlayerId.classByClassId.id !== 1
                                  ? loot.playerByPlayerId.classByClassId.id !==
                                    4
                                    ? loot.playerByPlayerId.classByClassId.color
                                    : "#d4d000"
                                  : "grey",
                              textDecoration: "none"
                            }}
                          >
                            {loot.playerByPlayerId.name}
                          </a>
                        </Link>
                      }
                    />
                    {member.level >= role.officer && (
                      <ListItemSecondaryAction>
                        <IconButton
                          edge="end"
                          aria-label="comments"
                          onClick={() => {
                            openUpdateLootConfirm(
                              loot,
                              loot.lastActionType === "delete"
                                ? "restore"
                                : "delete"
                            );
                          }}
                        >
                          {loot.lastActionType === "delete" ? (
                            <CachedIcon />
                          ) : (
                            <DeleteForeverIcon />
                          )}
                        </IconButton>
                      </ListItemSecondaryAction>
                    )}
                  </ListItem>
                </Tooltip>
              );
            })}
          </List>
        </CardContent>
        {member.level >= role.officer && (
          <CardActions disableSpacing={true} className={classes.cardActions}>
            <AddLootDialog
              allPlayers={allPlayers}
              raidId={raidId}
              bossId={id}
              bossName={name}
              loots={loots}
              refetchOneRaid={refetchOneRaid}
              refetchAllPlayers={refetchAllPlayers}
              scrollDown={scrollDown}
            />
          </CardActions>
        )}
      </Card>
      <Dialog
        open={updateLootConfirm}
        onClose={closeUpdateLootConfirm}
        aria-labelledby="alert-dialog-title"
        aria-describedby="Delete loot confirm window"
      >
        <DialogTitle id="alert-dialog-title">
          {"Êtes vous sûrs de vouloir " +
            (currentLootToBeUpdated &&
            currentLootToBeUpdated.actionType === "delete"
              ? "supprimer"
              : "restaurer") +
            " ce loot?"}
        </DialogTitle>
        <DialogContent>
          {updateLootIsLoading ? (
            <LinearProgress
              className={classes.linearProgress}
              variant="query"
            />
          ) : (
            ""
          )}
          <DialogContentText
            className={classes.confirmUpdateContent}
            id="alert-dialog-description"
          >
            {currentLootToBeUpdated ? (
              <>
                <a
                  onClick={e => {
                    e.preventDefault();
                  }}
                  href={`https://fr.classic.wowhead.com/item=${currentLootToBeUpdated.loot.itemByItemId.wowheadId}`}
                >
                  {currentLootToBeUpdated.loot.itemByItemId.name}
                </a>
                <span>
                  {"Attribué à " +
                    currentLootToBeUpdated.loot.playerByPlayerId.name}
                </span>
              </>
            ) : (
              ""
            )}
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={closeUpdateLootConfirm} color="primary">
            Annuler
          </Button>
          <Button onClick={confirmUpdateLoot} color="primary" autoFocus={true}>
            Confirmer
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
    </>
  );
}
