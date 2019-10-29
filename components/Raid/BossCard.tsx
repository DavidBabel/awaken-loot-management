import { useMutation } from "@apollo/react-hooks";
import {
  Card,
  CardActions,
  CardContent,
  CardHeader,
  CardMedia,
  Fab,
  makeStyles
} from "@material-ui/core";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import IconButton from "@material-ui/core/IconButton";
import LinearProgress from "@material-ui/core/LinearProgress";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemSecondaryAction from "@material-ui/core/ListItemSecondaryAction";
import ListItemText from "@material-ui/core/ListItemText";
import Tooltip from "@material-ui/core/Tooltip";
import { Add as AddIcon } from "@material-ui/icons";
import DeleteForeverIcon from "@material-ui/icons/DeleteForever";
import Link from "next/link";
import { Dispatch, SetStateAction } from "react";
import {
  MutableRefObject,
  useContext,
  useEffect,
  useRef,
  useState
} from "react";
import MemberContext from "../../lib/context/member";
import { Boss, BossItem, Loot, Mutation } from "../../lib/generatedTypes";
import { UPDATE_LOOT } from "../../lib/gql/loot-mutations";
import { role } from "../../lib/role-level";

declare global {
  interface Window {
    $WowheadPower: any;
  }
}
interface UpdateLootVariables {
  id: number;
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
  confirmDeleteContent: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    "& a": {
      marginRight: 10
    }
  },
  linearProgress: {
    marginBottom: 10
  }
});

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots },
  donjonShortName,
  looted,
  openLootWindow,
  setDialogItems,
  openSnackBar
}: Boss & {
  donjonShortName: string;
  looted: Loot[];
  openLootWindow: (
    bossId: string,
    bossName: string,
    bossCardContentElem: MutableRefObject<any>
  ) => void;
  setDialogItems: Dispatch<SetStateAction<BossItem[]>>;
  openSnackBar: (msg: any, action: any) => void;
}) {
  const classes = useStyles("");
  const member = useContext(MemberContext);
  const bossCardContentElem = useRef(null);
  loots.sort((a, b) => (a.itemByItemId.name > b.itemByItemId.name ? 1 : -1));
  const [deleteLoot] = useMutation<Mutation, UpdateLootVariables>(UPDATE_LOOT);
  const [deleteLootConfirmOpen, setDeleteLootConfirmOpen] = useState<boolean>(
    false
  );
  const [currentLootToBeDeleted, setCurrentLootToBeDeleted] = useState<Loot>(
    null
  );
  const [deleteIsLoading, setDeleteIsLoading] = useState<boolean>(false);
  const openDeleteLootConfirm = (loot: Loot) => {
    setCurrentLootToBeDeleted(loot);
    setDeleteLootConfirmOpen(true);
    setTimeout(() => {
      if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
        try {
          window.$WowheadPower.refreshLinks();
        } catch (e) {}
      }
    }, 50);
  };
  const closeDeleteLootConfirm = () => {
    setDeleteLootConfirmOpen(false);
  };
  const confirmDeleteLoot = () => {
    setDeleteIsLoading(true);
    deleteLoot({
      variables: { id: currentLootToBeDeleted.id }
    })
      .then(resp => {
        openSnackBar("Loot supprimé avec succès", "success");
        setCurrentLootToBeDeleted(null);
        setDeleteLootConfirmOpen(false);
        setDeleteIsLoading(false);
      })
      .catch(err => {
        openSnackBar(err.message, "error");
        setCurrentLootToBeDeleted(null);
        setDeleteLootConfirmOpen(false);
        setDeleteIsLoading(false);
      });
  };
  useEffect(() => {
    if (window.$WowheadPower && window.$WowheadPower.refreshLinks) {
      try {
        window.$WowheadPower.refreshLinks();
      } catch (e) {}
    }
  }, [looted]);
  return (
    <>
      <Card className={classes.card}>
        <CardHeader className={classes.header} title={name} subheader="" />
        <CardMedia
          className={classes.media}
          image={`/img/boss/${donjonShortName}/${name
            .toLowerCase()
            .replace(/\s/g, "-")}.jpg`}
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
                      ? `Ajouté par ${loot.lastActionBy} le ${loot.lastActionDate}`
                      : ""
                  }
                  placement="left"
                >
                  <ListItem
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
                            openDeleteLootConfirm(loot);
                          }}
                        >
                          <DeleteForeverIcon />
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
            <Fab
              size="small"
              color="primary"
              aria-label="add"
              onClick={() => {
                setDialogItems(loots);
                openLootWindow(id.toString(), name, bossCardContentElem);
              }}
            >
              <AddIcon />
            </Fab>
          </CardActions>
        )}
      </Card>
      <Dialog
        open={deleteLootConfirmOpen}
        onClose={closeDeleteLootConfirm}
        aria-labelledby="alert-dialog-title"
        aria-describedby="Delete loot confirm window"
      >
        <DialogTitle id="alert-dialog-title">
          {"Êtes vous sûrs de vouloir supprimer ce loot?"}
        </DialogTitle>
        <DialogContent>
          {deleteIsLoading ? (
            <LinearProgress
              className={classes.linearProgress}
              variant="query"
            />
          ) : (
            ""
          )}
          <DialogContentText
            className={classes.confirmDeleteContent}
            id="alert-dialog-description"
          >
            {currentLootToBeDeleted ? (
              <>
                <a
                  onClick={e => {
                    e.preventDefault();
                  }}
                  href={`https://fr.classic.wowhead.com/item=${currentLootToBeDeleted.itemByItemId.wowheadId}`}
                >
                  {currentLootToBeDeleted.itemByItemId.name}
                </a>
                <span>
                  {"Attribué à " + currentLootToBeDeleted.playerByPlayerId.name}
                </span>
              </>
            ) : (
              ""
            )}
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={closeDeleteLootConfirm} color="primary">
            Annuler
          </Button>
          <Button onClick={confirmDeleteLoot} color="primary" autoFocus={true}>
            Confirmer
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}
