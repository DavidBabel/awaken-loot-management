import React, { useContext } from 'react';
import {
  ListItem,
  ListItemText,
  // ListItemIcon,
  List,
  Divider,
  ListSubheader
} from '@material-ui/core';
import Link from 'next/link';
import MemberContext from '../../lib/context/member';
import { role } from '../../lib/role-level';
import { destroyCookie } from 'nookies';
import Router from 'next/router';

// import { AppVersion } from '../AppVersion';

function resetToken() {
  destroyCookie({}, 'member');
  Router.push('/');
}

export function Menu() {
  const member = useContext(MemberContext);
  const isConnected = member.level > 0;

  return (
    <div
      style={{
        borderRight: '1px solid #E0E0E0',
        width: 250,
        height: '100vh',
        marginRight: 30
      }}
    >
      {isConnected ? (
        <>
          <List>
            <ListSubheader>Raid management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button>
                <Link href="/">
                  <ListItemText primary="Create raid" />
                </Link>
              </ListItem>
            )}
            <ListItem button>
              <Link href="/">
                <ListItemText primary="See raid list" />
              </Link>
            </ListItem>
          </List>
          <Divider />
          <List>
            <ListSubheader>Merit management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
          </List>
          <Divider />
          <List>
            <ListSubheader>Player management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
          </List>
          <Divider />

          <List>
            <ListSubheader>Loot management</ListSubheader>
            {member.level >= role.officer && (
              <ListItem button>
                <Link href="/">
                  <ListItemText primary="Approve merit for a character" />
                </Link>
              </ListItem>
            )}
            <ListItem button>
              <Link href="/">
                <ListItemText primary="Update your character merit" />
              </Link>
            </ListItem>
          </List>
          <Divider />

          <List>
            <ListSubheader>Connected as {member.name}</ListSubheader>
            <ListItem button onClick={resetToken}>
              <ListItemText primary="Disconnect" />
            </ListItem>
          </List>
        </>
      ) : (
        <List>
          <ListSubheader>please connect</ListSubheader>
          <ListItem button>
            <Link href="/login">
              <ListItemText primary="Login page" />
            </Link>
          </ListItem>
        </List>
      )}
    </div>
  );
}
