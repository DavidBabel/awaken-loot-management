import { useQuery } from '@apollo/react-hooks';
import { Query } from '../../lib/generatedTypes';
import { ALL_DONJONS, ALL_RAIDS } from '../../lib/gql/raid-queries';
import { useRouter } from 'next/router';
import moment from 'moment';
import { RaidButton } from '../../components/Raid/Raid';
import { LoadingAndError } from '../../components/LoadingAndErrors';

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
  const router = useRouter();

  const loading = loadingDonjons || loadingRaids;
  const error = errorDonjons || errorRaids;

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const donjons = dataDonjons.allDonjons.edges;
  const raids = dataRaids.allRaids.nodes;

  const raidDiffTime =
    raids[0] &&
    moment(raids[0].date, 'YYYY-MM-DD').diff(moment()) / (1000 * 60 * 60);
  const alreadyRaidToday = raidDiffTime > -25 && raidDiffTime < 0;

  const renderDonjons = donjons
    .filter(({ node: donjon }) => donjon.active)
    .map(({ node: donjon }) => {
      return (
        <div key={donjon.name}>
          {donjon.name}

          <button
            onClick={() => {
              const redir = () => router.push('/createRaid', {});
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

          {/* {donjon.bossesByDonjonId.nodes.map((boss: any) => {
            return <div key={boss.name}> > {boss.name}</div>;
          })} */}
        </div>
      );
    });

  return (
    <>
      <div>
        <h2>Create new raids</h2>
        {renderDonjons}
      </div>

      <div>
        <h2>Last raids</h2>
        {raids.map(raid => {
          return (
            <div key={`raid-${raid.id}`}>
              <RaidButton {...raid}>{JSON.stringify(raid)}</RaidButton>
            </div>
          );
        })}
      </div>
    </>
  );
}
// TODO
// helper getAll (object , key) sur le graphql

// TODO try to use getInitialProps
