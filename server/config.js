module.exports = {
  SERVER_PORT: process.env.PORT || 5000,
  SERVER_URL: process.env.SERVER_URL || 'http://localhost:5000',
  GRAPHQL_ENDPOINT: process.env.GRAPHQL_ENDPOINT || 'api',
  JWT_SECRET: process.env.JWT_SECRET || 'any',
  COOKIE_LIFE: 60 * 60 * 12 // 12h
};
