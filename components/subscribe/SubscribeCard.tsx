import {
  Button,
  ButtonGroup,
  Card,
  CardMedia,
  Grid,
  Tooltip,
  Typography
} from "@material-ui/core";
import LockIcon from "@material-ui/icons/Lock";
import { ApolloQueryResult } from "apollo-boost";
import {
  discordMessageSubMDC,
  discordMessageSubMember
} from "../../lib/discord/message-template";
import { Player, Query, Raid } from "../../lib/generatedTypes";
import { RaidPlayerSub } from "../../lib/hooks/raid-player-sub";
import { getRaidDateInfos } from "../../lib/utils/date";
import { getDonjonImageUrl } from "../../lib/utils/image";
import { getSubscribeLabel, SubscribeStatus } from "./subscribe-status";

interface Props extends Raid {
  refetchRaids: () => Promise<ApolloQueryResult<Query>>;
  setRaidPlayerSub: (
    rpSub: RaidPlayerSub,
    discordMessageMember?: (
      raid: Raid,
      playerName: string,
      status: SubscribeStatus
    ) => string,
    discordMessageMDC?: (
      raid: Raid,
      playerName: string,
      status: SubscribeStatus
    ) => string
  ) => Promise<any>;
  player: Player;
}

interface SubButtonProps {
  locked?: boolean;
  isDefault?: boolean;
  disabled?: boolean;
  status: SubscribeStatus;
}

export function SubscribeCard({
  setRaidPlayerSub,
  refetchRaids,
  player,
  ...raid
}: Props) {
  const donjon = raid.donjonByDonjonId;
  const sub = raid.raidPlayersSubsByRaidId.nodes[0];
  const { isPast, locked, longDateText } = getRaidDateInfos(raid.date);

  const disableNonInscrit =
    sub?.status && sub?.status !== SubscribeStatus.NonInscrit;

  function SubButton({
    status,
    disabled,
    locked: lockedBtn,
    isDefault = false
  }: SubButtonProps) {
    let isCurrentStatus = sub?.status === status;
    if (!sub?.status && isDefault) {
      isCurrentStatus = true;
    }
    return (
      <Button
        disabled={disabled}
        color={isCurrentStatus ? "secondary" : "primary"}
        onClick={() => {
          if (!isCurrentStatus && !disabled && !lockedBtn) {
            setRaidPlayerSub(
              {
                raidPLayerSubId: sub?.id,
                status,
                raid,
                player
              },
              discordMessageSubMember,
              discordMessageSubMDC
            )
              .then(refetchRaids)
              .catch(e => {
                console.log(e);
              });
          }
        }}
      >
        {getSubscribeLabel(status)}
      </Button>
    );
  }

  const valide = sub?.status === SubscribeStatus.Valide;
  const enRotation = sub?.status === SubscribeStatus.EnRotation;

  return (
    <Card style={isPast ? { opacity: 0.5 } : {}}>
      <Grid container spacing={3} alignContent="center" alignItems="center">
        <Grid item xs={3}>
          <div style={{ position: "relative" }}>
            <CardMedia
              style={{ height: 50 }}
              image={donjon.cdnImage || getDonjonImageUrl(donjon.name)}
              title={donjon.name}
            />
            <Typography
              style={{
                color: "white",
                textAlign: "right",
                position: "absolute",
                top: 0,
                right: 5
              }}
            >
              {donjon.name}
            </Typography>
          </div>
        </Grid>
        <Grid item xs={4}>
          <Typography>{longDateText}</Typography>
        </Grid>
        <Grid item xs={4}>
          {isPast ? (
            <Typography>Ce raid est passé</Typography>
          ) : locked ? (
            <Typography>Inscription vérouillée, contacte ton MDC</Typography>
          ) : sub?.status === SubscribeStatus.Valide ? (
            <Tooltip
              title="Tu as déjà été validé pour ce raid, pour changer ta disponibilité, contacte ton MDC"
              placement="left"
            >
              <ButtonGroup
                size="large"
                color="primary"
                aria-label="large outlined primary button group"
              >
                <SubButton status={SubscribeStatus.EnRotation} disabled />
                <SubButton status={SubscribeStatus.Valide} locked />
              </ButtonGroup>
            </Tooltip>
          ) : sub?.status === SubscribeStatus.EnRotation ? (
            <Tooltip
              title="Tu as déjà été mis en rotation pour ce raid, pour changer ta disponibilité, contacte ton MDC"
              placement="left"
            >
              <ButtonGroup
                size="large"
                color="primary"
                aria-label="large outlined primary button group"
              >
                <SubButton status={SubscribeStatus.EnRotation} locked />
                <SubButton status={SubscribeStatus.Valide} disabled />
              </ButtonGroup>
            </Tooltip>
          ) : (
            <ButtonGroup
              size="large"
              color="primary"
              aria-label="large outlined primary button group"
            >
              <SubButton
                status={SubscribeStatus.NonInscrit}
                disabled={locked || disableNonInscrit}
                isDefault
              />
              <SubButton status={SubscribeStatus.Present} disabled={locked} />
              <SubButton status={SubscribeStatus.Absent} disabled={locked} />
            </ButtonGroup>
          )}
        </Grid>
        <Grid item xs={1} alignItems="flex-end">
          {(locked || valide || enRotation) && <LockIcon />}
        </Grid>
      </Grid>
    </Card>
  );
}
