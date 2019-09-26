import {
  Button,
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader
  // ListItemAvatar
} from '@material-ui/core';
// import Link from 'next/link';
import { Boss, Raid } from '../../lib/generatedTypes';
// import Router from 'next/router';
// import { destroyCookie } from 'nookies';

interface Props {
  bosses: Boss[];
  onBossSelect: (newBossId: number) => void;
  raid: Raid;
}

export function RaidMenu({ raid, bosses, onBossSelect }: Props) {
  return (
    <List
      style={{
        borderRight: '1px solid #E0E0E0',
        width: 400,
        height: '100vh',
        marginRight: 30
      }}
    >
      <ListSubheader>{raid.donjonByDonjonId.name} bosses</ListSubheader>
      <Divider />
      {bosses.map((boss: Boss) => (
        <ListItem key={`menu-${boss.name}`} button={true}>
          {/* <ListItemAvatar /> */}
          <Button onClick={() => onBossSelect(boss.id)}>
            <ListItemText primary={boss.name} />
          </Button>
        </ListItem>
      ))}
    </List>
  );
}
