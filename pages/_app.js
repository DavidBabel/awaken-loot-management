import "date-fns";
import App from "next/app";
import React from "react";
import withApolloClient from "../lib/apollo-setup/with-apollo-client";
import { ApolloProvider } from "@apollo/react-hooks";
// import { Menu } from "../components/Menu/Menu";
import { Dashboard } from "../components/Dashboard";
import { Header } from "../components/page/Header";
// import { BottomNav } from "../components/page/BottomNavigation";
import MemberContext from "../lib/context/member";

class AppWithApollo extends App {
  render() {
    const { Component, pageProps, apolloClient, memberInfos = {} } = this.props;
    return (
      <ApolloProvider client={apolloClient}>
        <Header />
        <MemberContext.Provider value={memberInfos}>
          <Dashboard>
            <Component {...pageProps} />
          </Dashboard>
          {/* <BottomNav /> */}
        </MemberContext.Provider>
      </ApolloProvider>
    );
  }
}

export default withApolloClient(AppWithApollo);
