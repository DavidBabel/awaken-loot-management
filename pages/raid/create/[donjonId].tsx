import { useMutation, useQuery } from "@apollo/react-hooks";
import { Avatar, Button, Grid, Typography } from "@material-ui/core";
import { useRouter } from "next/router";
import { useState } from "react";
import { DatePicker } from "../../../components/DatePicker";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { Mutation, Query } from "../../../lib/generatedTypes";
import { CREATE_RAID, ONE_DONJON } from "../../../lib/gql/raid-queries";

interface QueryVariables {
  donjonId: number;
}
interface MutationVariables {
  date: string;
  donjonId: number;
}

export default function PageCreateRaid() {
  const router = useRouter();
  const donjonId = parseInt(String(router.query.donjonId));

  const {
    loading: loadingDonjon,
    data: donjonData,
    error: errorDonjon
  } = useQuery<Query, QueryVariables>(ONE_DONJON, {
    variables: { donjonId }
  });

  const [
    createRaid,
    { loading: loadingCreateRaid, /* data: raidData, */ error: errorCreateRaid }
  ] = useMutation<Mutation, MutationVariables>(CREATE_RAID);

  const loading = loadingDonjon || loadingCreateRaid;
  const error = errorDonjon || errorCreateRaid;

  const [selectedDate, setSelectedDate] = useState("");
  const [isButtonDisabled, setButtonDisabled] = useState(false);

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const currentDonjon = donjonData.allDonjons.edges[0].node;
  return (
    <>
      <Typography>Create a raid for</Typography>
      <Grid container={true}>
        <Grid item={true}>
          <Avatar
            alt={currentDonjon.name}
            src={`/static/images/avatar/${currentDonjon.shortName}.jpg`}
          />
        </Grid>
        <Grid item={true}>
          <Typography variant="h2" gutterBottom={true}>
            {currentDonjon.name} ({currentDonjon.shortName})
          </Typography>
        </Grid>
      </Grid>
      <Grid container={true} alignItems="flex-end" spacing={5}>
        <Grid item={true}>
          <Typography>Raid date :</Typography>
        </Grid>
        <Grid item={true}>
          <DatePicker
            selectedDate={selectedDate}
            setSelectedDate={setSelectedDate}
          />
        </Grid>
        <Grid item={true}>
          <Button
            disabled={isButtonDisabled}
            variant="outlined"
            color="primary"
            onClick={() => {
              setButtonDisabled(true);
              // TODO check if it's already created here
              createRaid({ variables: { date: selectedDate, donjonId } })
                .then(({ data: { createRaid: { raid } } }) => {
                  router.push(`/raid/edit/${raid.id}`);
                })
                .catch(err => {
                  alert(`Did not work ${err}`);
                });
            }}
          >
            Create raid
          </Button>
        </Grid>
      </Grid>
    </>
  );
}
