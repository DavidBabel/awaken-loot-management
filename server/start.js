// tslint:disable:no-console
// @ts-check

require("dotenv").config();

const {
  postgraphile
  // , makePluginHook
} = require("postgraphile");
const checkRoleMiddleware = require("./middleware/check-role");
const checkTokenMiddleware = require("./middleware/check-token");
const loginControler = require("./controlers/login");
const compoControler = require("./controlers/compo");
const discordControler = require("./controlers/discord");
// const PersistedOperationsPlugin = require("@graphile/persisted-operations");
const ConnectionFilterPlugin = require("postgraphile-plugin-connection-filter");

const express = require("express");
const next = require("next");

const cors = require("cors");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const compression = require("compression");
// const pluginHook = makePluginHook([PersistedOperationsPlugin]);

const CONFIG = require("./config");

const dev = process.env.NODE_ENV !== "production";
// @ts-ignore
const app = next({ dev });
const handle = app.getRequestHandler();

app
  .prepare()
  .then(() => {
    const server = express();

    server.use(compression());
    server.use(cors());
    server.use(bodyParser.json());
    server.use(cookieParser());

    server.post("/api/login", loginControler);

    server.use(
      `/${CONFIG.GRAPHQL_ENDPOINT}`,
      checkTokenMiddleware,
      checkRoleMiddleware,
      postgraphile(
        process.env.DATABASE_URL || "postgres://localhost:5432/test",
        "public",
        {
          // classicIds: true,
          // persistedOperationsDirectory: `${__dirname}/.persisted_operations/`,
          // pluginHook,
          // @ts-ignore
          appendPlugins: [ConnectionFilterPlugin],
          connectionFilterComputedColumns: false, // default: true
          connectionFilterSetofFunctions: false, // default: true
          enableQueryBatching: true,
          externalUrlBase: `/${CONFIG.GRAPHQL_ENDPOINT}`,
          graphqlRoute: "/"
        }
      )
    );

    server.post("/api/discord", checkTokenMiddleware, discordControler);

    server.get("/compo/:raidId", compoControler);

    server.get("*", (req, res) => {
      return handle(req, res);
    });

    const port = process.env.PORT || 3000;
    server.listen(port, err => {
      if (err) {
        throw err;
      }
      console.log(`> Ready on http://localhost:${port}`);
    });
  })
  .catch(ex => {
    console.error(ex.stack);
    process.exit(1);
  });
