// @ts-check

const { postgraphile } = require('postgraphile');
const checkRoleMiddleware = require('./middleware/check-role');
const checkTokenMiddleware = require('./middleware/check-token');
const loginControler = require('./controlers/login');

const express = require('express');
const next = require('next');

const cors = require('cors');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const dev = process.env.NODE_ENV !== 'production';
// @ts-ignore
const app = next({ dev });
const handle = app.getRequestHandler();

app
  .prepare()
  .then(() => {
    const server = express();

    server.use(cors());
    server.use(bodyParser.json());
    server.use(cookieParser());

    server.post('/api/login', loginControler);

    server.use(
      '/api/queries',
      checkTokenMiddleware,
      checkRoleMiddleware,
      postgraphile(
        process.env.DATABASE_URL || 'postgres://localhost:5432/test',
        'public',
        {
          externalUrlBase: '/api/queries',
          graphqlRoute: '/'
        }
      )
    );

    server.get('*', (req, res) => {
      return handle(req, res);
    });

    server.listen(3000, err => {
      if (err) throw err;
      console.log('> Ready on http://localhost:3000');
    });
  })
  .catch(ex => {
    console.error(ex.stack);
    process.exit(1);
  });
