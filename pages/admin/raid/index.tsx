import { useQuery } from "@apollo/react-hooks";
import { Button, FormControlLabel, FormGroup, Grid } from "@material-ui/core/";
// import { useRouter } from "next/router";
import React, { useState } from "react";
import { ColoredSwitch } from "../../../components/ColoredSwitch";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { RaidCard } from "../../../components/subscribe/RaidCard";
import { SubscribeStatus } from "../../../components/subscribe/subscribe-status";
import { getClassColor } from "../../../lib/constants/class-colors";
import { wowClasses } from "../../../lib/constants/classes";
import { useMemberContext } from "../../../lib/context/member";
import { discordMessageChangedMember } from "../../../lib/discord/message-template";
import { Query } from "../../../lib/generatedTypes";
import { USER_SUBS } from "../../../lib/gql/subs-queries";
import {
  RaidPlayerSub,
  useChangeRaidPlayerSub
} from "../../../lib/hooks/raid-player-sub";
import { useToggle } from "../../../lib/hooks/toggle";
import { role } from "../../../lib/role-level";
import { getRaidDateInfos } from "../../../lib/utils/date";
import Emitter from "../../../lib/utils/emitter";

export interface SubChange extends RaidPlayerSub {
  from: SubscribeStatus;
}

export default function PlayerRaidPage() {
  // const router = useRouter();
  // const playerId = parseInt(String(router.query.playerId));
  const member = useMemberContext();

  const [displayedClasses, setDisplayedClasses] = useState([
    member.classId === 0,
    member.classId === 1,
    member.classId === 2,
    member.classId === 3,
    member.classId === 4,
    member.classId === 5,
    member.classId === 6,
    member.classId === 7,
    member.classId === 8,
    member.classId === 9,
    member.classId === 10,
    member.classId === 11,
    member.classId === 12,
    member.classId === 13
  ]);

  const [subChanges, setSubChanges] = useState<SubChange[]>([]);
  const [changeRaidOrder, toggleRaidOrder] = useToggle(false);

  const { loading, data, error, refetch } = useQuery<Query>(USER_SUBS);

  const [setRaidPlayerSub] = useChangeRaidPlayerSub();

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  let raids = data.allRaids.nodes;
  if (changeRaidOrder) {
    raids = raids.slice().reverse();
  }

  function pushSubChanges(subChange: SubChange) {
    const filterExisting = (sc: SubChange) =>
      sc.player.id !== subChange.player.id || sc.raid.id !== subChange.raid.id;
    const currentSubChanges = [...subChanges.filter(filterExisting)];

    const sub = subChange.raid.raidPlayersSubsByRaidId?.nodes.find(
      node => node.playerByPlayerId.id === subChange.player.id
    );
    currentSubChanges.push({ raidPLayerSubId: sub?.id, ...subChange });
    setSubChanges(currentSubChanges);
  }

  function resetSubChanges() {
    setSubChanges([]);
  }

  function validateSubChanges() {
    Promise.all(
      subChanges.map(subChange => {
        setRaidPlayerSub(subChange, discordMessageChangedMember);
      })
    )
      .then(() => refetch())
      .then(() => {
        Emitter.emit("refetch-raids", {});
      })
      .then(() => setSubChanges([]));
  }
  if (member.level < role.classMaster) {
    return null;
  }

  return (
    <Grid container spacing={3}>
      {member.level > role.officer && (
        <Grid item xs={12}>
          <FormGroup row>
            {wowClasses.map((wowClass, i) => {
              if (i === 0 || wowClass.name === "Chaman Amélio") {
                return null;
              }
              return (
                <FormControlLabel
                  key={`check-raid-class${wowClass.name}`}
                  style={{ fontSize: 10 }}
                  control={
                    <ColoredSwitch
                      checked={displayedClasses[wowClass.id]}
                      baseColor={getClassColor(wowClass.name)}
                      onChange={e => {
                        let newDisplay = displayedClasses.map(a => a);
                        newDisplay[wowClass.id] = !newDisplay[wowClass.id];
                        // @ts-ignore
                        if (e?.nativeEvent?.shiftKey) {
                          if (newDisplay[wowClass.id]) {
                            newDisplay = displayedClasses.map(() => true);
                          } else {
                            newDisplay = displayedClasses.map(() => false);
                          }
                        }
                        // @ts-ignore
                        if (e?.nativeEvent?.ctrlKey) {
                          newDisplay = displayedClasses.map(() => false);
                          newDisplay[wowClass.id] = true;
                        }
                        setDisplayedClasses(newDisplay);
                      }}
                      name={wowClass.name}
                      color="primary"
                    />
                  }
                  label={wowClass.name}
                />
              );
            })}
          </FormGroup>
          ctrl+clic pour ne selectionner qu'une &nbsp;&nbsp;&nbsp; maj+clic pour
          désélectionner tout
        </Grid>
      )}
      <Grid item xs={12}>
        <Button disabled={subChanges.length === 0} onClick={resetSubChanges}>
          Réinitialiser la composition
        </Button>
        <Button disabled={subChanges.length === 0} onClick={validateSubChanges}>
          Appliquer cette composition
        </Button>
        <Button onClick={toggleRaidOrder}>Inverser l'ordre des raids</Button>
      </Grid>
      <Grid item xs={12} style={{ display: "flex" }}>
        {raids.map(raid => {
          const { inDays } = getRaidDateInfos(raid.date);
          if (inDays < -2) {
            return null;
          }
          return (
            <div
              style={{ width: 200, marginRight: 5 }}
              key={`raids-sub-${raid.id}`}
            >
              <RaidCard
                {...raid}
                displayedClasses={displayedClasses}
                subChanges={subChanges}
                pushSubChanges={pushSubChanges}
                Emitter={Emitter}
              />
            </div>
          );
        })}
      </Grid>
    </Grid>
  );
}
