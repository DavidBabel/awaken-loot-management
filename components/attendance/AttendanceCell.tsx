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
  const isModifyable =
    canChange && status !== "pasDansGuilde" && status !== "inAnotherId";
  const currentRaidStatus = raidStatusList.find(rs => rs.key === status);
  const [isFetchLoading, setLoading] = useState(false);

  return (
    <TableCell
      onClick={() => {
        if (isModifyable) {
          onClick(setLoading);
        }
      }}
      style={{ backgroundColor: currentRaidStatus.color }}
      // className={classes[status]}
    >
      {isFetchLoading && (
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center"
          }}
        >
          <CircularProgress
            disableShrink={true}
            style={{ color: "lightgrey" }}
            size={22}
          />
        </div>
      )}
      {isModifyable && <SettingsIcon />}
    </TableCell>
  );
}
