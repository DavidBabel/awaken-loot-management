import { useMutation } from "@apollo/react-hooks";
import { IconButton, Snackbar, SnackbarContent } from "@material-ui/core";
import Button from "@material-ui/core/Button";
import Dialog from "@material-ui/core/Dialog";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import DialogTitle from "@material-ui/core/DialogTitle";
import Slide from "@material-ui/core/Slide";
import { makeStyles } from "@material-ui/core/styles";
import { TransitionProps } from "@material-ui/core/transitions";
import CloseIcon from "@material-ui/icons/Close";
import { ApolloQueryResult } from "apollo-boost";
import Link from "next/link";
import { forwardRef, useContext, useState } from "react";
import MemberContext from "../../lib/context/member";
import { Mutation, Player, Query, RaidPlayer } from "../../lib/generatedTypes";
// import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { ADD_PLAYER_TO_RAID } from "../../lib/gql/raid-mutations";
import { useSnackBar } from "../../lib/hooks/snackbar";
import { useToggle } from "../../lib/hooks/toggle";
import { role } from "../../lib/role-level";
import ClassAvatar from "../ClassAvatar";

// import { LoadingAndError } from "../LoadingAndErrors";

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
  allPlayers: Player[];
  raidId: number;
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
}

interface CreateRaidPlayerVariables {
  playerId: number;
  raidId: number;
}

// tslint:disable:no-console
function parseWarcraftLogs(content: string) {
  try {
    const [, tanks] = content.match(/(Tanks|Healers|DPS):	(.*)/);
    const [, healers] = content.match(/Healers:	(.*)/);
    const [, dps] = content.match(/DPS:	(.*)/);

    return (tanks + healers + dps)
      .split(/(?=[A-ZØ])/)
      .filter((value, index, self) => {
        return self.indexOf(value) === index;
      })
      .filter(x => !["Tanks"].includes(x));
  } catch (error) {
    return [];
  }
}

function playerExists(playerName: string, allPlayers: Player[]) {
  return getPlayerId(playerName, allPlayers) > -1;
}

function extractNonExistingPlayers(playerList: string[], allPlayers: Player[]) {
  const nonExistigPlayers = [];
  playerList.forEach((currentPlayer: string) => {
    if (!playerExists(currentPlayer, allPlayers)) {
      nonExistigPlayers.push(currentPlayer);
    }
  });
  return nonExistigPlayers;
}

function getPlayerId(playerName: string, allPlayers: Player[]) {
  for (let i = 0; i < allPlayers.length; i++) {
    if (allPlayers[i].name === playerName) {
      return allPlayers[i].id;
    }
  }
  return -1;
}

export default function PlayerList({
  open,
  handleClose,
  players,
  allPlayers,
  raidId,
  refetchOneRaid
}: Props) {
  const member = useContext(MemberContext);
  console.log(players);

  const [createRaidPlayer] = useMutation<Mutation, CreateRaidPlayerVariables>(
    ADD_PLAYER_TO_RAID
  );

  const classes = useStyles("");
  const [displayImportPlayerArea, toggleDisplayImportPlayerArea] = useToggle(
    false
  );
  const [warcraftLogsContent, setWarcraftLogsContent] = useState("");
  const [playerToCreate, setPlayerToCreate] = useState<string[]>([]);

  const {
    snackBarOpen,
    snackBarBackgroundColor,
    openSnackBar,
    closeSnackBar,
    snackBarMessage
  } = useSnackBar();

  function displayClass(className: string, raidPlayers: RaidPlayer[]) {
    const classPlayers = raidPlayers.filter(
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
    <>
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
          {displayImportPlayerArea && (
            <div>
              <textarea
                style={{ width: 600, height: 350, margin: 25 }}
                placeholder="Copier ici le texte d'une page warcraft logs"
                onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) =>
                  setWarcraftLogsContent(e.target.value)
                }
              >
                {warcraftLogsContent}
              </textarea>
              <div style={{ margin: 10 }}>
                {playerToCreate.length > 0 &&
                  `Les joueurs ${playerToCreate.join(
                    ", "
                  )} doivent être créés d'abord.`}
              </div>
              <div>
                <Button
                  onClick={() => {
                    if (!warcraftLogsContent) {
                      return;
                    }
                    const playerList = parseWarcraftLogs(warcraftLogsContent);
                    if (playerList.length === 0) {
                      return;
                    }

                    const nonExistingPlayers: string[] = extractNonExistingPlayers(
                      playerList,
                      allPlayers
                    );

                    if (nonExistingPlayers.length > 0) {
                      setPlayerToCreate(nonExistingPlayers);
                    } else {
                      const queries = playerList.map(currentPlayerName => {
                        return createRaidPlayer({
                          variables: {
                            raidId,
                            playerId: getPlayerId(currentPlayerName, allPlayers)
                          }
                        });
                      });
                      Promise.all(queries)
                        .then(() => {
                          openSnackBar(
                            "Liste des joueurs importé avec succès",
                            "success"
                          );
                          refetchOneRaid();
                        })
                        .catch(() => {
                          openSnackBar("Quelque chose n‘a pas marché", "error");
                        });
                    }
                  }}
                  color="primary"
                >
                  Importer les joueurs les joueurs
                </Button>
              </div>
            </div>
          )}
        </DialogContent>
        <DialogActions>
          {member.level > role.officer && (
            <Button onClick={toggleDisplayImportPlayerArea} color="primary">
              {displayImportPlayerArea
                ? "Fermer l‘import de joueurs"
                : "Importer des joueurs"}
            </Button>
          )}
          <Button onClick={handleClose} color="primary">
            Fermer
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
