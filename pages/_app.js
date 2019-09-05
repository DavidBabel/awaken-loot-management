import App from 'next/app';
import React from 'react';
import withApolloClient from '../lib/apollo-setup/with-apollo-client';
import { ApolloProvider } from '@apollo/react-hooks';
import { Menu } from '../components/Menu/Menu';
import { Header } from '../components/page/Header';
import MemberContext from '../lib/context/member';
// import { parseCookies } from 'nookies';

class AppWithApollo extends App {
  // static async getInitialProps({ ctx }) {
  //   console.log('getInitialProps parseCookies(ctx) :');
  //   console.log(parseCookies(ctx));
  //   console.log('getInitialProps parseCookies() :');
  //   console.log(parseCookies());

  //   console.log('ctx.req.cookies :');
  //   // console.log(ctx.ctx);
  //   // const { member } = parseCookies(ctx);
  //   // const memberInfos = member ? JSON.parse(member) : {};

  //   const appProps = App.getInitialProps ? await App.getInitialProps(ctx) : {};

  //   return {
  //     // memberInfos,
  //     ...appProps
  //   };
  // }

  render() {
    const { Component, pageProps, apolloClient /* memberInfos */ } = this.props;
    // console.log('this.props.memberInfos :');
    // console.log(this.props.memberInfos);
    // console.log('component parseCookies() :');
    // console.log(parseCookies());
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
