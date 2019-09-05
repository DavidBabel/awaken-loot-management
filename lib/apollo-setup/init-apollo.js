import {
  ApolloClient,
  ApolloLink,
  InMemoryCache,
  HttpLink
} from 'apollo-boost';
import fetch from 'isomorphic-unfetch';
import CONFIG from '../../server/config';
import { parseCookies } from 'nookies';

let apolloClient = null;
const isBrowser = typeof window !== 'undefined';

const authLink = new ApolloLink((operation, forward) => {
  const { member } = parseCookies();
  const token = member ? JSON.parse(member).token : '';
  console.log('apollo token');
  console.log(token);
  // const token = localStorage.getItem('token');
  operation.setContext({
    headers: {
      // authorization: token ? `Bearer ${token}` : ''
      authorization: token ? `${token}` : ''
    }
  });
  return forward(operation);
});

const httpLink = new HttpLink({
  uri: `${CONFIG.SERVER_URL}/${CONFIG.GRAPHQL_ENDPOINT}`, // Server URL (must be absolute)

  // TODO : in prod ?
  // credentials: 'same-origin', // Additional fetch() options like `credentials` or `headers`
  // Use fetch() polyfill on the server
  fetch: !isBrowser && fetch
});

function create(initialState) {
  // Check out https://github.com/zeit/next.js/pull/4611 if you want to use the AWSAppSyncClient
  return new ApolloClient({
    connectToDevTools: isBrowser,
    ssrMode: !isBrowser, // Disables forceFetch on the server (so queries are only run once)
    link: authLink.concat(httpLink),
    cache: new InMemoryCache().restore(initialState || {})
  });
}

export default function initApollo(initialState) {
  // Make sure to create a new client for every server-side request so that data
  // isn't shared between connections (which would be bad)
  if (typeof window === 'undefined') {
    return create(initialState);
  }

  // Reuse client on the client-side
  if (!apolloClient) {
    apolloClient = create(initialState);
  }

  return apolloClient;
}
