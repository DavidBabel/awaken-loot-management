import React from 'react';
import initApollo from './init-apollo';
import Head from 'next/head';
import { getDataFromTree } from '@apollo/react-ssr';
import { parseCookies } from 'nookies';

export default App => {
  return class Apollo extends React.Component {
    static displayName = 'withApollo(App)';
    static async getInitialProps(context) {
      // cookie parsing to extract token and member infos
      const { member } = parseCookies(context.ctx);
      let memberInfos = {};
      try {
        memberInfos = JSON.parse(member);
      } catch (o_O) {}

      const { AppTree } = context;

      let appProps = {};
      if (App.getInitialProps) {
        appProps = await App.getInitialProps(context);
      }

      // Run all GraphQL queries in the component tree
      // and extract the resulting data
      const apollo = initApollo(undefined, {
        getToken: () => (memberInfos && memberInfos.token) || ''
      });
      if (typeof window === 'undefined') {
        try {
          // Run all GraphQL queries
          await getDataFromTree(
            <AppTree {...appProps} apolloClient={apollo} />
          );
        } catch (error) {
          // Prevent Apollo Client GraphQL errors from crashing SSR.
          // Handle them in components via the data.error prop:
          // https://www.apollographql.com/docs/react/api/react-apollo.html#graphql-query-data-error
          console.error('Error while running `getDataFromTree`', error);
        }

        // getDataFromTree does not call componentWillUnmount
        // head side effect therefore need to be cleared manually
        Head.rewind();
      }

      // Extract query data from the Apollo store
      const apolloState = apollo.cache.extract();

      return {
        ...appProps,
        apolloState,
        memberInfos
      };
    }

    constructor(props) {
      super(props);
      this.apolloClient = initApollo(props.apolloState, {
        getToken: () => (props.memberInfos && props.memberInfos.token) || ''
      });
    }

    render() {
      return (
        <App
          apolloClient={this.apolloClient}
          memberInfos={this.props.memberInfos}
          {...this.props}
        />
      );
    }
  };
};
