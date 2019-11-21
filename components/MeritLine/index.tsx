import { useMutation } from "@apollo/react-hooks";
import { CircularProgress } from "@material-ui/core";
import { useState } from "react";
import { Merit, Mutation } from "../../lib/generatedTypes";
import {
  CREATE_PLAYER_MERIT,
  DELETE_PLAYER_MERIT,
  UPDATE_PLAYER_MERIT
} from "../../lib/gql/merit-mutations";
import { formatDate, getDate } from "../../lib/utils/date";
import { Checkbox3, Checkbox3State } from "../Checkbox3";
import { LoadingAndError } from "../LoadingAndErrors";

const EMPTY = 0;
const SUBMITTED = 1;
const VALIDATED = 2;

interface Variables {
  date: string;
  meritId: number;
  playerId: number;
  validated: boolean;
}

export function MeritLine({
  id, // id of merit
  // categorie,
  name,
  // comment,
  // value,
  // active,
  playerMeritsByMeritId: { nodes },
  playerId,
  refetchMerits,
  parentLoading
}: Merit & {
  playerId: number;
  refetchMerits: () => void;
  parentLoading: boolean;
}) {
  const merit = nodes[0];
  let meritState: Checkbox3State = EMPTY;
  if (merit) {
    if (merit.validated === true) {
      meritState = VALIDATED;
    }
    if (merit.validated === false) {
      meritState = SUBMITTED;
    }
  }

  const [currentState, setState] = useState(meritState);

  // TODO : lock for player itself and class master
  const [
    createMerit,
    { loading: loadingCreateMerit, error: errorCreateMerit }
  ] = useMutation<Mutation, Variables>(CREATE_PLAYER_MERIT);
  // TODO lock for class master
  const [
    updateMerit,
    { loading: loadingUpdateMerit, error: errorUpdateMerit }
  ] = useMutation<Mutation, Variables & { id: number }>(UPDATE_PLAYER_MERIT);
  // TODO : lock for player itself and class master
  const [
    deleteMerit,
    { loading: loadingDeleteMerit, error: errorDeleteMerit }
  ] = useMutation<Mutation, { id: number }>(DELETE_PLAYER_MERIT);

  function setUserMerit(nextState: Checkbox3State) {
    if (nextState === EMPTY) {
      console.log("merit.id");
      console.log(merit.id);
      deleteMerit({
        variables: {
          id: merit.id
        }
      }).then(refetchMerits);
    } else if (nextState === SUBMITTED) {
      console.log("id => meritId");
      console.log(id);
      createMerit({
        variables: {
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: false
        }
      }).then(refetchMerits);
    } else if (nextState === VALIDATED) {
      console.log("id :");
      console.log(id);
      console.log("merit.id :");
      console.log(merit.id);
      updateMerit({
        variables: {
          id: merit.id,
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: true
        }
      }).then(refetchMerits);
    }
  }

  const loading =
    loadingCreateMerit || loadingUpdateMerit || loadingDeleteMerit;
  const error = errorCreateMerit || errorUpdateMerit || errorDeleteMerit;

  if (error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  return (
    <div title={merit && `ajouté le ${getDate(merit.date)}`}>
      {id} - {(merit && merit.id) || "X"} -
      {loading ? (
        <CircularProgress
          style={{ margin: 2 }}
          disableShrink={true}
          size={20}
        />
      ) : (
        <Checkbox3
          disabled={loading || parentLoading}
          onClick={(state: Checkbox3State) => {
            setUserMerit(state);
            setState(state);
          }}
          state={currentState}
        />
      )}
      {name}: {meritState}
    </div>
  );
}
