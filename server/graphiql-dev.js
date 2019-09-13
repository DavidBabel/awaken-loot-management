require('dotenv').config();
const express = require('express');
// const cors = require('cors');
// const bodyParser = require('body-parser');
// const cookieParser = require('cookie-parser');

const { postgraphile } = require('postgraphile');

const app = express();
// app.use(cors());
// app.use(bodyParser.json());
// app.use(cookieParser());

app.use(
  postgraphile(
    // TODO move to config
    process.env.DATABASE_URL || 'postgres://localhost:5432/test',
    'public',
    {
      graphqlRoute: '/',
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true
    }
  )
);

const port = 5000;
const endpoint = 'graphiql';
app.listen(port, () =>
  console.log(
    `You graphiql for dev env is started on port ${port}
  http://localhost:${port}/${endpoint}
`
  )
);
