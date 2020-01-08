import { Button, createStyles, makeStyles, Theme } from "@material-ui/core";
import { RaidPlayer } from "../../lib/generatedTypes";
import { raidStatusList } from "./raid-status";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    legende: {
      display: "flex",
      [theme.breakpoints.down("sm")]: {
        display: "none"
      },
      alignItems: "center",
      justifyContent: "center",
      flexDirection: "column",
      "& div": {
        margin: 5
      },
      "& span": {
        marginRight: 10
      }
    },
    legendeItem: {
      display: "flex",
      alignItems: "center",
      justifyContent: "center"
    },
    legendeSquare: {
      width: 40,
      height: 30,
      border: "2px solid #212121"
    }
  })
);

interface Props {
  currentRaidPlayer?: RaidPlayer;
  onClick: (newStatus?: number) => void;
}

interface QuickButtonProps {
  index?: number;
  label: string;
  color: string;
}

export function ChangeAttendanceButton({ onClick, currentRaidPlayer }: Props) {
  const classes = useStyles("");

  function QuickButton({ index, label, color }: QuickButtonProps) {
    return (
      <Button
        onClick={() => {
          onClick(index);
        }}
      >
        <div className={classes.legendeItem}>
          <div
            style={{ backgroundColor: color }}
            className={classes.legendeSquare}
          />
          <span>{label}</span>
        </div>
      </Button>
    );
  }

  return (
    <div className={classes.legende}>
      {[0, 2, 3, 4]
        .filter(num => {
          if (
            num === 0 &&
            currentRaidPlayer &&
            currentRaidPlayer?.status === null
          ) {
            return false;
          } else if (num === 2 && typeof currentRaidPlayer === "undefined") {
            return false;
          } else {
            return num !== currentRaidPlayer?.status;
          }
        })
        .map((raidStatusNumber: number) => {
          const currentRaidStatus = raidStatusList[raidStatusNumber];
          return (
            <QuickButton
              key={`legend-attendance-${raidStatusNumber}`}
              index={raidStatusNumber}
              {...currentRaidStatus}
            />
          );
        })}
    </div>
  );
}
