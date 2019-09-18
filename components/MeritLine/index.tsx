import { useMutation } from "@apollo/react-hooks";
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
  playerId
}: Merit & { playerId: number }) {
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
      deleteMerit({
        variables: {
          id: merit.id
        }
      });
    } else if (nextState === SUBMITTED) {
      createMerit({
        variables: {
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: false
        }
      });
    } else if (nextState === VALIDATED) {
      updateMerit({
        variables: {
          // TODO debug this, the IDs are wrong
          id,
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: true
        }
      });
    }
  }

  const loading =
    loadingCreateMerit || loadingUpdateMerit || loadingDeleteMerit;
  const error = errorCreateMerit || errorUpdateMerit || errorDeleteMerit;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  return (
    <div title={merit && getDate(merit.date)}>
      <Checkbox3
        onClick={(state: Checkbox3State) => {
          setUserMerit(state);
          setState(state);
        }}
        state={currentState}
      />
      {name}: {meritState}
    </div>
  );
}
