import { useQuery } from "@apollo/react-hooks";
import { Button, Paper, Switch } from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import Link from "next/link";
import { useRouter } from "next/router";
import { useContext, useEffect, useState } from "react";
import { LoadingAndError } from "../../../components/LoadingAndErrors";
import { BossCard } from "../../../components/Raid/BossCard";
import PlayerList from "../../../components/Raid/PlayerList";
import RaidTitleButton from "../../../components/Raid/RaidTitleButton";
import MemberContext from "../../../lib/context/member";
import { Player, Query, RaidPlayer } from "../../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../../lib/gql/player-queries";
import { ONE_RAID } from "../../../lib/gql/raid-queries";
import { useToggle } from "../../../lib/hooks/toggle";
import { role } from "../../../lib/role-level";
import { getDate } from "../../../lib/utils/date";
import { raidPlayerByClass } from "../../../lib/utils/sorter";

interface QueryVariables {
  raidId: number;
}

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      width: "100%",
      display: "flex",
      flexDirection: "column",
      alignItems: "center",
      justifyContent: "center"
    },
    raidInfos: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      padding: "10px 0",
      marginBottom: 35,
      position: "relative",
      textAlign: "center",
      [theme.breakpoints.down("sm")]: {
        marginBottom: 45,
        width: "100%"
      }
    },
    raidTitle: {
      fontSize: 22,
      fontWeight: "bold",
      height: "48px",
      margin: "0px 40px 15px 40px",
      display: "flex",
      alignItems: "center"
    },
    playerListBtn: {
      position: "absolute",
      top: "65px",
      zIndex: 4
    },
    bossCards: {
      width: "100%",
      display: "flex",
      flexWrap: "wrap",
      justifyContent: "center",
      position: "relative"
    },
    raidNotExist: {
      width: "100%",
      height: "calc(100vh - 140px)",
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      fontSize: "30px"
    },
    previousBtn: {
      position: "absolute",
      top: "20px",
      left: "-180px",
      zIndex: 4,
      [theme.breakpoints.down("sm")]: {
        "& .MuiButtonBase-root ": { width: "120px", padding: 4 },
        "& *": {
          fontSize: 12
        },
        top: "70px",
        left: "5px"
      }
    },
    nextBtn: {
      position: "absolute",
      top: "20px",
      right: "-160px",
      zIndex: 4,
      [theme.breakpoints.down("sm")]: {
        "& .MuiButtonBase-root ": { width: "120px", padding: 4 },
        "& *": {
          fontSize: 12
        },
        top: "70px",
        right: "5px"
      }
    },
    showDeleted: {
      position: "absolute",
      top: "-18px",
      right: "100px",
      zIndex: 6
    }
  })
);

