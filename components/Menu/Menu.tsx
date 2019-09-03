import React from 'react';
import {
  ListItem,
  ListItemText,
  // ListItemIcon,
  List,
  Divider,
  ListSubheader
} from '@material-ui/core';
import Link from 'next/link';

// import { AppVersion } from '../AppVersion';

interface Props {
  userRole: number;
}

const role = {
  GUEST: 0,
  PLAYER: 1,
  CLASS_MASTER: 2,
  OFFICER: 3,
  ADMIN: 4
};

function resetToken() {
  localStorage.setItem('auth_token', undefined);
  window.location.href = '/';
}

export function Menu({ userRole = 5 }: Props) {
  const isConnected = userRole > 0;
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
            {userRole >= role.OFFICER && (
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
            {userRole >= role.OFFICER && (
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
            {userRole >= role.OFFICER && (
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
            {userRole >= role.OFFICER && (
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
            {userRole >= role.OFFICER && (
              <ListItem button onClick={resetToken}>
                <ListItemText primary="Disconnect" />
              </ListItem>
            )}
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
