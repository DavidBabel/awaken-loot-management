import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader,
  ListSubheaderProps,
  makeStyles
} from "@material-ui/core";
import Router, { useRouter } from "next/router";
import { destroyCookie } from "nookies";
import React from "react";
import { useMemberContext } from "../../lib/context/member";
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
  return <ListItem style={{ height: 30 }} button component="a" {...props} />;
}

function ListHead(props: ListSubheaderProps) {
  return <ListSubheader style={{ height: 40 }} {...props} />;
}

export function Menu({ handleDrawerClose }) {
  const classes = useStyles("");
  const member = useMemberContext();
  const isConnected = member.level > role.guest;
  const { route } = useRouter();
  const onMobile = useOnMobile(false);
  return (
    <div>
      {isConnected ? (
        <>
          <List>
            <ListHead>Raids & Items</ListHead>
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
            <ListHead>Joueurs</ListHead>

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
                <ListHead>Mon personnage</ListHead>

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

          {member.level >= role.classMaster && (
            <>
              <Divider />
              <List>
                <ListHead>Management</ListHead>
                {member.name === "Devilhunter" && (
                  <ListItemLink
                    href="/admin/raid"
                    onClick={() => {
                      handleDrawerClose(onMobile);
                    }}
                    className={route === "/admin/raid" ? classes.selected : ""}
                  >
                    <ListItemText primary="Inscriptions joueurs" />
                  </ListItemLink>
                )}
                {member.level >= role.classMaster && (
                  <>
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
                      className={
                        route === "/admin/roster" ? classes.selected : ""
                      }
                    >
                      <ListItemText primary="Editer roster (site)" />
                    </ListItemLink>
                  </>
                )}
              </List>
            </>
          )}

          <Divider />

          <List>
            <ListHead>Connecté: {member.name}</ListHead>
            <ListItemLink
              button={true}
              onClick={() => {
                resetToken();
                handleDrawerClose(onMobile);
              }}
            >
              <ListItemText primary="Se déconnecter" />
            </ListItemLink>
          </List>
        </>
      ) : (
        <List>
          <ListHead>Connectez vous</ListHead>

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
