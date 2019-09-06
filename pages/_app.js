import 'date-fns';
import App from 'next/app';
import React from 'react';
import withApolloClient from '../lib/apollo-setup/with-apollo-client';
import { ApolloProvider } from '@apollo/react-hooks';
import { Menu } from '../components/Menu/Menu';
import { Header } from '../components/page/Header';
import MemberContext from '../lib/context/member';

class AppWithApollo extends App {
  render() {
    const { Component, pageProps, apolloClient, memberInfos = {} } = this.props;
    return (
      <ApolloProvider client={apolloClient}>
        <Header />
        <MemberContext.Provider value={memberInfos}>
          <div style={{ display: 'flex' }}>
            <Menu />
            <div>
              <Component {...pageProps} />
            </div>
          </div>
        </MemberContext.Provider>
      </ApolloProvider>
    );
  }
}

export default withApolloClient(AppWithApollo);
