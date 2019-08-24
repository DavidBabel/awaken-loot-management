import { useQuery } from '@apollo/react-hooks';
import { Query } from '../lib/generatedTypes';
import { ALL_DONJONS, ALL_RAIDS } from '../lib/gql/queries';

export default function PageIndex() {
  const {
    loading: loadingDonjons,
    data: dataDonjons,
    error: errorDonjons
  } = useQuery<Query>(ALL_DONJONS, {});
  const {
    loading: loadingRaids,
    data: dataRaids,
    error: errorRaids
  } = useQuery<Query>(ALL_RAIDS, {});
  if (errorDonjons || errorRaids)
    return (
      <div>
        {JSON.stringify(errorDonjons, null, 2)}
        <br />
        <br />
        {JSON.stringify(errorRaids, null, 2)}
      </div>
    );
  if (loadingDonjons || loadingRaids) return <div>Loading</div>;

  // TODO
  // helper getAll (object , key) sur le graphql

  const donjons = dataDonjons.allDonjons.edges;
  const renderDOnjons = donjons
    .filter(({ node: donjon }) => donjon.active)
    .map(({ node: donjon }) => {
      return (
        <div key={donjon.name}>
          {donjon.name}

          {/* {donjon.bossesByDonjonId.nodes.map((boss: any) => {
            return <div key={boss.name}> > {boss.name}</div>;
          })} */}
        </div>
      );
    });

  const raids = dataRaids.allRaids.edges;
  const renderRaids = <div>{JSON.stringify(raids)}</div>;

  return (
    <>
      {renderDOnjons}
      {renderRaids}
    </>
  );
}
