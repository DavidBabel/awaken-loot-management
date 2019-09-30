players = `

`;

alreadyFound = [];

uniqPlayers = players
  .split("),")
  .map(x => x.split(","))
  .filter(x => {
    if (alreadyFound.includes(x[0])) {
      return false;
    } else {
      alreadyFound.push(x[0]);
      return true;
    }
  });

copy(uniqPlayers.map(x => x.join(",")).join("),"));
