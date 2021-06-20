// tslint:disable:no-console
// @ts-check

function runServer(isDev = true) {
  require("dotenv").config();

  const express = require("express");
  const { postgraphile } = require("postgraphile");
  const CONFIG = require("../config");
  // const ConnectionFilterPlugin = require("postgraphile-plugin-connection-filter");

  const app = express();

  const dbUrl = isDev
    ? process.env.DATABASE_URL + "/" + process.env.DBNAME
    : process.env.PROD_DB;
  const databaseUrl = dbUrl || "postgres://localhost:5432/test";

  app.use(
    postgraphile(databaseUrl, "public", {
      // classicIds: true,
      // @ts-ignore
      // appendPlugins: [ConnectionFilterPlugin],
      // connectionFilterComputedColumns: false, // default: true
      // connectionFilterSetofFunctions: false, // default: true
      enableQueryBatching: true,
      enhanceGraphiql: true,
      graphiql: true,
      graphqlRoute: "/",
      watchPg: true
    })
  );

  const port = 5000;
  const endpoint = "graphiql";
  app.listen(port, () =>
    console.log(
      `You graphiql for dev env is started on port ${port}
    http://localhost:${port}/${endpoint}
  `
    )
  );
}

module.exports = {
  runServer
};
