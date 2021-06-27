import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  MenuItem,
  Select
} from "@material-ui/core/";
import { makeStyles } from "@material-ui/core/styles";
import { ApolloQueryResult } from "apollo-boost";
import { useState } from "react";
// import Link from "next/link";
import { useMemberContext } from "../../lib/context/member";
import {
  Item,
  Mutation,
  Player,
  Query,
  SoftResa
} from "../../lib/generatedTypes";
// import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import {
  CREATE_SOFTRESA,
  CreateSoftResaVariables,
  DELETE_SOFTRESA,
  DeleteSoftResaVariables
} from "../../lib/gql/softresa-mutations";
import { useToggle } from "../../lib/hooks/toggle";
import { role } from "../../lib/role-level";
import {
  showErrorMessage,
  showSuccessMessage
} from "../../lib/utils/snackbars/snackbarService";
// import ClassAvatar from "../ClassAvatar";
// import AddPlayer from "../editPlayers/AddPlayer";

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
  },
  srContainer: { width: "50%", margin: "auto", textAlign: "left" }
});
// tslint:disable-next-line:no-shadowed-variable
// const Transition = forwardRef<unknown, TransitionProps>(function Transition(
//   props,
//   ref
// ) {
//   return <Slide direction="up" ref={ref} {...props} />;
// });

async function parseSoftResaCSV(): Promise<string> {
  return new Promise((resolve, reject) => {
    try {
      const file = (document.getElementById("CSVSoftResa") as any)?.files[0];
      if (file) {
        const reader = new FileReader();
        reader.readAsText(file, "UTF-8");
        reader.onload = evt => resolve(String(evt.target.result));
        reader.onerror = evt => reject("error reading file");
      }
    } catch (error) {
      reject(error);
    }
  });
}

interface SoftResaToCreate {
  wowheadId: number;
  playerName: string;
  itemId?: number;
  playerId?: number;
}

function parseResult(result: string): SoftResaToCreate[] {
  const [, ...lines] = result.split("\n");

  return lines.map(line => {
    const [, wowheadId, , playerName] = line.split(",");
    return { wowheadId: Number(wowheadId), playerName };
  });
}

function findUserId(userName: string, allPlayers: Player[]) {
  const foundUser = allPlayers.find(p => p.name === userName);
  if (foundUser) {
    return foundUser.id;
  }
  return null;
}

function findItemId(wowheadId: number, allItem: Item[]) {
  const foundItem = allItem.find(i => i.wowheadId === wowheadId);
  if (foundItem) {
    return foundItem.id;
  }
  return null;
}

interface Props {
  open: boolean;
  handleClose: () => void;
  softResas: SoftResa[];
  raidId: number;
  allPlayers: Player[];
  allItems: Item[];
  refetchOneRaid: () => Promise<ApolloQueryResult<Query>>;
}

