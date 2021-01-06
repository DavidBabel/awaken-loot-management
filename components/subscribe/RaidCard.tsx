import { useQuery } from "@apollo/react-hooks";
import { Card, CardMedia, Grid, Typography } from "@material-ui/core";
import LockIcon from "@material-ui/icons/Lock";
import React, { useEffect } from "react";
import { wowClasses } from "../../lib/constants/classes";
import { Query, Raid } from "../../lib/generatedTypes";
import { ONE_RAID_SUB, OneRaidSubVariables } from "../../lib/gql/subs-queries";
import { getRaidDateInfos } from "../../lib/utils/date";
import { getDonjonImageUrl } from "../../lib/utils/image";
import { capitalizeFirstLetter } from "../../lib/utils/string";
import { formatDatas } from "../../lib/utils/subs";
import { SubChange } from "../../pages/admin/raid";
import { LoadingAndError } from "../LoadingAndErrors";
import { SubPlayerList } from "./SubPlayerList";
import { getSubscribeLabel, SubscribeStatus } from "./subscribe-status";

interface Props extends Raid {
  displayedClasses: boolean[];
  subChanges: SubChange[];
  pushSubChanges: (sc: SubChange) => void;
  Emitter: any;
}

export function RaidCard({
  displayedClasses,
  pushSubChanges,
  subChanges,
  Emitter,
  ...raid
}: Props) {
  const { loading, data, error, refetch } = useQuery<
    Query,
    OneRaidSubVariables
  >(ONE_RAID_SUB, { variables: { raidId: raid.id } });

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  useEffect(() => {
    Emitter.on("refetch-raids", refetch);
    return () => {
      Emitter.off("refetch-raids", refetch);
    };
  });

  const playerSubs = formatDatas(data.allPlayers.nodes, displayedClasses);
  const donjon = raid.donjonByDonjonId;
  const { isPast, locked, dateText, dayText } = getRaidDateInfos(raid.date);

  return (
    <Card style={{ opacity: isPast ? 0.5 : 1 }}>
      <Grid container spacing={3} alignContent="center" alignItems="center">
        <Grid item xs={12}>
          <CardMedia
            style={{ width: 300, height: 50 }}
            image={donjon.cdnImage || getDonjonImageUrl(donjon.name)}
            title={donjon.name}
          />
          <div
            style={{
              color: "white",
              marginTop: -50,
              paddingLeft: 4,
              height: 30
            }}
          >
            <Typography>{donjon.name}</Typography>
            <div style={{ display: "flex", justifyContent: "flex-end" }}>
              {locked && <LockIcon />}
            </div>
          </div>
        </Grid>
        <Grid item xs={12}>
          <Typography style={{ padding: "0px 6px" }}>
            {capitalizeFirstLetter(dateText)}
            <br />
            {dayText}
          </Typography>
        </Grid>
        <Grid item xs={12}>
          <div>
            {[
              SubscribeStatus.Valide,
              SubscribeStatus.EnRotation,
              SubscribeStatus.Present,
              SubscribeStatus.Absent,
              SubscribeStatus.NonInscrit
            ].map(statusEnum => {
              const totalPerClass = playerSubs.counter.classes.reduce(
                (prev, next) => prev + next,
                0
              );
              const subTotal = playerSubs.counter[statusEnum];
              const toAdd = subChanges.reduce((prev, next) => {
                if (next.raid.id === raid.id && next.status === statusEnum) {
                  prev++;
                }
                return prev;
              }, 0);
              const toRemove = subChanges.reduce((prev, next) => {
                if (next.raid.id === raid.id && next.from === statusEnum) {
                  prev++;
                }
                return prev;
              }, 0);
              const total = subTotal + toAdd - toRemove;
              const countText =
                statusEnum !== SubscribeStatus.Valide
                  ? ""
                  : "/" + totalPerClass;

              return (
                <div key={`subplayerlisth-${raid.id}-${statusEnum}`}>
                  <Typography style={{ padding: "8px 6px 1px" }}>
                    {getSubscribeLabel(statusEnum)} ({total}
                    {countText})
                  </Typography>

                  {wowClasses.slice(1).map(wowClass => {
                    if (!displayedClasses[wowClass.id]) {
                      return null;
                    }

                    return (
                      <SubPlayerList
                        key={`subplayerlist-${wowClass.name}-${raid.id}-${statusEnum}`}
                        playerClass={wowClass.name}
                        iconUrl={wowClass.icon}
                        raid={raid}
                        players={playerSubs[wowClass.name][statusEnum]}
                        currentStatus={statusEnum}
                        subChanges={subChanges}
                        pushSubChanges={pushSubChanges}
                      />
                    );
                  })}
                </div>
              );
            })}
          </div>
        </Grid>
      </Grid>
    </Card>
  );
}
