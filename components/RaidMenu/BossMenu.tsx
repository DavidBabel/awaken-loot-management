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
import { Boss, BossItem } from '../../lib/generatedTypes';
// import Router from 'next/router';
// import { destroyCookie } from 'nookies';

interface Props {
  onItemSelect: (newItemId: number) => void;
  boss: Boss;
}

export function BossMenu({ boss, onItemSelect }: Props) {
  const bossItems: BossItem[] = boss.bossItemsByBossId.nodes;
  return (
    <List
      style={{
        borderRight: '1px solid #E0E0E0',
        width: 400,
        height: '100vh',
        marginRight: 30
      }}
    >
      <ListSubheader>{boss.name} loots</ListSubheader>
      <Divider />
      {bossItems.map((bossItem: BossItem) => {
        const item = bossItem.itemByItemId;
        return (
          <ListItem key={`item-${boss.name}-${item.name}`} button={true}>
            {/* <ListItemAvatar /> */}
            <Button onClick={() => onItemSelect(item.id)}>
              <ListItemText primary={item.name} />
            </Button>
          </ListItem>
        );
      })}
    </List>
  );
}
