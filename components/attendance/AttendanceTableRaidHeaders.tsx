import { TableCell, Tooltip } from "@material-ui/core";
import Router from "next/router";
import { Raid } from "../../lib/generatedTypes";
import { getDate } from "../../lib/utils/date";

interface Props {
  raid: Raid;
}

export function AttendanceTableRaidHeaders({ raid }: Props) {
  return (
    <Tooltip title={getDate(raid.date)} placement="bottom">
      <TableCell
        align="center"
        style={{ cursor: "pointer", fontSize: 12, minWidth: 44 }}
        onClick={() => Router.push("/raid/edit/" + raid.id)}
      >
        {raid.donjonByDonjonId.shortName}
      </TableCell>
    </Tooltip>
  );
}
