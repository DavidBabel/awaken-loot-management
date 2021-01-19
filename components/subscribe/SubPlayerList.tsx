import { Button, ButtonProps, Grid, Tooltip } from "@material-ui/core/";
import React from "react";
import { Player, Raid } from "../../lib/generatedTypes";
import { hasSubMoved } from "../../lib/utils/subs";
import { SubChange } from "../../pages/admin/raid";
import { getSubscribeLabel, SubscribeStatus } from "./subscribe-status";

interface Props {
  players: Player[];
  iconUrl: string;
  raid: Raid;
  isPast: boolean;
  playerClass: string;
  subChanges: SubChange[];
  currentStatus: SubscribeStatus;
  pushSubChanges: (sc: SubChange) => void;
}

const iconStyle = {
  width: 15,
  height: 15,
  verticalAlign: -2,
  marginLeft: 6
};

interface ActionButtonProps extends ButtonProps {
  status: SubscribeStatus;
  player: Player;
  from?: SubscribeStatus;
}

const actionbuttonStyle = {
  padding: "0 8px",
  width: 6,
  maxWidth: 6,
  minWidth: 6,
  height: 14,
  fontSize: 8
};

export function SubPlayerList({
  raid,
  players,
  iconUrl,
  subChanges,
  currentStatus,
  isPast,
  playerClass,
  pushSubChanges
}: Props) {
  function ActionButton({ player, status, from, ...props }: ActionButtonProps) {
    const isMoved = typeof from !== "undefined";
    return (
      <Tooltip title={getSubscribeLabel(status)}>
        <Button
          disabled={currentStatus === status}
          variant="outlined"
          onClick={() =>
            pushSubChanges({
              player,
              raid,
              status,
              from: isMoved ? from : currentStatus
            })
          }
          style={actionbuttonStyle}
          {...props}
        />
      </Tooltip>
    );
  }

  function Component({
    player,
    from
  }: {
    player: Player;
    from?: SubscribeStatus;
  }) {
    const isMoved = typeof from !== "undefined";

    const Absent = () => (
      <ActionButton player={player} status={SubscribeStatus.Absent} from={from}>
        A
      </ActionButton>
    );
    const Present = () => (
      <ActionButton
        player={player}
        status={SubscribeStatus.Present}
        from={from}
      >
        D
      </ActionButton>
    );
    const SiBesoin = () => (
      <ActionButton
        player={player}
        status={SubscribeStatus.SiBesoin}
        from={from}
      >
        SB
      </ActionButton>
    );
    const Rotation = () => (
      <ActionButton
        player={player}
        status={SubscribeStatus.EnRotation}
        from={from}
      >
        R
      </ActionButton>
    );
    const Valide = () => (
      <ActionButton player={player} status={SubscribeStatus.Valide} from={from}>
        V
      </ActionButton>
    );
    return (
      <Grid container>
        <Grid item xs={1}>
          <img src={iconUrl} style={iconStyle} alt="" />{" "}
        </Grid>
        <Grid item xs={5}>
          <span
            style={
              isMoved
                ? {
                    paddingLeft: 7,
                    fontWeight: "bold",
                    fontStyle: "italic",
                    color: "green"
                  }
                : { paddingLeft: 7 }
            }
          >
            {player.name}
          </span>
        </Grid>
        {!isPast && (
          <Grid item xs={6} style={{ textAlign: "right", paddingRight: 5 }}>
            {currentStatus === SubscribeStatus.NonInscrit ? (
              <>
                <Absent />
                <Present />
                <SiBesoin />
              </>
            ) : currentStatus === SubscribeStatus.Absent ? (
              <>
                <Absent />
                <Present />
                <SiBesoin />
              </>
            ) : currentStatus === SubscribeStatus.SiBesoin ? (
              <>
                <Absent />
                <Present />
                <SiBesoin />
              </>
            ) : currentStatus === SubscribeStatus.Present ? (
              <>
                <Absent />
                <Present />
                <SiBesoin />
                <Rotation />
                <Valide />
              </>
            ) : currentStatus === SubscribeStatus.EnRotation ? (
              <>
                <Rotation />
                <Valide />
              </>
            ) : currentStatus === SubscribeStatus.Valide ? (
              <>
                <Rotation />
                <Valide />
              </>
            ) : null}
          </Grid>
        )}
      </Grid>
    );
  }

  return (
    <>
      {subChanges.map(subChange => {
        if (
          subChange.raid.id !== raid.id ||
          subChange.player.classByClassId.name !== playerClass ||
          subChange.status !== currentStatus
        ) {
          return null;
        }
        return (
          <Component
            from={subChange.from}
            player={subChange.player}
            key={`subplayerchange-${subChange.player.name}-${raid.id}`}
          />
        );
      })}
      {players.map(player => {
        if (hasSubMoved(subChanges, raid, player)) {
          return null;
        }
        return (
          <Component
            player={player}
            key={`subplayer-${player.name}-${raid.id}`}
          />
        );
      })}
    </>
  );
}
