import { useMutation } from "@apollo/react-hooks";
import { CircularProgress, Tooltip } from "@material-ui/core";
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

interface Props extends Merit {
  isOfficer: boolean;
  playerId: number;
  parentLoading: boolean;
  updateCalc: ({
    meritsCount,
    validatedMeritsCount
  }: {
    meritsCount?: number;
    validatedMeritsCount?: number;
  }) => void;
}

export function MeritLine({
  id, // id of merit
  categorie,
  name,
  comment,
  value,
  active,
  playerMeritsByMeritId: { nodes },
  classByClassId,
  playerId,
  parentLoading,
  isOfficer,
  updateCalc
}: Props) {
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
  const [currentPlayerMeritId, setCurrentPlayerMeritId] = useState(merit?.id);

  const [
    createMerit,
    { loading: loadingCreateMerit, error: errorCreateMerit }
  ] = useMutation<Mutation, Variables>(CREATE_PLAYER_MERIT);
  const [
    updateMerit,
    { loading: loadingUpdateMerit, error: errorUpdateMerit }
  ] = useMutation<Mutation, Variables & { id: number }>(UPDATE_PLAYER_MERIT);
  const [
    deleteMerit,
    { loading: loadingDeleteMerit, error: errorDeleteMerit }
  ] = useMutation<Mutation, { id: number }>(DELETE_PLAYER_MERIT);

  function setUserMerit(nextState: Checkbox3State) {
    setState(nextState);

    if (nextState === EMPTY) {
      deleteMerit({
        variables: {
          id: currentPlayerMeritId
        }
      }).then(({ data }) => {
        setCurrentPlayerMeritId(undefined);
        updateCalc({ meritsCount: -value, validatedMeritsCount: -value });
      });
    } else if (nextState === SUBMITTED) {
      createMerit({
        variables: {
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: false
        }
      }).then(({ data }) => {
        setCurrentPlayerMeritId(data.createPlayerMerit.playerMerit.id);
        updateCalc({ meritsCount: +value });
      });
    } else if (nextState === VALIDATED) {
      updateMerit({
        variables: {
          id: currentPlayerMeritId,
          date: formatDate(new Date()),
          meritId: id,
          playerId,
          validated: true
        }
      }).then(({ data }) => {
        setCurrentPlayerMeritId(data.updatePlayerMeritById.playerMerit.id);
        updateCalc({ validatedMeritsCount: +value });
      });
    }
  }

  const loading =
    loadingCreateMerit || loadingUpdateMerit || loadingDeleteMerit;
  const error = errorCreateMerit || errorUpdateMerit || errorDeleteMerit;

  if (error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  if (!active) {
    return null;
  }

  function handleClick(newState: Checkbox3State) {
    if (isOfficer) {
      setUserMerit(newState);
    } else {
      if (categorie === "Malus") {
        return;
      }
      switch (currentState) {
        case EMPTY:
          setUserMerit(SUBMITTED);
          break;
        case SUBMITTED:
        case VALIDATED:
          setUserMerit(EMPTY);
          break;
      }
    }
  }

  const debug = false;

  return (
    <div>
      <Tooltip
        title={(merit && `ajouté le ${getDate(merit.date)}`) || ""}
        placement="left"
      >
        <span>
          <Tooltip title={comment || ""} placement="right">
            <span>
              {debug && `${id} - ${currentPlayerMeritId || "X"}`}
              {loading ? (
                <div style={{ width: 42, height: 42, display: "inline-block" }}>
                  <CircularProgress
                    style={{ margin: "4px 10px", marginBottom: -1 }}
                    disableShrink={true}
                    size={22}
                  />
                </div>
              ) : (
                <Checkbox3
                  disabled={loading || parentLoading}
                  onClick={handleClick}
                  state={currentState}
                />
              )}
              <b>
                {classByClassId && `${classByClassId.name} →`} {categorie} :
              </b>{" "}
              {name} ({value} pts) {comment && "*"} {debug && `: ${meritState}`}
            </span>
          </Tooltip>
        </span>
      </Tooltip>
    </div>
  );
}
