import { useQuery } from '@apollo/react-hooks';
import { Query } from '../../lib/generatedTypes';
import { ALL_DONJONS, ALL_RAIDS } from '../../lib/gql/raid-queries';
import { RaidButton } from '../../components/Raid/Raid';
import { LoadingAndError } from '../../components/LoadingAndErrors';
import { Typography } from '@material-ui/core';
import { CreateRaid } from '../../components/Raid/button';

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

  const renderDonjons = donjons
    .filter(({ node: donjon }) => donjon.active)
    .map(({ node: donjon }) => {
      return (
        <CreateRaid key={donjon.name} donjon={donjon} />
        /*     <div key={donjon.name}>
          {donjon.name}

          <button
            onClick={() => {
              const redir = () => router.push(`/raid/create/${donjon.id}`);
              if (alreadyRaidToday) {
                if (confirm('You already raid today, create a new one ?')) {
                  redir();
                }
              } else {
                redir();
              }
            }}
          >
            Create a raid for {donjon.name}
          </button>

        </div> */
      );
    });

  return (
    <>
      <Typography variant="h3" gutterBottom>
        Create new raid
      </Typography>
      <div>
        <h2></h2>
        {renderDonjons}
      </div>

      <Typography variant="h3" gutterBottom>
        Last raids
      </Typography>
      {raids.map(raid => {
        return <RaidButton key={`raid-${raid.id}`} {...raid}></RaidButton>;
      })}
    </>
  );
}
// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
