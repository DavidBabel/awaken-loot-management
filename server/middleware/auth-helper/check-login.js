const CONFIG = require("../../config");

const pg = require("knex")({
  client: "pg",
  connection: CONFIG.DATABASE_URL || "postgres://localhost:5432/test",
  searchPath: ["public"]
});

/**
 *
 * @param {string} username
 * @param {string} password hashed
 */
async function checkLogin(username, password) {
  let result = {};
  try {
    result = await pg
      .select("*")
      .from("Players")
      .where({
        name: username
      })
      .first();
  } catch (error) {
    console.error("Error in login");
    console.error(error);
    return false;
  }

  if (result.password && password && result.password === password) {
    console.log(`Success login : ${result}`);
    return result;
  }
  return false;
}

module.exports = {
  checkLogin
};
