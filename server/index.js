const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const { postgraphile } = require('postgraphile');
const checkRoleMiddleware = require('./middleware/check-role');
const checkTokenMiddleware = require('./middleware/check-token');
const loginControler = require('./controlers/login');

const CONFIG = require('./config');

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(cookieParser());

app.post('/login', loginControler);

app.use(`/${CONFIG.GRAPHQL_ENDPOINT}`, checkTokenMiddleware);
app.use(`/${CONFIG.GRAPHQL_ENDPOINT}`, checkRoleMiddleware);

app.use(
  postgraphile(
    process.env.DATABASE_URL || 'postgres://localhost:5432/test',
    'public',
    {
      // graphqlRoute: '/' + CONFIG.GRAPHQL_ENDPOINT,
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true
    }
  )
);

const port = CONFIG.SERVER_PORT;
const endpoint = CONFIG.GRAPHQL_ENDPOINT;
app.listen(port, () =>
  console.log(
    `Server started on port ${port}
  http://localhost:${port}/
  http://localhost:${port}/${endpoint}
`
  )
);
