const pg = require("knex")({
  client: "pg",
  connection: process.env.DATABASE_URL || "postgres://localhost:5432/test",
  searchPath: ["public"]
});
/**
 *
 * @param {Express.Request} req
 * @param {Express.Response} res
 */
module.exports = async function compoRoute(req, res) {
  const raidId = req.params.raidId;
  let result = {};
  try {
    result = await pg
      .select("name")
      .select("classId")
      .select("status")
      .from("RaidPlayersSubs")
      .where({
        raidId
      })
      .innerJoin("Players", "RaidPlayersSubs.playerId", "Players.id");
  } catch (error) {
    res.send("a pa marché");
    return false;
  }

  const formattedPlayers = result.reduce(
    (stack, { classId, status, name }) => {
      stack[status][classId].push(name);
      return stack;
    },
    [
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []],
      [[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]
    ]
  );

  let output = "";

  output += "<table>";
  for (let statusIndex = 1; statusIndex < 5; statusIndex++) {
    const currentStatus = formattedPlayers[statusIndex];
    output += "<tr><td> Status: ";
    output += statusIndex;
    output += "</td></tr>";
    for (let classIndex = 1; classIndex <= 13; classIndex++) {
      const players = currentStatus[classIndex];
      output += "<tr>";
      output += "<td>";
      output += classIndex;
      output += "</td>";
      players.forEach(player => {
        output += "<td>";
        output += player;
        output += "</td>";
      });
      output += "</tr>";
    }
  }
  output += "</table>";

  res.send(
    `
<html>
  <body>
    ${output}
  </body>
</html>
    `
  );
};
