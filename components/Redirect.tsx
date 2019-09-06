import { Component } from 'react';
import Router from 'next/router';

export abstract class Redirect extends Component {
  static to: string;

  static async getInitialProps({ res }) {
    if (res) {
      res.writeHead(302, {
        Location: this.to
      });
      res.end();
    } else {
      Router.push(this.to);
    }
    return {};
  }
}
