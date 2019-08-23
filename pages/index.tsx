import * as React from 'react';

import { useQuery } from '@apollo/react-hooks';
import { Query } from '../lib/generatedTypes';
import { ALL_DONJONS } from '../lib/gql/requests';

export default function PageIndex() {
  const { loading, data, error } = useQuery<Query>(ALL_DONJONS, {});
  if (error) return <div>{JSON.stringify(error)}</div>;
  if (loading) return <div>Loading</div>;

  const donjons = data.allDonjons.edges;
  return donjons.map(({ node: donjon }) => {
    return (
      <div key={donjon.name}>
        {donjon.name}

        {donjon.bossesByDonjonId.nodes.map((boss: any) => {
          return <div key={boss.name}> > {boss.name}</div>;
        })}
      </div>
    );
  });
}
