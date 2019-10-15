import {
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader
} from "@material-ui/core";
import Link from "next/link";
import Router from "next/router";
// import { destroyCookie } from "nookies";
import React, { useContext } from "react";
import MemberContext from "../../lib/context/member";
import { role } from "../../lib/role-level";

// import { AppVersion } from '../AppVersion';

function resetToken() {
  // tslint:disable-next-line:no-console
  console.log("reseting token ...");
  // await destroyCookie({}, "member");
  Router.push("/login");
}

export function Menu() {
  const member = useContext(MemberContext);
  const isConnected = member.level > 0;

  return (
    <div
      style={{
        borderRight: "1px solid #E0E0E0",
        width: 300,
        height: "100vh",
        marginRight: 30
      }}
    >
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raid management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button={true}>
                <Link href="/raid">
                  <ListItemText primary="Raids Dashboard" />
                </Link>
              </ListItem>
            )}
            <ListItem button={true}>
              <Link href="/raid/list">
                <ListItemText primary="See raid list" />
              </Link>
            </ListItem>
          </List>
          <Divider />
          <List>
            <ListSubheader>Merit management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button={true}>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button={true}>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
          </List>
          <Divider />
          <List>
            <ListSubheader>Player management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button={true}>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button={true}>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
          </List>
          <Divider />

          <List>
            <ListSubheader>Loot management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button={true}>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button={true}>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
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
          <ListItem button={true}>
            <Link href="/login">
              <ListItemText primary="Login page" />
            </Link>
          </ListItem>
        </List>
      )}
    </div>
  );
}
