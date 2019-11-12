// postgresql://[user[:password]@][netloc][:port][/dbname][?param1=value1&...]
module.exports = {
  COOKIE_LIFE: 60 * 60 * 12, // 12h
  DATE_FORMAT: "yyyy-MM-dd",
  GRAPHQL_ENDPOINT: process.env.GRAPHQL_ENDPOINT || "api/queries",
  JWT_SECRET: process.env.JWT_SECRET || "any",
  SALT: "this_is_awaken_and_we_will_kill_Kelthuzad",
  SERVER_URL: process.env.SERVER_URL || "http://localhost:3000"
};
