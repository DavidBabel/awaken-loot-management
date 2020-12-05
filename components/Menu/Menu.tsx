import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader,
  makeStyles
} from "@material-ui/core";
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

function ListItemLink(props) {
  return <ListItem button component="a" {...props} />;
}

export function Menu({ handleDrawerClose }) {
  const classes = useStyles("");
  const member = useContext(MemberContext);
  const isConnected = member.level > role.guest;
  const { route } = useRouter();
  const onMobile = useOnMobile(false);
  return (
    <div>
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raids & Items</ListSubheader>
            <ListItemLink
              href="/raid"
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
            </ListItemLink>
            <ListItemLink
              href="/items"
              onClick={() => {
                handleDrawerClose(onMobile);
              }}
              className={route === "/items" ? classes.selected : ""}
            >
              <ListItemText primary="Liste des Items" />
            </ListItemLink>
            {member.level >= role.class_master && (
              <ListItemLink
                href={`/player/view/${CONFIG.ID_UNASSIGNED}`}
                onClick={() => {
                  handleDrawerClose(onMobile);
                }}
                className={
                  route === `/player/view/${CONFIG.ID_UNASSIGNED}`
                    ? classes.selected
                    : ""
                }
              >
                <ListItemText primary="Items non assignés" />
              </ListItemLink>
            )}
          </List>
          <Divider />
          <List>
            <ListSubheader>Joueurs</ListSubheader>

            <ListItemLink
              href="/summary"
              onClick={() => {
                handleDrawerClose(onMobile);
              }}
              className={route === "/summary" ? classes.selected : ""}
            >
              <ListItemText primary="Liste des joueurs" />
            </ListItemLink>

            <ListItemLink
              href="/attendance"
              onClick={() => {
                handleDrawerClose(onMobile);
              }}
              className={route === "/attendance" ? classes.selected : ""}
            >
              <ListItemText primary="Présence en raid" />
            </ListItemLink>
          </List>

          {member.level >= role.player && (
            <>
              <Divider />
              <List>
                <ListSubheader>Mon compte</ListSubheader>

                <ListItemLink
                  href={`/player/merit/${member.userid}`}
                  className={
                    route.startsWith("/player/merit") ? classes.selected : ""
                  }
                >
                  <ListItemText primary="Mon mérite" />
                </ListItemLink>

                <ListItemLink
                  href={`/player/specialisation/${member.userid}`}
                  className={
                    route.startsWith("/player/specialisation")
                      ? classes.selected
                      : ""
                  }
                >
                  <ListItemText primary="Ma spécialisation" />
                </ListItemLink>
              </List>
            </>
          )}

          {member.level >= role.admin && (
            <>
              <Divider />
              <List>
                <ListSubheader>Admin</ListSubheader>

                <ListItemLink
                  href="/admin/editplayers"
                  onClick={() => {
                    handleDrawerClose(onMobile);
                  }}
                  className={
                    route === "/admin/editplayers" ? classes.selected : ""
                  }
                >
                  <ListItemText primary="Editer joueurs" />
                </ListItemLink>
                <ListItemLink
                  href="/admin/roster"
                  onClick={() => {
                    handleDrawerClose(onMobile);
                  }}
                  className={route === "/admin/roster" ? classes.selected : ""}
                >
                  <ListItemText primary="Editer roster (site)" />
                </ListItemLink>
              </List>
            </>
          )}

          <Divider />

          <List>
            <ListSubheader>Connecté: {member.name}</ListSubheader>
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

          <ListItemLink
            href="/login"
            onClick={() => {
              handleDrawerClose(onMobile);
            }}
            className={route === "/login" ? classes.selected : ""}
          >
            <ListItemText primary="Se connecter" />
          </ListItemLink>
        </List>
      )}
    </div>
  );
}
