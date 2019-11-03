import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Slide from "@material-ui/core/Slide";
import { makeStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import Link from "next/link";
import { forwardRef } from "react";
import { RaidPlayer } from "../../lib/generatedTypes";
import ClassAvatar from "../ClassAvatar";

const useStyles = makeStyles({
  root: {
    margin: 5,
    textAlign: "center"
  },
  listRoot: {
    display: "flex",
    justifyContent: "center"
  },
  column: {
    width: 120,
    padding: 5,
    display: "flex",
    flexDirection: "column",
    backgroundColor: "#242424",
    "& a": {
      textDecoration: "none",
      padding: 2
    },
    "& a:hover": {
      backgroundColor: "#3F51B5"
    }
  }
});
// tslint:disable-next-line:no-shadowed-variable
const Transition = forwardRef<unknown, TransitionProps>(function Transition(
  props,
  ref
) {
  return <Slide direction="up" ref={ref} {...props} />;
});

interface Props {
  open: boolean;
  handleClose: () => void;
  players: RaidPlayer[];
}

export default function PlayerList({ open, handleClose, players }: Props) {
  const classes = useStyles("");

  function displayClass(className: string, allPlayers: RaidPlayer[]) {
    const classPlayers = allPlayers.filter(
      player => player.playerByPlayerId.classByClassId.name === className
    );

    return (
      <div className={classes.column}>
        <ClassAvatar playerClass={className} />
        {classPlayers.map((player: RaidPlayer) => (
          <Link
            key={player.playerByPlayerId.name}
            href="/player/view/[id]"
            as={`/player/view/${player.playerByPlayerId.id}`}
          >
            <a
              target="_blank"
              style={{
                color: player.playerByPlayerId.classByClassId.color
              }}
            >
              {player.playerByPlayerId.name}
            </a>
          </Link>
        ))}
      </div>
    );
  }

  return (
    <Dialog
      className={classes.root}
      fullWidth={true}
      maxWidth={"lg"}
      open={open}
      TransitionComponent={Transition}
      keepMounted={true}
      onClose={handleClose}
      aria-labelledby="alert-dialog-slide-title"
      aria-describedby="alert-dialog-slide-description"
    >
      <DialogTitle id="alert-dialog-slide-title">
        {"Joueurs ayant participé à ce raid:"}
      </DialogTitle>
      <DialogContent>
        <div className={classes.listRoot}>
          {displayClass("Prêtre", players)}
          {displayClass("Mage", players)}
          {displayClass("Démoniste", players)}
          {displayClass("Voleur", players)}
          {displayClass("Druide", players)}
          {displayClass("Chasseur", players)}
          {displayClass("Chaman", players)}
          {displayClass("Guerrier Tank", players)}
          {displayClass("Guerrier DPS", players)}
        </div>
      </DialogContent>
      <DialogActions>
        <Button onClick={handleClose} color="primary">
          Fermer
        </Button>
      </DialogActions>
    </Dialog>
  );
}
