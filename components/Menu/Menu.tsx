import {
  Divider,
  List,
  ListItem,
  // ListItemIcon,
  ListItemText,
  ListSubheader
} from "@material-ui/core";
// import DashboardIcon from "@material-ui/icons/Dashboard";
import Link from "next/link";
import Router from "next/router";
import { destroyCookie } from "nookies";
import React, { useContext } from "react";
import MemberContext from "../../lib/context/member";
import { role } from "../../lib/role-level";

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
            {member.level >= role.officer && (
              <ListItem button={true}>
                <Link href="/raid">
                  <ListItemText primary="Raids Dashboard" />
                </Link>
              </ListItem>
            )}
          </List>
          <Divider />
          <List>
            <ListItem button={true}>
              <Link href="/summary">
                <ListItemText primary="Characters summary" />
              </Link>
            </ListItem>
            <ListItem button={true}>
              <Link href="/attendance">
                <ListItemText primary="Attendance" />
              </Link>
            </ListItem>
          </List>

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
