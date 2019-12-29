import {
  createStyles,
  makeStyles,
  Table,
  TableProps,
  Theme
} from "@material-ui/core";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    tableWrapper: {
      position: "relative",
      height: "100%",
      overflow: "auto",
      "&::-webkit-scrollbar-thumb": {
        backgroundColor: "rgba(0,0,0,0.6)",
        borderRadius: "2px"
      },
      "&::-webkit-scrollbar-track": {
        boxShadow: "inset 0 0 6px rgba(0,0,0,0.15)",
        backgroundColor: "rgba(0,0,0,0.2)"
      },
      "&::-webkit-scrollbar": {
        width: "10px",
        height: "10px",
        [theme.breakpoints.down("sm")]: {
          width: "5px",
          height: "5px"
        }
      }
    },
    table: {
      "& *": {
        [theme.breakpoints.down("sm")]: {
          fontSize: 12
        }
      },
      minWidth: 650,
      "& .MuiTableCell-head": {
        backgroundColor: "#242424",
        color: "white",
        minWidth: 20
      },
      "& .MuiTableCell-root": {
        border: "solid 1px #212121",
        padding: "5px 5px"
      },
      "& .MuiTableCell-body": {
        position: "relative"
      },
      "& td.MuiTableCell-root:not(.perc-cell)": {
        cursor: "pointer",
        padding: 0
      },
      "& .MuiTableCell-root:hover .MuiSvgIcon-root": {
        visibility: "visible",
        opacity: "1",
        transition: "opacity 0.2s ease-in-out"
      },
      "& .MuiSvgIcon-root": {
        position: "absolute",
        height: "100%",
        width: "24px",
        top: 0,
        padding: 0,
        left: 0,
        right: 0,
        margin: "auto",
        visibility: "hidden",
        opacity: "0",
        transition: "opacity 0.3s ease-in-out"
      },
      "& th.MuiTableCell-body": {
        backgroundColor: "#242424"
      }
    }
  })
);

export function CustomAttendanceTable(props: TableProps) {
  const classes = useStyles("");

  return (
    <div className={classes.tableWrapper}>
      <Table className={classes.table} stickyHeader={true} {...props}>
        {props.children}
      </Table>
    </div>
  );
}
