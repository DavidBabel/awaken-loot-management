import { ApolloError } from "apollo-boost";
import Link from "next/link";
import { useState } from "react";

interface Props {
  loading: boolean;
  error: ApolloError;
}

export function LoadingAndError({ loading, error }: Props) {
  const [showError, setShowError] = useState(false);

  if (error) {
    return (
      <div>
        <p>
          An error occured, are you{" "}
          <Link href="/login">
            <a>logged in</a>
          </Link>{" "}
          ?
        </p>
        <button onClick={() => setShowError(!showError)}>
          {showError ? "Hide" : "Show"} error
        </button>
        {showError && (
          <div>
            <pre>
              <code>{JSON.stringify(error, null, 2)}</code>
            </pre>
          </div>
        )}
      </div>
    );
  }
  if (loading) {
    return <div>Loading</div>;
  }
  return null;
}
