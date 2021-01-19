import { useQuery } from "@apollo/react-hooks";
import { Grid, Typography } from "@material-ui/core";
import { useRouter } from "next/router";
import React from "react";
import { LoadingAndError } from "../../../../components/LoadingAndErrors";
import { getClassColor } from "../../../../lib/constants/class-colors";
import { classesPerRaid, wowClasses } from "../../../../lib/constants/classes";
import { Query } from "../../../../lib/generatedTypes";
import { USER_SUBS, UserSubsVariables } from "../../../../lib/gql/subs-queries";
import { getDateText } from "../../../../lib/utils/date";

interface ClassRender {
  id: number;
  name: string;
  icon: string;
  userMax: number;
  color: string;
  users: string[];
}

const iconStyle = {
  width: 15,
  height: 15,
  verticalAlign: -2,
  marginLeft: 6
};

export default function RaidCompoPage() {
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));

  const { loading, data, error } = useQuery<Query, UserSubsVariables>(
    USER_SUBS,
    { variables: { raidId } }
  );

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const raid = data.allRaids.nodes[0];
  const playerSubs = raid.raidPlayersSubsByRaidId.nodes;

  const playerClasses: ClassRender[] = [];

  wowClasses.forEach(({ id, name, icon }, i) => {
    playerClasses.push({
      id,
      name,
      icon,
      userMax: classesPerRaid[name],
      color: getClassColor(name, true),
      users: []
    });
  });

  playerSubs.forEach(({ playerByPlayerId }) => {
    playerClasses[playerByPlayerId.classByClassId.id].users.push(
      playerByPlayerId.name
    );
  });

  return (
    <>
      <Typography component="h2" variant="h6" color="inherit" noWrap={true}>
        Compo pour le raid à {raid.donjonByDonjonId.name} du{" "}
        {getDateText(raid.date)}
      </Typography>

      <Grid container>
        {playerClasses.map((playerClass, i) => {
          if (i === 0) {
            return null;
          }
          return (
            <Grid
              item
              xs={3}
              key={`admin-raid-compo-class-${playerClass.name}`}
            >
              <Grid container>
                <Grid xs={12}>
                  <Grid container direction="row">
                    <Grid
                      item
                      style={{
                        color: playerClass.color,
                        width: 120,
                        backgroundColor: "#242425",
                        padding: 3,
                        textAlign: "center"
                      }}
                    >
                      {playerClass.name}
                    </Grid>
                    <Grid item>
                      {playerClass.users.length} / {playerClass.userMax}
                    </Grid>
                  </Grid>
                </Grid>

                {playerClass.users.map(player => {
                  return (
                    <Grid xs={12} item key={`admin-raid-compo-class-${player}`}>
                      <img style={iconStyle} src={playerClass.icon} /> {player}
                    </Grid>
                  );
                })}
              </Grid>
            </Grid>
          );
        })}
      </Grid>
    </>
  );
}
