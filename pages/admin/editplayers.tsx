import { useQuery } from "@apollo/react-hooks";
import {
  Switch,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow
} from "@material-ui/core/";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import AddPlayer from "../../components/editPlayers/AddPlayer";
import EditPlayerField from "../../components/editPlayers/EditPlayerField";
import InRosterAndActiveSwitch from "../../components/editPlayers/InRosterAndActiveSwitch";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Player, Query } from "../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
import { useToggle } from "../../lib/hooks/toggle";
import { byAlphabet } from "../../lib/utils/sorter";

const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",
    [theme.breakpoints.down("sm")]: {
      paddingTop: 8
    }
  },
  paper: {
    width: "100%",
    maxHeight: "calc(100vh - 160px)",
    [theme.breakpoints.down("sm")]: {
      maxHeight: "calc(100vh - 110px)"
    },
    overflow: "auto",
    "&::-webkit-scrollbar-thumb": {
      backgroundColor: "rgba(0,0,0,0.6)",
      borderRadius: "2px"
    },
    "&::-webkit-scrollbar-track": {
      boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)"
    },
    "&::-webkit-scrollbar": {
      width: "10px",
      height: "10px",
      [theme.breakpoints.down("sm")]: {
        width: "5px",
        height: "5px"
      }
    }
  },
  addPlayerBtn: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 15,
    [theme.breakpoints.down("sm")]: {
      marginBottom: 8
    }
  },
  table: {
    "& .MuiTableCell-head": { backgroundColor: "#4d4d4d", color: "white" },
    "& .MuiTableCell-root:not(.MuiTableCell-head)": {
      position: "relative"
    },
    "& .MuiTableCell-root": {
      [theme.breakpoints.down("sm")]: {
        padding: "0px 10px"
      }
    },
    "& .MuiTableRow-root:nth-child(even)": {
      backgroundColor: "rgba(0,0,0,0.05)"
    }
  }
}));

export default function PageIndex() {
  const classes = useStyles("");
  const [hideDisabled, toggleHideDisabled] = useToggle(true);
  const { loading, data, error, refetch: refetchAllPlayers } = useQuery<Query>(
    ALL_PLAYERS
  );

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  let allPlayers = data.allPlayers.nodes.sort(byAlphabet("name", false));

  if (hideDisabled) {
    allPlayers = allPlayers.filter(player => player.active);
  }

  return (
    <div className={classes.root}>
      <div className={classes.addPlayerBtn}>
        <AddPlayer {...{ allPlayers, refetchAllPlayers }} />
        &nbsp;&nbsp;&nbsp;&nbsp;Joueurs désactivés
        <Switch
          size="small"
          checked={!hideDisabled}
          onChange={toggleHideDisabled}
        />
      </div>
      <Paper className={classes.paper}>
        <Table
          className={classes.table}
          stickyHeader={true}
          size="small"
          aria-label="players table"
        >
          <TableHead>
            <TableRow>
              <TableCell>Name</TableCell>
              <TableCell align="left">Class</TableCell>
              <TableCell align="left">Role</TableCell>
              <TableCell align="left">Reroll de</TableCell>
              <TableCell align="left">Crypted Pass</TableCell>
              <TableCell align="left">Discord</TableCell>
              <TableCell align="left">mdc</TableCell>
              <TableCell align="center">Active</TableCell>
              <TableCell align="center">Raideur</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {allPlayers.map((player: Player) => (
              <TableRow key={`row-table-players-${player.id}`}>
                {/* <TableCell
                  className={classes.nameCell}
                  component="th"
                  scope="row"
                  style={{
                    color: player.classByClassId.color
                  }}
                >
                  {player.name}
                </TableCell> */}
                <EditPlayerField
                  label={player.name}
                  playerId={player.id}
                  classColor={player.classByClassId.color}
                  accessor={"name"}
                />
                <EditPlayerField
                  label={player.classByClassId.name}
                  playerId={player.id}
                  accessor={"classId"}
                />
                <EditPlayerField
                  playerId={player.id}
                  accessor={"role"}
                  label={player.role}
                />
                <EditPlayerField
                  playerId={player.id}
                  accessor={"rerollOf"}
                  label={player.rerollOf}
                />
                <EditPlayerField
                  playerId={player.id}
                  accessor={"password"}
                  label={Boolean(player.password) ? "oui" : "-"}
                />
                <EditPlayerField
                  playerId={player.id}
                  accessor={"discordId"}
                  label={Boolean(player.discordId) ? "oui" : "-"}
                />
                <EditPlayerField
                  playerId={player.id}
                  accessor={"mdcOf"}
                  label={Boolean(player.mdcOf) ? "oui" : "-"}
                />
                <TableCell align="center">
                  <InRosterAndActiveSwitch
                    active={player.active}
                    playerId={player.id}
                    accessor={"active"}
                  />
                </TableCell>
                <TableCell align="center">
                  <InRosterAndActiveSwitch
                    active={player.inRoster}
                    playerId={player.id}
                    accessor={"inRoster"}
                  />
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </Paper>
    </div>
  );
}
