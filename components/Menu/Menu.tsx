import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader,
  makeStyles
} from "@material-ui/core";
import Link from "next/link";
import Router from "next/router";
import { destroyCookie } from "nookies";
import React, { useContext, useState, useEffect } from "react";
import MemberContext from "../../lib/context/member";
import { role } from "../../lib/role-level";

// import { AppVersion } from '../AppVersion';

function resetToken() {
  destroyCookie({}, "member");
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
  const [route, setRoute] = useState(null);
  useEffect(() => {
    setRoute(Router.router ? Router.router.route : null);
  }, [Router.route]);
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
                <ListItemText primary="Raids Dashboard" />
              </ListItem>
            </Link>
          </List>
          <Divider />
          <List>
            <Link href="/summary">
              <ListItem
                button={true}
                className={route === "/summary" ? classes.selected : ""}
              >
                <ListItemText primary="Joueurs" />
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
            <Link href="/items">
              <ListItem
                button={true}
                className={route === "/items" ? classes.selected : ""}
              >
                <ListItemText primary="Items" />
              </ListItem>
            </Link>
            {member.level >= role.admin && (
              <Link href="/editplayers">
                <ListItem
                  button={true}
                  className={route === "/editplayers" ? classes.selected : ""}
                >
                  <ListItemText primary="Editer joueurs" />
                </ListItem>
              </Link>
            )}
          </List>
          <Divider />

          <List>
            <ListSubheader>Connected as {member.name}</ListSubheader>
            <ListItem button={true} onClick={resetToken}>
              <ListItemText primary="Disconnect" />
            </ListItem>
          </List>
        </>
      ) : (
        <List>
          <ListSubheader>Please connect</ListSubheader>
          <Link href="/login">
            <ListItem
              button={true}
              className={route === "/login" ? classes.selected : ""}
            >
              <ListItemText primary="Login page" />
            </ListItem>
          </Link>
        </List>
      )}
    </div>
  );
}
