import { useQuery } from "@apollo/react-hooks";
import { Container, Typography } from "@material-ui/core";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { CreateRaid } from "../../components/Raid/button";
import { RaidButton } from "../../components/Raid/Raid";
import { Query } from "../../lib/generatedTypes";
import { ALL_DONJONS, ALL_RAIDS } from "../../lib/gql/raid-queries";

// import { getAll } from '../lib/helpers/graphql-helpers';

export default function PageIndex() {
  const {
    loading: loadingDonjons,
    data: dataDonjons,
    error: errorDonjons
  } = useQuery<Query>(ALL_DONJONS);
  const {
    loading: loadingRaids,
    data: dataRaids,
    error: errorRaids
  } = useQuery<Query>(ALL_RAIDS);
  // const router = useRouter();

  const loading = loadingDonjons || loadingRaids;
  const error = errorDonjons || errorRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const donjons = dataDonjons.allDonjons.edges;
  const raids = dataRaids.allRaids.nodes;

  // const raidDiffTime = 0;
  // raids[0] &&
  // moment(raids[0].date, 'YYYY-MM-DD').diff(moment()) / (1000 * 60 * 60);
  // const alreadyRaidToday = raidDiffTime > -25 && raidDiffTime < 0;

  return (
    <Container>
      <Typography variant="h3" gutterBottom={true}>
        Create new raid
      </Typography>
      {donjons
        .filter(({ node: donjon }) => donjon.active)
        .map(({ node: donjon }) => (
          <CreateRaid key={donjon.name} donjon={donjon} />
        ))}

      <Typography variant="h3" gutterBottom={true}>
        Last raids
      </Typography>
      {raids.map(raid => {
        return <RaidButton key={`raid-${raid.id}`} {...raid} />;
      })}
    </Container>
  );
}
// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
