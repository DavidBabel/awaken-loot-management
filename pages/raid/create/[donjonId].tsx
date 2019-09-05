import { useRouter } from 'next/router';
import { useQuery, useMutation } from '@apollo/react-hooks';
import { Query } from '../../../lib/generatedTypes';
import { ONE_DONJON, CREATE_RAID } from '../../../lib/gql/raid-queries';
import { LoadingAndError } from '../../../components/LoadingAndErrors';

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

  const { loading, data, error } = useQuery<Query, QueryVariables>(ONE_DONJON, {
    variables: { donjonId }
  });

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  return (
    <div>
      <pre>
        <code>{JSON.stringify(data, null, 2)}</code>
        <button
          onClick={async () => {
            const [loading, data] = await useMutation<Query, MutationVariables>(
              CREATE_RAID,
              {
                variables: { date: '2019-10-10', donjonId }
              }
            );
            console.log(loading);
            console.log(data);
          }}
        >
          Create raid
        </button>
      </pre>
    </div>
  );
}
