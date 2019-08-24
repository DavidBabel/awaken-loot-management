const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const { postgraphile } = require('postgraphile');
const checkRoleMiddleware = require('./middleware/check-role');
const checkTokenMiddleware = require('./middleware/check-token');
const loginControler = require('./controlers/login');

const app = express();
app.use(cors());
app.use(bodyParser.json());
app.use(cookieParser());

app.post('/login', loginControler);

app.use('/graphql', checkTokenMiddleware);
app.use('/graphql', checkRoleMiddleware);

app.use(
  postgraphile(
    process.env.DATABASE_URL || 'postgres://localhost:5432/test',
    'public',
    {
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true
    }
  )
);

const port = process.env.PORT || 5000;
app.listen(port, () =>
  console.log(
    `Server started on port ${port}
  http://localhost:${port}/
  http://localhost:${port}/graphiql
`
  )
);
