import Avatar from "@material-ui/core/Avatar";
// import Button from "@material-ui/core/Button";
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
// import jwt from "jsonwebtoken";
import md5 from "md5";
// import Router from "next/router";
// import { setCookie } from "nookies";
import React from "react";
// import { role } from "../lib/role-level";
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

interface Props {
  apolloClient: any;
}

export default function Pagelogin({ apolloClient }: Props) {
  const [password, setPassword] = React.useState("");

  const classes = useStyles({});

  return (
    <Container component="main" maxWidth="xs">
      <CssBaseline />
      <div className={classes.paper}>
        <Avatar className={classes.avatar}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Générer son mot de passe
        </Typography>
        <div className={classes.form}>
          Rentre ton mot de passe: <b>8 caractères minimum</b>
          <TextField
            variant="outlined"
            margin="normal"
            required={true}
            fullWidth={true}
            name="password"
            label="Mot de passe"
            type="password"
            id="password"
            autoComplete="current-password"
            onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
              setPassword(e.target.value)
            }
          />
          Ensuite, envoi :
          <ul>
            <li>le hash de ton mot de passe crypté</li>
            <li>ton pseudo de jeu exact</li>
            <li>ta classe jouée</li>
          </ul>
          à <b>Devilhunter</b> en MP Discord pour qu'il t'ouvre ton accès.
          <br />
          <br />
          C'est indecryptable. Donc ne le perd pas, on ne peut pas le récupérer.
          <TextField
            variant="outlined"
            margin="normal"
            fullWidth={true}
            label="Hash du password"
            name="hashpassword"
            autoFocus={true}
            value={
              password?.length >= 8
                ? md5(password + CONFIG.SALT)
                : "Rentrez un mot de passe plus long"
            }
            onChange={() => {}}
          />
          <br />
          Une fois que ton compte sera créé il faudra utiliser{" "}
          <b>ton pseudo exact</b> de jeu et <b>ton mdp</b> pour te connecter{" "}
          (pas le hash).
          <br />
          <br />
          <Grid container={true}>
            {/* <Grid item={true} xs={true}>
              <Link href="#" variant="body2">
                Forgot password?
              </Link>
            </Grid> */}
            <Grid item={true}>
              <Link href="/login" variant="body2">
                {"Déjà un compte ? Connecte toi."}
              </Link>
            </Grid>
          </Grid>
        </div>
      </div>
    </Container>
  );
}
