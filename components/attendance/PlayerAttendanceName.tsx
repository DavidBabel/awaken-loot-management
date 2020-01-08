import React from "react";

import { TableCell } from "@material-ui/core";
import Link from "next/link";
import { Player } from "../../lib/generatedTypes";

interface Props {
  player: Player;
}

export function PlayerAttendanceName({ player }: Props) {
  return (
    <TableCell component="th" scope="row">
      <Link href="/player/view/[id]" as={`/player/view/${player.id}`}>
        <a
          target="_blank"
          style={{
            color: player.classByClassId.color,
            textDecoration: "none"
          }}
        >
          {player.name}
        </a>
      </Link>
    </TableCell>
  );
}
