import React from 'react';
import { parseCookies } from 'nookies';
const Home = () => {
  return <div>Salut</div>;
};

Home.getInitialProps = ctx => {
  console.log('page parseCookies(ctx)');
  console.log(parseCookies(ctx));
  return {};
};

export default Home;
