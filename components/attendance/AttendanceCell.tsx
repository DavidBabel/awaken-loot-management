import { TableCell } from "@material-ui/core";
import SettingsIcon from "@material-ui/icons/Settings";
import { RaidStatusKey, raidStatusList } from "./raid-status";

interface Props {
  canChange: boolean;
  onClick: () => void;
  status: RaidStatusKey;
}

export function AttendanceCell({ status, onClick, canChange }: Props) {
  const idModifyable = canChange && status !== "pasDansGuilde";
  const currentRaidStatus = raidStatusList.find(rs => rs.key === status);

  return (
    <TableCell
      onClick={() => {
        if (idModifyable) {
          onClick();
        }
      }}
      style={{ backgroundColor: currentRaidStatus.color }}
      // className={classes[status]}
    >
      {idModifyable && <SettingsIcon />}
    </TableCell>
  );
}
