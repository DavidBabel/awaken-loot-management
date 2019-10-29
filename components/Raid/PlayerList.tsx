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

export default function PlayerList({ open, handleClose, players }) {
  const classes = useStyles("");
  const pretres = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 1
  );
  const mages = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 2
  );
  const demonistes = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 3
  );
  const voleurs = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 4
  );
  const druides = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 5
  );
  const chasseurs = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 6
  );
  const chamans = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 7
  );
  const guerriersTank = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 8
  );
  const guerriersDPS = players.filter(
    player => player.playerByPlayerId.classByClassId.id === 9
  );
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
          <div className={classes.column}>
            <ClassAvatar playerClass="Prêtre" />
            {pretres.map(pretre => (
              <Link
                key={pretre.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${pretre.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: pretre.playerByPlayerId.classByClassId.color
                  }}
                >
                  {pretre.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Mage" />
            {mages.map(mage => (
              <Link
                key={mage.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${mage.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: mage.playerByPlayerId.classByClassId.color
                  }}
                >
                  {mage.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Démoniste" />
            {demonistes.map(demoniste => (
              <Link
                key={demoniste.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${demoniste.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: demoniste.playerByPlayerId.classByClassId.color
                  }}
                >
                  {demoniste.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Voleur" />
            {voleurs.map(voleur => (
              <Link
                key={voleur.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${voleur.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: voleur.playerByPlayerId.classByClassId.color
                  }}
                >
                  {voleur.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Druide" />
            {druides.map(druide => (
              <Link
                key={druide.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${druide.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: druide.playerByPlayerId.classByClassId.color
                  }}
                >
                  {druide.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Chasseur" />
            {chasseurs.map(chasseur => (
              <Link
                key={chasseur.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${chasseur.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: chasseur.playerByPlayerId.classByClassId.color
                  }}
                >
                  {chasseur.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Chaman" />
            {chamans.map(chaman => (
              <Link
                key={chaman.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${chaman.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: chaman.playerByPlayerId.classByClassId.color
                  }}
                >
                  {chaman.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Guerrier DPS" />
            {guerriersTank.map(guerrierTank => (
              <Link
                key={guerrierTank.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${guerrierTank.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: guerrierTank.playerByPlayerId.classByClassId.color
                  }}
                >
                  {guerrierTank.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
          <div className={classes.column}>
            <ClassAvatar playerClass="Guerrier Tank" />
            {guerriersDPS.map(guerrierDPS => (
              <Link
                key={guerrierDPS.playerByPlayerId.name}
                href="/player/view/[id]"
                as={`/player/view/${guerrierDPS.playerByPlayerId.id}`}
              >
                <a
                  target="_blank"
                  style={{
                    color: guerrierDPS.playerByPlayerId.classByClassId.color
                  }}
                >
                  {guerrierDPS.playerByPlayerId.name}
                </a>
              </Link>
            ))}
          </div>
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