export default function PageRaidView() {
  const member = useContext(MemberContext);
  const classes = useStyles("");
  const router = useRouter();
  const raidId = parseInt(String(router.query.raidId));
  const [raidTitle, setRaidTitle] = useState<string>("");
  const [playerListOpened, togglePlayerListOpened] = useToggle(false);
  const [showDeletedLoot, toggleShowDeletedLoot] = useToggle(false);
  const lootsAssigned = [];

  const {
    loading: loadingOneRaid,
    data: dataOneRaid,
    error: errorOneRaid,
    refetch: refetchOneRaid
  } = useQuery<Query, QueryVariables>(ONE_RAID, {
    variables: { raidId }
  });
  const {
    loading: loadingPlayers,
    data: dataPlayers,
    error: errorPlayers,
    refetch: refetchAllPlayers
  } = useQuery<Query>(ALL_PLAYERS);

  const error = errorOneRaid || errorPlayers;
  const loading = loadingOneRaid || loadingPlayers;

  useEffect(() => {
    if (currentRaid) {
      setRaidTitle(currentRaid.title);
    }
  }, [dataOneRaid]);

  if (loadingOneRaid || loadingPlayers || errorOneRaid || errorPlayers) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const currentRaid = dataOneRaid.allRaids.nodes[0];
  if (!currentRaid) {
    return (
      <div className={classes.raidNotExist}>
        <span>Oups! Ce raid n'existe pas</span>
      </div>
    );
  }
  const loots = currentRaid.lootsByRaidId.nodes;
  const currentRaidPlayers = currentRaid.raidPlayersByRaidId.nodes
    .sort((a: RaidPlayer, b: RaidPlayer) =>
      a.playerByPlayerId.name > b.playerByPlayerId.name ? 1 : -1
    )
    .sort(raidPlayerByClass);
  const allPlayers = dataPlayers.allPlayers.nodes
    .filter((player: Player) => player.active)
    .sort((a: Player, b: Player) => (a.name > b.name ? 1 : -1))
    .sort((a: Player, b: Player) => {
      const p1Class = a.classByClassId.id;
      const p2Class = b.classByClassId.id;
      if (p1Class === p2Class) {
        return a.name < b.name ? -1 : 1;
      }
      return p1Class - p2Class;
    });
  const bosses = currentRaid.donjonByDonjonId.bossesByDonjonId.nodes;
  const donjonShortName = currentRaid.donjonByDonjonId.shortName;

  return (
    <div className={classes.root}>
      <Paper className={classes.raidInfos}>
        <div className={classes.raidTitle}>
          <div>
            {getDate(currentRaid.date) +
              " | " +
              currentRaid.donjonByDonjonId.name +
              (raidTitle ? " (" + raidTitle + ")" : "")}
          </div>
          {member.level >= role.officer && (
            <RaidTitleButton raid={currentRaid} setRaidTitle={setRaidTitle} />
          )}
        </div>
        <Button
          className={classes.playerListBtn}
          variant="contained"
          color="primary"
          onClick={togglePlayerListOpened}
        >
          JOUEURS
        </Button>
        {currentRaid.id - 1 !== 0 && (
          <Link href="/raid/edit/[id]" as={`/raid/edit/${currentRaid.id - 1}`}>
            <a
              className={classes.previousBtn}
              style={{ textDecoration: "none" }}
            >
              <Button variant="contained">Raid précedent</Button>
            </a>
          </Link>
        )}
        <Link href="/raid/edit/[id]" as={`/raid/edit/${currentRaid.id + 1}`}>
          <a className={classes.nextBtn} style={{ textDecoration: "none" }}>
            <Button variant="contained">Raid suivant</Button>
          </a>
        </Link>
      </Paper>
      <div className={classes.bossCards}>
        {member.level >= role.officer && (
          <div className={classes.showDeleted}>
            <span>Montrer les loots supprimés</span>
            <Switch
              size="small"
              checked={showDeletedLoot}
              onChange={toggleShowDeletedLoot}
            />
          </div>
        )}
        {bosses.map(boss => {
          const lootedForThisBoss = loots.filter((loot): boolean => {
            return (
              ((!loot.bossId &&
                loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
                loot.itemByItemId.bossItemsByItemId.nodes.some(
                  bossItem => bossItem.bossByBossId.id === boss.id
                )) ||
                loot.bossId === boss.id) &&
              (showDeletedLoot ? true : loot.active) &&
              lootsAssigned.indexOf(loot) === -1
            );
          });
          loots.forEach(loot => {
            // permet de stocker les loots deja assignés et de les checks pour qu'ils n'apparaissent pas plusieurs fois (ca sert seulement pour les loots qui n'ont pas de bossId)
            if (
              !loot.bossId &&
              loot.itemByItemId.bossItemsByItemId.nodes.length > 0 &&
              loot.itemByItemId.bossItemsByItemId.nodes.some(
                bossItem => bossItem.bossByBossId.id === boss.id
              ) &&
              (showDeletedLoot ? true : loot.active)
            ) {
              lootsAssigned.push(loot);
            }
          });
          return (
            <BossCard
              key={`bosscard-raid-${boss.id}`}
              {...boss}
              donjonShortName={donjonShortName}
              looted={lootedForThisBoss}
              allPlayers={allPlayers}
              raidId={raidId}
              refetchOneRaid={refetchOneRaid}
              refetchAllPlayers={refetchAllPlayers}
            />
          );
        })}
      </div>
      <PlayerList
        handleClose={togglePlayerListOpened}
        open={playerListOpened}
        players={currentRaidPlayers}
        raidId={raidId}
        allPlayers={dataPlayers.allPlayers.nodes}
        refetchOneRaid={refetchOneRaid}
        refetchAllPlayers={refetchAllPlayers}
      />
    </div>
  );
}
