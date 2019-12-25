import Router from "next/router";
import { Component } from "react";

export abstract class Redirect extends Component {
  public static to: string;

  public static async getInitialProps({ res }) {
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
