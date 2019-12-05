import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader,
  makeStyles
} from "@material-ui/core";
import Link from "next/link";
import Router, { useRouter } from "next/router";
import { destroyCookie } from "nookies";
import React, { useContext } from "react";
import MemberContext from "../../lib/context/member";
import { role } from "../../lib/role-level";
import { isProduction } from "../../lib/utils/env";
import CONFIG from "../../server/config";

// import { AppVersion } from '../AppVersion';

function resetToken() {
  destroyCookie({}, CONFIG.COOKIE_NAME);
  Router.push("/login");
}
const useStyles = makeStyles({
  selected: {
    backgroundColor: "#EBEBEB",
    "& *": {
      fontWeight: "bold"
    }
  }
});

export function Menu() {
  const classes = useStyles("");
  const member = useContext(MemberContext);
  const isConnected = member.level > role.guest;
  const { route } = useRouter();
  return (
    <div>
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raid management</ListSubheader>
            <Link href="/raid">
              <ListItem
                button={true}
                className={
                  route
                    ? route === "/raid"
                      ? classes.selected
                      : ""
                    : classes.selected
                }
              >
                <ListItemText primary="Liste des Raids" />
              </ListItem>
            </Link>
            <Link href="/items">
              <ListItem
                button={true}
                className={route === "/items" ? classes.selected : ""}
              >
                <ListItemText primary="Répartition des Items" />
              </ListItem>
            </Link>
          </List>
          <Divider />
          <List>
            <ListSubheader>Joueurs</ListSubheader>

            <Link href="/summary">
              <ListItem
                button={true}
                className={route === "/summary" ? classes.selected : ""}
              >
                <ListItemText primary="Résumé / loots" />
              </ListItem>
            </Link>
            <Link href="/attendance">
              <ListItem
                button={true}
                className={route === "/attendance" ? classes.selected : ""}
              >
                <ListItemText primary="Présence en raid" />
              </ListItem>
            </Link>
          </List>

          {member.level >= role.player && (
            <>
              <Divider />
              <List>
                <ListSubheader>Mon compte</ListSubheader>

                {!isProduction() && (
                  <Link href={`/player/merit/${member.userid}`}>
                    <ListItem
                      button={true}
                      className={
                        route.startsWith("/player/merit")
                          ? classes.selected
                          : ""
                      }
                    >
                      <ListItemText primary="Mon mérite" />
                    </ListItem>
                  </Link>
                )}

                <Link href={`/player/specialisation/${member.userid}`}>
                  <ListItem
                    button={true}
                    className={
                      route.startsWith("/player/specialisation")
                        ? classes.selected
                        : ""
                    }
                  >
                    <ListItemText primary="Ma spécialisation" />
                  </ListItem>
                </Link>
              </List>
            </>
          )}

          {member.level >= role.admin && (
            <>
              <Divider />
              <List>
                <ListSubheader>Admin</ListSubheader>

                <Link href="/admin/editplayers">
                  <ListItem
                    button={true}
                    className={
                      route === "/admin/editplayers" ? classes.selected : ""
                    }
                  >
                    <ListItemText primary="Editer joueurs" />
                  </ListItem>
                </Link>
              </List>
            </>
          )}

          <Divider />

          <List>
            <ListSubheader>Connected as {member.name}</ListSubheader>
            <ListItem button={true} onClick={resetToken}>
              <ListItemText primary="Se déconnecter" />
            </ListItem>
          </List>
        </>
      ) : (
        <List>
          <ListSubheader>Connectez vous</ListSubheader>
          <Link href="/login">
            <ListItem
              button={true}
              className={route === "/login" ? classes.selected : ""}
            >
              <ListItemText primary="Se connecter" />
            </ListItem>
          </Link>
        </List>
      )}
    </div>
  );
}
