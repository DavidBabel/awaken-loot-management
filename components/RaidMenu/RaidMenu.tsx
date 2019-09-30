import {
  Button,
  Divider,
  List,
  ListItem,
  ListItemText,
  ListSubheader
  // ListItemAvatar
} from "@material-ui/core";
// import Link from 'next/link';
import { Boss, Raid } from "../../lib/generatedTypes";
// import Router from 'next/router';
// import { destroyCookie } from 'nookies';

interface Props {
  bosses: Boss[];
  onBossSelect: (newBossId: number) => void;
  goToLoots: () => void;
  raid: Raid;
}

export function RaidMenu({ raid, bosses, onBossSelect, goToLoots }: Props) {
  return (
    <List
      style={{
        borderRight: "1px solid #E0E0E0",
        width: 400,
        height: "100vh",
        marginRight: 30
      }}
    >
      <ListSubheader>See all current loots</ListSubheader>
      <ListItem button={true}>
        <Button onClick={() => goToLoots()}>
          <ListItemText primary="Loot list" />
        </Button>
      </ListItem>
      <Divider />
      <ListSubheader>{raid.donjonByDonjonId.name} bosses</ListSubheader>
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
