import {
  Button,
  CircularProgress,
  Grid,
  Paper,
  Typography
} from "@material-ui/core";
import { createStyles, makeStyles, Theme } from "@material-ui/core/styles";
import { ApolloError } from "apollo-boost";
import Link from "next/link";
import { useState } from "react";

interface Props {
  loading: boolean;
  error: ApolloError;
}
const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      padding: theme.spacing(3, 2),
      width: "100%",
      display: "flex",
      flexDirection: "column",
      justifyContent: "center",
      alignItems: "center",
      height: "calc(100vh - 150px)",
      [theme.breakpoints.down("sm")]: {
        height: "calc(100vh - 60px)"
      },
      "& *": {
        textDecoration: "none"
      }
    }
  })
);
export function LoadingAndError({ loading, error }: Props) {
  const classes = useStyles("");
  const [showError, setShowError] = useState(false);

  if (error) {
    if (window) {
      if (window.location.href.includes("?reload")) {
        window.location.reload();
        return <div>Reloading ...</div>;
      }
    }
    return (
      <Paper className={classes.root}>
        <Typography variant="h5" component="h3">
          An error occured, are you{" "}
          <Link href="/login">
            <a>
              <Button variant="outlined" color="primary">
                logged in
              </Button>
            </a>
          </Link>{" "}
          ?
        </Typography>
        <br />
        <Button
          variant="outlined"
          color="secondary"
          onClick={() => setShowError(!showError)}
        >
          {showError ? "Hide" : "Show"} error
        </Button>
        {showError && (
          <div>
            <textarea style={{ width: 800, height: 400 }}>
              {JSON.stringify(error, null, 2)}
            </textarea>
          </div>
        )}
      </Paper>
    );
  }
  if (loading) {
    return (
      <Grid container className={classes.root}>
        <Grid item xs={12}>
          <CircularProgress />
        </Grid>
      </Grid>
    );
  }
  return null;
}
