// tslint:disable:no-console
// @ts-check

require("dotenv").config();

const express = require("express");
const { postgraphile } = require("postgraphile");
const CONFIG = require("./config");

const app = express();

app.use(
  postgraphile(CONFIG.DATABASE_URL, "public", {
    // classicIds: true,
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
