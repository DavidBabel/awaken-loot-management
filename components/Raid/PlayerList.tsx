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
import { ADD_PLAYER_TO_RAID } from "../../lib/gql/attendance-mutation";
import { useSnackBar } from "../../lib/hooks/snackbar";
import { useToggle } from "../../lib/hooks/toggle";
import { role } from "../../lib/role-level";
import ClassAvatar from "../ClassAvatar";
import AddPlayer from "../editPlayers/AddPlayer";

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

interface CreateRaidPlayerVariables {
  playerId: number;
  raidId: number;
}

// tslint:disable:no-console
function parseWarcraftLogs(content: string) {
  try {
    const [, tanks] = content.match(/Tanks:	(.*)/);
    const [, healers] = content.match(/Healers:	(.*)/);
    const [, dps] = content.match(/DPS:	(.*)/);

    const playersFound = (tanks + healers + dps)
      .split(/(?=[A-ZØÁÁÀÂÄÅÆÇŒÉÈÊËƑÍÌÎÏÑÑÓÓÒÔÖÚÚÙÛÝÝÐ])/)
      .filter((value, index, self) => {
        return self.indexOf(value) === index;
      })
      .filter(x => !["Tanks", "Healers", "DPS"].includes(x));

    return playersFound;
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

interface Props {
  open: boolean;
  handleClose: () => void;
  players: RaidPlayer[];
  allPlayers: Player[];
  raidId: number;
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
  refetchAllPlayers: () => Promise<ApolloQueryResult<Query>>;
}

export default function PlayerList({
  open,
  handleClose,
  players,
  allPlayers,
  raidId,
  refetchOneRaid,
  refetchAllPlayers
}: Props) {
  const member = useContext(MemberContext);

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
    const classPlayers = raidPlayers.filter(player =>
      player.playerByPlayerId.classByClassId.name.includes(className)
    );

    return (
      <div className={classes.column}>
        <ClassAvatar playerClass={className} />
        {classPlayers.map((player: RaidPlayer) => (
          <Link
            key={`playerlist${player.playerByPlayerId.name}`}
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
                style={{ maxWidth: 700, width: "60%", height: 350, margin: 25 }}
                placeholder="Copier ici le texte d'une page warcraft logs (ctrl + a / ctrl + c)"
                onChange={(e: React.ChangeEvent<HTMLTextAreaElement>) =>
                  setWarcraftLogsContent(e.target.value)
                }
              >
                {warcraftLogsContent}
              </textarea>
              {playerToCreate.length > 0 && (
                <div style={{ margin: 10 }}>
                  Les joueurs suivants doivent être créés d'abord :
                  <div style={{ margin: 10 }}>
                    {playerToCreate.map(player => (
                      <AddPlayer
                        key={`create-player-${player}`}
                        buttonLabel={`Créer ${player}`}
                        initialName={player}
                        allPlayers={allPlayers}
                        refetchAllPlayers={() => {
                          const withoutNewPLayer = playerToCreate.filter(
                            x => x !== player
                          );
                          setPlayerToCreate(withoutNewPLayer);
                          return refetchAllPlayers();
                        }}
                      />
                    ))}
                  </div>
                </div>
              )}

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
                      const alreadyExistingPlayers = players.map(
                        p => p.playerByPlayerId.name
                      );
                      const queries = playerList
                        .filter(p => !alreadyExistingPlayers.includes(p))
                        .map(currentPlayerName => {
                          return createRaidPlayer({
                            variables: {
                              raidId,
                              playerId: getPlayerId(
                                currentPlayerName,
                                allPlayers
                              )
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
                          setWarcraftLogsContent("");
                          toggleDisplayImportPlayerArea();
                        })
                        .catch(e => {
                          console.log(e);
                          openSnackBar("Quelque chose n‘a pas marché", "error");
                        });
                    }
                  }}
                  color="primary"
                >
                  Importer les joueurs dans ce raid
                </Button>
                {member.name === "Devilhunter" && (
                  <>
                    <br />
                    <Button
                      onClick={() => {
                        if (!warcraftLogsContent) {
                          return;
                        }
                        const playerList = parseWarcraftLogs(
                          warcraftLogsContent
                        );
                        if (playerList.length === 0) {
                          return;
                        }

                        const alreadyExistingPlayers = players.map(
                          p => p.playerByPlayerId.name
                        );

                        const nonExistingPlayers: string[] = extractNonExistingPlayers(
                          playerList,
                          allPlayers
                        );

                        console.log(alreadyExistingPlayers);
                        const queries = playerList
                          .filter(p => !alreadyExistingPlayers.includes(p))
                          .filter(p => !nonExistingPlayers.includes(p))
                          .map(currentPlayerName => {
                            console.log(currentPlayerName);
                            return createRaidPlayer({
                              variables: {
                                raidId,
                                playerId: getPlayerId(
                                  currentPlayerName,
                                  allPlayers
                                )
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
                            setWarcraftLogsContent("");
                            toggleDisplayImportPlayerArea();
                          })
                          .catch(e => {
                            console.log(e);
                            openSnackBar(
                              "Quelque chose n‘a pas marché",
                              "error"
                            );
                          });
                      }}
                      color="primary"
                    >
                      Importer uniquement les joueurs connus
                    </Button>
                  </>
                )}
              </div>
            </div>
          )}
        </DialogContent>
        <DialogActions>
          {member.level >= role.officer && (
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