export default function SoftResaList({
  open,
  handleClose,
  softResas,
  raidId,
  allPlayers,
  allItems,
  refetchOneRaid
}: Props) {
  const member = useMemberContext();

  const [
    createSoftResa
    // { loading: loadingCreateSoftResa, error: errorCreateSoftResa }
  ] = useMutation<Mutation, CreateSoftResaVariables>(CREATE_SOFTRESA);
  const [
    deleteSoftResa
    // { loading: loadingCreateSoftResa, error: errorCreateSoftResa }
  ] = useMutation<Mutation, DeleteSoftResaVariables>(DELETE_SOFTRESA);

  const classes = useStyles("");
  const [displayImportSoftResa, toggleDisplayImportSoftResa] = useToggle(false);
  const [
    displayImportMonoSoftResa,
    toggleDisplayImportMonoSoftResa
  ] = useToggle(false);

  const [resaUserId, setResaUserId] = useState(0);
  const [resaItemId, setResaItemId] = useState(0);

  const hasSoftResa = softResas.length > 0;

  return (
    <>
      <Dialog
        className={classes.root}
        fullWidth={true}
        maxWidth={"lg"}
        open={open}
        // TransitionComponent={Transition}
        keepMounted={true}
        onClose={handleClose}
        aria-labelledby="alert-dialog-slide-title"
        aria-describedby="alert-dialog-slide-description"
      >
        <DialogTitle id="alert-dialog-slide-title">
          Saisir les softs résas ({softResas.length})
        </DialogTitle>
        <DialogContent>
          {hasSoftResa &&
            softResas.map(sr => {
              return (
                <div
                  className={classes.srContainer}
                  key={`softresa-${raidId}-${sr.id}`}
                >
                  <div>
                    {member.level >= role.admin && (
                      <b
                        style={{ cursor: "pointer" }}
                        onClick={() =>
                          deleteSoftResa({ variables: { id: sr.id } }).then(
                            () => {
                              showSuccessMessage(
                                `Soft Résa de ${sr.playerByPlayerId.name} suprimée`
                              );
                              refetchOneRaid();
                            }
                          )
                        }
                      >
                        [X]
                      </b>
                    )}{" "}
                    {sr.playerByPlayerId.name} - {sr.itemByItemId.name}
                  </div>
                </div>
              );
            })}
          {displayImportSoftResa && (
            <div>
              <input type="file" id="CSVSoftResa" />
              <Button
                color="primary"
                variant="contained"
                onClick={async () => {
                  try {
                    const content: string = await parseSoftResaCSV();
                    const softsToCreate = parseResult(content)
                      // search for player id from name & itemid from wowhead
                      .map(stc => {
                        stc.playerId = findUserId(stc.playerName, allPlayers);
                        stc.itemId = findItemId(stc.wowheadId, allItems);
                        return stc;
                      })
                      // remove not found players
                      .filter(stc => stc.playerId && stc.itemId);
                    Promise.all(
                      softsToCreate.map(({ itemId, playerId }) =>
                        createSoftResa({
                          variables: {
                            itemId,
                            playerId,
                            raidId
                          }
                        })
                      )
                    ).then(() => {
                      showSuccessMessage(
                        `${softsToCreate.length} soft-résas correctement importées`
                      );
                      toggleDisplayImportSoftResa();
                      refetchOneRaid();
                    });
                  } catch (error) {
                    showErrorMessage("Err120 - " + error);
                  }
                }}
              >
                Ajouter les soft résa
              </Button>
            </div>
          )}
          {displayImportMonoSoftResa && (
            <div>
              <Select
                onChange={e => setResaUserId(Number(e.target.value))}
                label="Joueur"
                style={{ width: 150, textAlign: "left", margin: 3 }}
              >
                {allPlayers.map((player, id) => (
                  <MenuItem value={player.id} key={`player-monosr-${id}`}>
                    {player.name}
                  </MenuItem>
                ))}
              </Select>
              <Select
                onChange={e => setResaItemId(Number(e.target.value))}
                label="Item"
                style={{ width: 330, textAlign: "left", margin: 3 }}
              >
                {allItems
                  .sort((item1, item2) => {
                    if (item1 < item2) {
                      return -1;
                    } else if (item1 === item2) {
                      return 0;
                    } else {
                      return 1;
                    }
                  })
                  .map((item, id) => (
                    <MenuItem value={item.id} key={`item-monosr-${id}`}>
                      {item.name}
                    </MenuItem>
                  ))}
              </Select>
              <Button
                color="primary"
                variant="contained"
                disabled={resaUserId === 0 || resaItemId === 0}
                onClick={async () => {
                  createSoftResa({
                    variables: {
                      itemId: resaItemId,
                      playerId: resaUserId,
                      raidId
                    }
                  }).then(() => {
                    showSuccessMessage(`Soft-résas correctement importée`);
                    toggleDisplayImportMonoSoftResa();
                    refetchOneRaid();
                  });
                }}
              >
                Ajouter
              </Button>
            </div>
          )}
        </DialogContent>
        <DialogActions>
          {member.level >= role.officer && (
            <Button onClick={toggleDisplayImportSoftResa} color="primary">
              {displayImportSoftResa
                ? "Fermer l‘import de Soft-Resa"
                : hasSoftResa
                ? "⚠️ Ce raid a déjà des SoftRésas"
                : "Importer depuis un .csv softres.it"}
            </Button>
          )}
          {member.level >= role.admin && (
            <Button onClick={toggleDisplayImportMonoSoftResa} color="primary">
              {displayImportMonoSoftResa
                ? "Fermer l‘import de Mono Soft-Resa"
                : hasSoftResa
                ? "⚠️ Ce raid a déjà des SoftRésas (mono)"
                : "Ajouter une soft résa"}
            </Button>
          )}
          <Button onClick={handleClose} color="primary">
            Fermer
          </Button>
        </DialogActions>
      </Dialog>
    </>
  );
}
