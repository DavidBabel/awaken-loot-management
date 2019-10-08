module.exports = {
  COOKIE_LIFE: 60 * 60 * 12, // 12h
  // postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
  DATABASE_URL: process.env.DATABASE_URL || "postgres://localhost:5432/test",
  DATE_FORMAT: "yyyy-MM-dd",
  GRAPHQL_ENDPOINT: process.env.GRAPHQL_ENDPOINT || "api/queries",
  JWT_SECRET: process.env.JWT_SECRET || "any",
  SERVER_URL: process.env.SERVER_URL || "http://localhost:3000"
};
