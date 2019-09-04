import App, { Container } from 'next/app';
import React from 'react';
import withApolloClient from '../lib/apollo-setup/with-apollo-client';
import { ApolloProvider } from '@apollo/react-hooks';
import { Menu } from '../components/Menu/Menu';
import { Header } from '../components/page/Header';
import MemberContext from '../lib/context/member';

class AppWithApollo extends App {
  render() {
    const { Component, pageProps, apolloClient } = this.props;
    const isBrowser = typeof window !== 'undefined';
    let memberInfos = {};
    if (isBrowser) {
      memberInfos = JSON.parse(localStorage.getItem('member'));
    }

    return (
      <Container>
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
      </Container>
    );
  }
}

export default withApolloClient(AppWithApollo);
