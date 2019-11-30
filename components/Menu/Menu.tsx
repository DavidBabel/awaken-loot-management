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
import { useOnMobile } from "../../lib/hooks/mobilecheck";
import { role } from "../../lib/role-level";
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

export function Menu({ handleDrawerClose }) {
  const classes = useStyles("");
  const member = useContext(MemberContext);
  const isConnected = member.level > role.guest;
  const { route } = useRouter();
  const onMobile = useOnMobile();
  return (
    <div>
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raid management</ListSubheader>
            <Link href="/raid">
              <ListItem
                button={true}
                onClick={() => {
                  handleDrawerClose(onMobile);
                }}
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
                onClick={() => {
                  handleDrawerClose(onMobile);
                }}
                className={route === "/items" ? classes.selected : ""}
              >
                <ListItemText primary="Liste des Items" />
              </ListItem>
            </Link>
          </List>
          <Divider />
          <List>
            <ListSubheader>Joueurs</ListSubheader>

            <Link href="/summary">
              <ListItem
                button={true}
                onClick={() => {
                  handleDrawerClose(onMobile);
                }}
                className={route === "/summary" ? classes.selected : ""}
              >
                <ListItemText primary="Liste des joueurs" />
              </ListItem>
            </Link>
            <Link href="/attendance">
              <ListItem
                button={true}
                onClick={() => {
                  handleDrawerClose(onMobile);
                }}
                className={route === "/attendance" ? classes.selected : ""}
              >
                <ListItemText primary="Présence en raid" />
              </ListItem>
            </Link>
          </List>

          {member.level >= role.admin && (
            <>
              <Divider />
              <List>
                <ListSubheader>Admin</ListSubheader>

                <Link href="/editplayers">
                  <ListItem
                    button={true}
                    onClick={() => {
                      handleDrawerClose(onMobile);
                    }}
                    className={route === "/editplayers" ? classes.selected : ""}
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
            <ListItem
              button={true}
              onClick={() => {
                resetToken();
                handleDrawerClose(onMobile);
              }}
            >
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
              onClick={() => {
                handleDrawerClose(onMobile);
              }}
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
