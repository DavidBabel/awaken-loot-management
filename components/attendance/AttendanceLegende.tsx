import { createStyles, makeStyles, Theme } from "@material-ui/core";
import { RaidStatus, raidStatusList } from "./raid-status";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    legende: {
      display: "flex",
      [theme.breakpoints.down("sm")]: {
        display: "none"
      },
      alignItems: "center",
      justifyContent: "center",
      flexWrap: "wrap",
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

export function AttendanceLegende() {
  const classes = useStyles("");

  return (
    <div className={classes.legende}>
      {raidStatusList.map((raidStatus: RaidStatus) => (
        <div
          className={classes.legendeItem}
          key={`legend-attendance-${raidStatus.id}`}
        >
          <div
            style={{ backgroundColor: raidStatus.color }}
            className={classes.legendeSquare}
          />
          <span>{raidStatus.label}</span>
        </div>
      ))}
    </div>
  );
}
