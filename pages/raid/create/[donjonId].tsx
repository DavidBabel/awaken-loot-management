import { useMutation, useQuery } from "@apollo/react-hooks";
import { Avatar, Button, Container, Grid, Typography } from "@material-ui/core";
import { useRouter } from "next/router";
import { useContext, useState } from "react";
import { DatePicker } from "../../../components/DatePicker";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import MemberContext from "../../../lib/context/member";
import { Mutation, Query } from "../../../lib/generatedTypes";
import { CREATE_RAID } from "../../../lib/gql/raid-mutations";
import { ONE_DONJON } from "../../../lib/gql/raid-queries";
import { formatDate } from "../../../lib/utils/date";
import { getDonjonImageUrl } from "../../../lib/utils/image";

interface QueryVariables {
  donjonId: number;
}
interface MutationVariables {
  date: string;
  donjonId: number;
  title: string;
}

export default function PageCreateRaid() {
  const router = useRouter();
  const member = useContext(MemberContext);
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

  const [selectedDate, setSelectedDate] = useState(formatDate());
  const [isButtonDisabled, setButtonDisabled] = useState(false);

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const currentDonjon = donjonData.allDonjons.edges[0].node;
  return (
    <Container>
      <Typography>Créer un raid pour :</Typography>
      <Grid container={true}>
        <Grid item={true}>
          <Typography variant="h2" gutterBottom={true}>
            {currentDonjon.name} ({currentDonjon.shortName})
          </Typography>
        </Grid>
        <Grid item={true}>
          <Avatar
            alt={currentDonjon.name}
            style={{ marginLeft: 60, width: 76, height: 76 }}
            src={
              currentDonjon?.cdnImage || getDonjonImageUrl(currentDonjon.name)
            }
          />
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
      </Grid>
      <Grid container={true} alignItems="flex-end" spacing={5}>
        <Grid item={true}>
          <Typography>Saisie des loots :</Typography>
        </Grid>
        <Grid item={true}>
          {member.name} (pourra être changé ultérieurement)
        </Grid>
      </Grid>
      <Grid container direction="column" style={{ width: 450, marginTop: 90 }}>
        <Button
          disabled={isButtonDisabled}
          variant="outlined"
          color="primary"
          onClick={() => {
            setButtonDisabled(true);
            createRaid({
              variables: { date: selectedDate, donjonId, title: member.name }
            })
              .then(
                ({
                  data: {
                    createRaid: { raid }
                  }
                }) => {
                  router.push(`/raid/edit/${raid.id}`);
                }
              )
              .catch(err => {
                alert(`Did not work ${err}`);
              });
          }}
        >
          Créer le raid et l'afficher
        </Button>

        <Button
          disabled={isButtonDisabled}
          variant="outlined"
          color="primary"
          onClick={() => {
            setButtonDisabled(true);
            createRaid({
              variables: { date: selectedDate, donjonId, title: member.name }
            })
              .then(
                ({
                  data: {
                    createRaid: { raid }
                  }
                }) => {
                  router.push(`/raid`);
                }
              )
              .catch(err => {
                alert(`Did not work ${err}`);
              });
          }}
        >
          Créer le raid et revenir à la liste
        </Button>
      </Grid>
    </Container>
  );
}
