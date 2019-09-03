import App, { Container } from 'next/app';
import React from 'react';
import withApolloClient from '../lib/apollo-setup/with-apollo-client';
import { ApolloProvider } from '@apollo/react-hooks';
import { Menu } from '../components/Menu/Menu';

class AppWithApollo extends App {
  render() {
    const { Component, pageProps, apolloClient } = this.props;
    console.log(this.props);
    return (
      <Container>
        <ApolloProvider client={apolloClient}>
          <div style={{ display: 'flex' }}>
            <Menu />
            <div>
              <Component {...pageProps} />
            </div>
          </div>
        </ApolloProvider>
      </Container>
    );
  }
}

export default withApolloClient(AppWithApollo);
