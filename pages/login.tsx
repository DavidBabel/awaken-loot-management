import Avatar from "@material-ui/core/Avatar";
import Button from "@material-ui/core/Button";
// import Checkbox from "@material-ui/core/Checkbox";
import Container from "@material-ui/core/Container";
import CssBaseline from "@material-ui/core/CssBaseline";
// import FormControlLabel from "@material-ui/core/FormControlLabel";
import Grid from "@material-ui/core/Grid";
import Link from "@material-ui/core/Link";
import { makeStyles } from "@material-ui/core/styles";
import TextField from "@material-ui/core/TextField";
import Typography from "@material-ui/core/Typography";
import LockOutlinedIcon from "@material-ui/icons/LockOutlined";
import jwt from "jsonwebtoken";
import md5 from "md5";
import Router from "next/router";
import { setCookie } from "nookies";
import React from "react";
import { role } from "../lib/role-level";
import CONFIG from "../server/config";

const useStyles = makeStyles(theme => ({
  "@global": {
    body: {
      backgroundColor: theme.palette.common.white
    }
  },
  paper: {
    marginTop: theme.spacing(8),
    display: "flex",
    flexDirection: "column",
    alignItems: "center"
  },
  avatar: {
    margin: theme.spacing(1),
    backgroundColor: theme.palette.secondary.main
  },
  form: {
    width: "100%", // Fix IE 11 issue.
    marginTop: theme.spacing(1)
  },
  submit: {
    margin: theme.spacing(3, 0, 2)
  }
}));

interface JwtToken {
  error: string;
  jwt: string;
}

function tryToLogin(
  username: string,
  password: string,
  callback: (jwtInfos: JwtToken) => void,
  callbackError: () => void
) {
  const passwordSalted = md5(password + CONFIG.SALT);
  // tslint:disable-next-line:no-console

  fetch(`${CONFIG.SERVER_URL}/api/login`, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      username,
      password: passwordSalted
    })
  })
    .then(response => response.json())
    .then(callback)
    .catch(error => {
      console.log(error);
      callbackError();
    });
}

interface Props {
  apolloClient: any;
}

export default function Pagelogin({ apolloClient }: Props) {
  const [username, setUsername] = React.useState("");
  const [password, setPassword] = React.useState("");
  const [message, setMessage] = React.useState("");

  const classes = useStyles({});

  const errorFirstLetterUppecase =
    String(username).charAt(0) !== String(username.charAt(0)).toUpperCase();

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Connexion
        </Typography>
        <div className={classes.form}>
          {errorFirstLetterUppecase && (
            <Typography style={{ color: "red" }}>
              Il faut utiliser votre pseudo avec une majuscule
            </Typography>
          )}
          <TextField
            variant="outlined"
            margin="normal"
            required={true}
            fullWidth={true}
            id="login"
            label="Pseudo"
            name="login"
            autoComplete="login"
            autoFocus={true}
            onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
              setUsername(e.target.value)
            }
          />
          {password.length >= 32 && (
            <Typography style={{ color: "red" }}>
              Attention il faut utiliser ton mot de passe pour te connecter, pas
              le hash.
            </Typography>
          )}
          <TextField
            variant="outlined"
            margin="normal"
            required={true}
            fullWidth={true}
            name="password"
            label="Password"
            type="password"
            id="password"
            autoComplete="current-password"
            onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
              setPassword(e.target.value)
            }
          />
          {/* <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="Remember me"
          /> */}
          <Button
            fullWidth={true}
            variant="contained"
            color="primary"
            className={classes.submit}
            onClick={() =>
              tryToLogin(
                username,
                password,
                jwtInfos => {
                  if (jwtInfos.error) {
                    setMessage("IMPOSSIBLE DE SE CONNECTER");
                  } else {
                    setMessage("Connecté");
                    const memberInfos: any = jwt.decode(jwtInfos.jwt);
                    const payload = JSON.stringify({
                      userid: memberInfos.userid,
                      name: username,
                      role: memberInfos.role,
                      level: role[memberInfos.role] || 0,
                      discordId: memberInfos.discordId || null,
                      token: jwtInfos.jwt
                    });
                    // localStorage.setItem('token', jwtInfos.jwt);
                    setCookie({}, CONFIG.COOKIE_NAME, payload, {
                      maxAge: CONFIG.COOKIE_LIFE,
                      path: "/"
                    });
                    // tslint:disable-next-line:no-console
                    // apolloClient.resetStore();
                    Router.push("/?reload");
                  }
                },
                () => {
                  setMessage("Impossible de se connecter");
                }
              )
            }
          >
            Se connecter
          </Button>
          <div>{message}</div>
          <Grid container={true}>
            {/* <Grid item={true} xs={true}>
              <Link href="#" variant="body2">
                Forgot password?
              </Link>
            </Grid> */}
            <Grid item={true}>
              <Link href="/register" variant="body2">
                {"Pas de compte ? Genère ton mot de passe"}
              </Link>
            </Grid>
          </Grid>
        </div>
      </div>
    </Container>
  );
}
