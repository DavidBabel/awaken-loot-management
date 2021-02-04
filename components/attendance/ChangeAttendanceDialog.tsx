import { useMutation } from "@apollo/react-hooks";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle
} from "@material-ui/core/";
import { ApolloQueryResult } from "apollo-boost";
import React from "react";
import {
  Mutation,
  Player,
  Query,
  Raid,
  RaidPlayer
} from "../../lib/generatedTypes";
import {
  ADD_PLAYER_TO_RAID,
  // RESET_RAIDPLAYER_STATUS,
  UPDATE_RAIDPLAYER_STATUS
} from "../../lib/gql/attendance-mutation";
import { getDate } from "../../lib/utils/date";
import {
  showErrorMessage,
  showSuccessMessage
} from "../../lib/utils/snackbars/snackbarService";
import { ChangeAttendanceButton } from "./ChangeAttendanceButton";

export interface ChangeAttendanceDialogProps {
  isOpen: boolean;
  raidPlayer?: RaidPlayer;
  player?: Player;
  raid?: Raid;
  setLoading: any;
}

interface MoreProps {
  closeDialog: () => void;
  refetchRaids: (
    variables?: Record<string, any>
  ) => Promise<ApolloQueryResult<Query>>;
}

export type ChangeAttendanceDialogCallback = React.Dispatch<
  React.SetStateAction<ChangeAttendanceDialogProps>
>;

interface CreateRaidPlayerVariables {
  playerId: number;
  raidId: number;
  status: number;
}

interface UpdateRaidPlayerVariables {
  raidPlayerId: number;
  status: number;
}
// interface ResetRaidPlayerVariables {
//   raidPlayerId: number;
// }

export function ChangeAttendanceDialog({
  isOpen,
  raidPlayer,
  player,
  raid,
  closeDialog,
  refetchRaids,
  setLoading
}: ChangeAttendanceDialogProps & MoreProps) {
  const classes = {} as any;

  const [createRaidPlayer] = useMutation<Mutation, CreateRaidPlayerVariables>(
    ADD_PLAYER_TO_RAID
  );

  const [updateRaidPlayer] = useMutation<Mutation, UpdateRaidPlayerVariables>(
    UPDATE_RAIDPLAYER_STATUS
  );

  // const [resetRaidPlayer] = useMutation<Mutation, ResetRaidPlayerVariables>(
  //   RESET_RAIDPLAYER_STATUS
  // );

  function success() {
    setLoading(false);
    showSuccessMessage("Mis à jour correctement");
  }
  function fail() {
    setLoading(false);
    showErrorMessage("Mise à jour raté");
  }
  if (!isOpen) {
    return null;
  }

  return (
    <Dialog className={classes.dialog} open={isOpen}>
      <DialogTitle>
        Modifier la présence de {player?.name}
        <br /> au raid {raid?.donjonByDonjonId?.name} du {getDate(raid?.date)}
      </DialogTitle>

      <DialogContent className={classes.lootInfoSelects}>
        <ChangeAttendanceButton
          onClick={(newStatus: number = -1) => {
            setLoading(true);
            if (raidPlayer) {
              updateRaidPlayer({
                variables: {
                  raidPlayerId: raidPlayer.id,
                  status: newStatus
                }
              })
                .then(closeDialog)
                .then(() => refetchRaids())
                .then(success)
                .catch(fail);
            } else {
              createRaidPlayer({
                variables: {
                  playerId: player.id,
                  raidId: raid.id,
                  status: newStatus
                }
              })
                .then(closeDialog)
                .then(() => refetchRaids())
                .then(success)
                .catch(fail);
            }
          }}
          currentRaidPlayer={raidPlayer}
        />
      </DialogContent>

      <DialogActions
        classes={{
          root: classes.dialogActions
        }}
      >
        <Button onClick={closeDialog} color="primary">
          ANNULER
        </Button>
      </DialogActions>
    </Dialog>
  );
}
