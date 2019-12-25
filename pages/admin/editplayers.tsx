import { useQuery } from "@apollo/react-hooks";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow
} from "@material-ui/core/";
import Paper from "@material-ui/core/Paper";
import { makeStyles } from "@material-ui/core/styles";
import AddPlayer from "../../components/editPlayers/AddPlayer";
import ChangePasswordOrRole from "../../components/editPlayers/ChangePasswordOrRole";
import InRosterAndActiveSwitch from "../../components/editPlayers/InRosterAndActiveSwitch";
import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Player } from "../../lib/generatedTypes";
import { Query } from "../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";
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
  },
  nameCell: {
    textShadow: "1px 1px 1px rgba(0,0,0,0.8)",
    backgroundColor: "#4D4D4D"
  },
  passwordOrRole: {
    display: "flex",
    justifyContent: "flex-end",
    lineHeight: "48px"
  }
}));

export default function PageIndex() {
  const classes = useStyles("");
  const { loading, data, error, refetch: refetchAllPlayers } = useQuery<Query>(
    ALL_PLAYERS
  );

  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }
  const allPlayers = data.allPlayers.nodes.sort(byAlphabet("name", false));
  return (
    <div className={classes.root}>
      <div className={classes.addPlayerBtn}>
        <AddPlayer {...{ allPlayers, refetchAllPlayers }} />
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
              <TableCell align="right">Class</TableCell>
              <TableCell align="right">Role</TableCell>
              <TableCell align="right">Crypted Pass</TableCell>
              <TableCell align="center">Active</TableCell>
              <TableCell align="center">In roster</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {allPlayers.map((player: Player) => (
              <TableRow key={player.id}>
                <TableCell
                  className={classes.nameCell}
                  component="th"
                  scope="row"
                  style={{
                    color: player.classByClassId.color
                  }}
                >
                  {player.name}
                </TableCell>
                <TableCell align="right">
                  {player.classByClassId.name}
                </TableCell>
                <TableCell align="right">
                  <div className={classes.passwordOrRole}>
                    {player.role}
                    {
                      <ChangePasswordOrRole
                        playerId={player.id}
                        accessor={"role"}
                      />
                    }
                  </div>
                </TableCell>
                <TableCell align="right">
                  <div className={classes.passwordOrRole}>
                    {player.password}
                    {
                      <ChangePasswordOrRole
                        playerId={player.id}
                        accessor={"password"}
                      />
                    }
                  </div>
                </TableCell>
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
