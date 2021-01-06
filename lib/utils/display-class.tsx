import { makeStyles } from "@material-ui/core";
import Link from "next/link";
import ClassAvatar from "../../components/ClassAvatar";
import { RaidPlayer } from "../generatedTypes";

const useStyles = makeStyles({
  column: {
    width: 120,
    padding: 5,
    display: "flex",
    flexDirection: "column",
    backgroundColor: "#242424",
    "& a": {
      textDecoration: "none",
      padding: 2
    },
    "& a:hover": {
      backgroundColor: "#3F51B5"
    }
  }
});

export function displayClass(
  className: string,
  raidPlayers: RaidPlayer[],
  withAvatar: boolean = true
) {
  const classes = useStyles("");
  const classPlayers = raidPlayers.filter(player =>
    player.playerByPlayerId.classByClassId.name.includes(className)
  );

  return (
    <div className={classes.column}>
      {withAvatar && <ClassAvatar playerClass={className} />}

      {classPlayers.map((player: RaidPlayer) => (
        <Link
          key={`playerlist${player.playerByPlayerId.name}`}
          href="/player/view/[id]"
          as={`/player/view/${player.playerByPlayerId.id}`}
        >
          <a
            target="_blank"
            style={{
              color: player.playerByPlayerId.classByClassId.color
            }}
          >
            {player.playerByPlayerId.name}
          </a>
        </Link>
      ))}
    </div>
  );
}
