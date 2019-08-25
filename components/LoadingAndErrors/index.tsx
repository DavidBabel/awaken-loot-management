import { ApolloError } from 'apollo-boost';

interface Props {
  loading: boolean;
  error: ApolloError;
}

export function LoadingAndError({ loading, error }: Props) {
  if (error) return <div>{JSON.stringify(error, null, 2)}</div>;
  if (loading) return <div>Loading</div>;
  return null;
}
