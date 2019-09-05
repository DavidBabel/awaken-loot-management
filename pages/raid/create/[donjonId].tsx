import { useRouter } from 'next/router';
import { useQuery } from '@apollo/react-hooks';
import { Query } from '../../../lib/generatedTypes';
import { ONE_DONJON } from '../../../lib/gql/raid-queries';
import { LoadingAndError } from '../../../components/LoadingAndErrors';

interface Variables {
  donjonId: number;
}

export default function PageCreateRaid() {
  const router = useRouter();
  const donjonId = parseInt(String(router.query.donjonId));

  const { loading, data, error } = useQuery<Query, Variables>(ONE_DONJON, {
    variables: { donjonId }
  });

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  return (
    <div>
      <pre>
        <code>{JSON.stringify(data, null, 2)}</code>
      </pre>
    </div>
  );
}
