import { useQuery } from "@apollo/react-hooks";
import { gql } from "apollo-boost";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Query } from "../../lib/generatedTypes";

const query = gql`
  query AllPlayers {
    allPlayers {
      nodes {
        name
      }
    }
    allDonjons {
      nodes {
        name
      }
    }
  }
`;

export default function PageIndex() {
  const { loading, data, error } = useQuery<Query>(query);
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  return (
    <div>
      <code>
        <pre>{JSON.stringify(data, null, 2)}</pre>
      </code>
    </div>
  );
}
