import React from 'react';
import {
  Drawer,
  ListItem,
  ListItemText,
  ListItemIcon,
  List,
  Divider
} from '@material-ui/core';

// import { AppVersion } from '../AppVersion';

interface Props {
  width: number;
}

export function Menu({ width }: Props) {
  return (
    <div style={{ display: 'inline-block' }}>
      <div style={{ position: 'fixed', top: 5, left: 5 }}>
        {/* <MenuIcon onClick={() => setOpen(true)} /> */}
      </div>

      <Drawer variant="permanent" anchor="left">
        <div
          style={{ position: 'fixed', top: 5, left: 5, zIndex: 888888888888 }}
        >
          {/* <CloseMenuIcon onClick={() => setOpen(false)} /> */}
        </div>
        <List style={{ width: width }}>
          <h2 style={{ textAlign: 'center', marginTop: 55 }}>Update infos</h2>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // setModalInfoKillVisibility(true);
            }}
          >
            <ListItemIcon>{/* <GridPlus /> */}</ListItemIcon>
            <ListItemText primary="Add a boss kill ?" />
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // setModalCreateGuildVisibility(true);
            }}
          >
            <ListItemIcon>{/* <AddGuild /> */}</ListItemIcon>
            <ListItemText primary="Add your guild" />
          </ListItem>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // setModalCreateServerVisibility(true);
            }}
          >
            <ListItemIcon>{/* <AddServer /> */}</ListItemIcon>
            <ListItemText primary="Add your Server" />
          </ListItem>
        </List>
        <Divider />
        <List>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // setModalHelpVisibility(true);
            }}
          >
            <ListItemIcon>{/* <HelpIcon /> */}</ListItemIcon>
            <ListItemText primary="Help" />
          </ListItem>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // window.open('https://www.paypal.me/devilhunter/2', '_blank');
            }}
          >
            <ListItemIcon>{/* <CoinIcon /> */}</ListItemIcon>
            {/* <ListItemIcon>
              <BitcoinIcon />
            </ListItemIcon> */}
            <ListItemText primary="Thank me with a 🍺" />
          </ListItem>
          <ListItem
            button
            onClick={() => {
              // setOpen(false);
              // window.open(
              //   'https://github.com/DavidBabel/wow-classic-pve/issues/new/choose',
              //   '_blank'
              // );
            }}
          >
            <ListItemIcon>{/* <BugIcon /> */}</ListItemIcon>
            <ListItemText primary="Report a bug" />
          </ListItem>
          {/* <AppVersion width={listWidth} /> */}
        </List>
      </Drawer>
      {/* <ModalCreateServer
        isOpen={isModalCreateServerVisible}
        onClose={() => setModalCreateServerVisibility(false)}
      />
      <ModalCreateGuild
        serverName={currentServer}
        isOpen={isModalCreateGuildVisible}
        onClose={() => setModalCreateGuildVisibility(false)}
      />
      <ModalAddKillInfo
        isOpen={isModalInfoKillVisible}
        onClose={() => setModalInfoKillVisibility(false)}
      />
      <ModalHelp
        isOpen={isModalHelpVisible}
        onClose={() => setModalHelpVisibility(false)}
      /> */}
    </div>
  );
}
