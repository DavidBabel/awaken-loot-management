import { TableCell, Tooltip } from "@material-ui/core";
import Router from "next/router";
import { Raid } from "../../lib/generatedTypes";
import { getDate } from "../../lib/utils/date";

interface Props {
  raid: Raid;
}

export function AttendanceTableRaidHeaders({ raid }: Props) {
  return (
    raid.raidPlayersByRaidId.nodes.length > 0 && (
      <Tooltip title={getDate(raid.date)} placement="bottom">
        <TableCell
          align="center"
          style={{ cursor: "pointer" }}
          onClick={() => Router.push("/raid/edit/" + raid.id)}
        >
          {raid.donjonByDonjonId.shortName}
        </TableCell>
      </Tooltip>
    )
  );
}
