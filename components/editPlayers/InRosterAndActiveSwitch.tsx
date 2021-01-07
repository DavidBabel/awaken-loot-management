import { useMutation } from "@apollo/react-hooks";
import { CircularProgress, Switch } from "@material-ui/core/";
import { makeStyles } from "@material-ui/core/styles";
import { useState } from "react";
import { Mutation } from "../../lib/generatedTypes";
import {
  UPDATE_PLAYER,
  UpdatePlayerVariables
} from "../../lib/gql/player-mutations";

const useStyles = makeStyles({
  switch: { position: "relative" },
  switchProgress: {
    position: "absolute"
  }
});

export default function InRosterAndActiveSwitch({
  playerId,
  active,
  accessor
}) {
  const classes = useStyles("");
  const [loading, setLoading] = useState<boolean>(false);
  const [updatePlayer] = useMutation<Mutation, UpdatePlayerVariables>(
    UPDATE_PLAYER
  );
  const toggleSwitchActive = (id: number, value: boolean) => {
    setLoading(true);
    updatePlayer({
      variables: {
        id,
        [accessor]: !value
      }
    })
      .then(resp => {
        setLoading(false);
      })
      .catch(err => {
        alert(err.message);
      });
  };
  return (
    <>
      <Switch
        className={classes.switch}
        size="small"
        checked={active}
        onChange={() => {
          toggleSwitchActive(playerId, active);
        }}
      />
      {loading && (
        <CircularProgress
          className={classes.switchProgress}
          disableShrink={true}
          size={24}
        />
      )}
    </>
  );
}
