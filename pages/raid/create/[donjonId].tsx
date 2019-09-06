import { useRouter } from 'next/router';
import { useQuery, useMutation } from '@apollo/react-hooks';
import { Query, Mutation } from '../../../lib/generatedTypes';
import { ONE_DONJON, CREATE_RAID } from '../../../lib/gql/raid-queries';
import { LoadingAndError } from '../../../components/LoadingAndErrors';
import { useState } from 'react';
import { DatePicker } from '../../../components/DatePicker';
import { Button, Typography, Avatar, Grid } from '@material-ui/core';

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

  const [selectedDate, setSelectedDate] = useState('');
  const [isButtonDisabled, setButtonDisabled] = useState(false);

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const currentDonjon = donjonData.allDonjons.edges[0].node;
  return (
    <>
      <Typography>Create a raid for</Typography>
      <Grid container>
        <Grid item>
          <Avatar
            alt={currentDonjon.name}
            src={`/static/images/avatar/${currentDonjon.shortName}.jpg`}
          />
        </Grid>
        <Grid item>
          <Typography variant="h2" gutterBottom>
            {currentDonjon.name} ({currentDonjon.shortName})
          </Typography>
        </Grid>
      </Grid>
      <Grid container alignItems="flex-end" spacing={5}>
        <Grid item>
          <Typography>Raid date :</Typography>
        </Grid>
        <Grid item>
          <DatePicker
            selectedDate={selectedDate}
            setSelectedDate={setSelectedDate}
          />
        </Grid>
        <Grid item>
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
