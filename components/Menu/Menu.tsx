import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader
} from "@material-ui/core";
import Link from "next/link";
import Router from "next/router";
import { destroyCookie } from "nookies";
import React, { useContext } from "react";
import MemberContext from "../../lib/context/member";

// import { AppVersion } from '../AppVersion';

function resetToken() {
  destroyCookie({}, "member");
  Router.push("/login");
}

export function Menu() {
  const member = useContext(MemberContext);
  const isConnected = member.level > 0;

  return (
    <div>
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raid management</ListSubheader>
            <Link href="/raid">
              <ListItem button={true}>
                <ListItemText primary="Raids Dashboard" />
              </ListItem>
            </Link>
          </List>
          <Divider />
          <List>
            <Link href="/summary">
              <ListItem button={true}>
                <ListItemText primary="Joueurs" />
              </ListItem>
            </Link>
            <Link href="/attendance">
              <ListItem button={true}>
                <ListItemText primary="Présence en raid" />
              </ListItem>
            </Link>
            <Link href="/items">
              <ListItem button={true}>
                <ListItemText primary="Items" />
              </ListItem>
            </Link>
            {member.level >= 4 && (
              <Link href="/editplayers">
                <ListItem button={true}>
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
            <ListItem button={true}>
              <ListItemText primary="Login page" />
            </ListItem>
          </Link>
        </List>
      )}
    </div>
  );
}
