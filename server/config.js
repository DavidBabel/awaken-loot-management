module.exports = {
  COOKIE_LIFE: 60 * 60 * 12, // 12h
  GRAPHQL_ENDPOINT: process.env.GRAPHQL_ENDPOINT || "api/queries",
  JWT_SECRET: process.env.JWT_SECRET || "any",
  SERVER_PORT: process.env.PORT || 5000,
  SERVER_URL: process.env.SERVER_URL || "http://localhost:3000"
};
