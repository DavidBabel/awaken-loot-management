import { useState } from 'react';
import { Boss } from '../lib/generatedTypes';
import { ItemCard } from './ItemCard';

export function BossCard({
  id,
  name,
  bossItemsByBossId: { nodes: loots }
}: Boss) {
  const [showLoots, setShowLoots] = useState(false);
  const toogleShowLoots = () => setShowLoots(!showLoots);

  return (
    <div>
      <h2 onClick={toogleShowLoots}>{name}</h2>
      {showLoots &&
        loots.map(loot => {
          return (
            <div key={name + loot.itemByItemId.name}>
              <ItemCard boss={name} {...loot.itemByItemId} />
            </div>
          );
        })}
    </div>
  );
}
