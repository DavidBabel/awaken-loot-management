import App, { Container } from 'next/app';
import React from 'react';
import withApolloClient from '../lib/apollo-setup/with-apollo-client';
import { ApolloProvider } from '@apollo/react-hooks';
import { Header } from '../components/page/Header';
import { Menu } from '../components/Menu/Menu';

class AppWithApollo extends App {
  render() {
    const { Component, pageProps, apolloClient } = this.props;
    return (
      <Container>
        <ApolloProvider client={apolloClient}>
          <Header />
          <Menu />
          <div style={{ marginLeft: 300 }}>
            <Component {...pageProps} />
          </div>
        </ApolloProvider>
      </Container>
    );
  }
}

export default withApolloClient(AppWithApollo);
