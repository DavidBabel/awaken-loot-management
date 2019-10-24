import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Slide from "@material-ui/core/Slide";
import { makeStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import { forwardRef } from "react";

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
    backgroundColor: "#242424",
    "& div": {
      padding: 2
    }
  },
  nomDeClasse: {
    color: "white",
    marginBottom: 5,
    padding: 5
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
            <div className={classes.nomDeClasse}>Prêtres</div>
            {pretres.map(pretre => (
              <div
                key={pretre.playerByPlayerId.name}
                style={{ color: pretre.playerByPlayerId.classByClassId.color }}
              >
                {pretre.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Mages</div>
            {mages.map(mage => (
              <div
                key={mage.playerByPlayerId.name}
                style={{ color: mage.playerByPlayerId.classByClassId.color }}
              >
                {mage.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Démonistes</div>
            {demonistes.map(demoniste => (
              <div
                key={demoniste.playerByPlayerId.name}
                style={{
                  color: demoniste.playerByPlayerId.classByClassId.color
                }}
              >
                {demoniste.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Voleurs</div>
            {voleurs.map(voleur => (
              <div
                key={voleur.playerByPlayerId.name}
                style={{ color: voleur.playerByPlayerId.classByClassId.color }}
              >
                {voleur.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Druides</div>
            {druides.map(druide => (
              <div
                key={druide.playerByPlayerId.name}
                style={{ color: druide.playerByPlayerId.classByClassId.color }}
              >
                {druide.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Chasseurs</div>
            {chasseurs.map(chasseur => (
              <div
                key={chasseur.playerByPlayerId.name}
                style={{
                  color: chasseur.playerByPlayerId.classByClassId.color
                }}
              >
                {chasseur.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Chamans</div>
            {chamans.map(chaman => (
              <div
                key={chaman.playerByPlayerId.name}
                style={{ color: chaman.playerByPlayerId.classByClassId.color }}
              >
                {chaman.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Guerriers(Tank)</div>
            {guerriersTank.map(guerrierTank => (
              <div
                key={guerrierTank.playerByPlayerId.name}
                style={{
                  color: guerrierTank.playerByPlayerId.classByClassId.color
                }}
              >
                {guerrierTank.playerByPlayerId.name}
              </div>
            ))}
          </div>
          <div className={classes.column}>
            <div className={classes.nomDeClasse}>Guerriers(DPS)</div>
            {guerriersDPS.map(guerrierDPS => (
              <div
                key={guerrierDPS.playerByPlayerId.name}
                style={{
                  color: guerrierDPS.playerByPlayerId.classByClassId.color
                }}
              >
                {guerrierDPS.playerByPlayerId.name}
              </div>
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
