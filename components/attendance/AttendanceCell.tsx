import { CircularProgress, TableCell } from "@material-ui/core";
import SettingsIcon from "@material-ui/icons/Settings";
import { useState } from "react";
import { RaidStatusKey, raidStatusList } from "./raid-status";

// export type AttendanceCellSetLoading = () => (isLoading: boolean) => void;

interface Props {
  canChange: boolean;
  onClick: any;
  status: RaidStatusKey;
}

export function AttendanceCell({ status, onClick, canChange }: Props) {
  const idModifyable = canChange && status !== "pasDansGuilde";
  const currentRaidStatus = raidStatusList.find(rs => rs.key === status);
  const [isFetchLoading, setLoading] = useState(false);

  return (
    <TableCell
      onClick={() => {
        if (idModifyable) {
          onClick(setLoading);
        }
      }}
      style={{ backgroundColor: currentRaidStatus.color }}
      // className={classes[status]}
    >
      {isFetchLoading && (
        <CircularProgress disableShrink={true} color="secondary" size={24} />
      )}
      {idModifyable && <SettingsIcon />}
    </TableCell>
  );
}
