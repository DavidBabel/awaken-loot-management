import { useQuery } from "@apollo/react-hooks";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow
} from "@material-ui/core";

import { LoadingAndError } from "../../components/LoadingAndErrors";
import { Query } from "../../lib/generatedTypes";
import { ALL_PLAYERS } from "../../lib/gql/player-queries";

export default function PagePlayerList() {
  const { loading, data, error } = useQuery<Query>(ALL_PLAYERS);
  if (loading || error) {
    return <LoadingAndError loading={loading} error={error} />;
  }

  const players = data.allPlayers.nodes;

  return (
    <Table>
      <TableHead>
        <TableRow>
          <TableCell>Dessert (100g serving)</TableCell>
          <TableCell align="right">Calories</TableCell>
          <TableCell align="right">Fat&nbsp;(g)</TableCell>
          <TableCell align="right">Carbs&nbsp;(g)</TableCell>
          <TableCell align="right">Protein&nbsp;(g)</TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {players.map(player => (
          <TableRow key={player.name}>
            <TableCell /* component="th"  */ scope="row">
              {player.name}
            </TableCell>
            <TableCell>{JSON.stringify(player)}</TableCell>
            {/* <TableCell align="right">{player.fat}</TableCell>
            <TableCell align="right">{player.carbs}</TableCell>
            <TableCell align="right">{player.protein}</TableCell> */}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
}
