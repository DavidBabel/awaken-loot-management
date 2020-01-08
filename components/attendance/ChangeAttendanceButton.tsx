import { Button, createStyles, makeStyles, Theme } from "@material-ui/core";
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
  current?: number;
  onClick: (newStatus?: number) => void;
}

interface QuickButtonProps {
  index?: number;
  label: string;
  color: string;
}

export function ChangeAttendanceButton({ onClick, current }: Props) {
  const classes = useStyles("");

  function QuickButton({ index, label, color }: QuickButtonProps) {
    return (
      <Button onClick={() => onClick(index)}>
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
          /*    if (num === 0 && typeof current === "undefined") {
            return false;
          } else  */ if (
            num === 2 &&
            typeof current === "undefined"
          ) {
            return false;
          } else {
            return num !== current;
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
