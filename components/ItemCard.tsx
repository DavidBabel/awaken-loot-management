import { useState } from 'react';
import { Item } from '../lib/generatedTypes';
import { ClassItemCard } from './ClassItemCard';
import { LootCard } from './LootCard';
import { ListCards } from './ListCards';

interface Props extends Item {
  boss: string;
}

export function ItemCard({
  boss,
  // id,
  name,
  wowheadId,
  classItemsByItemId: { nodes: classes },
  lootsByItemId: { nodes: loots }
}: Props) {
  const [showClasses, setShowClasses] = useState(false);
  const toggleShowClasses = () => setShowClasses(!showClasses);

  const countLootByClass = {};
  const lootList = loots.map(loot => {
    const {
      playerByPlayerId: {
        classByClassId: { name: currentClass }
      }
    } = loot;
    countLootByClass[currentClass] = (countLootByClass[currentClass] || 0) + 1;
    return <LootCard key={boss + wowheadId + loot.id} {...loot} />;
  });

  return (
    <div>
      <a
        onClick={(e: React.MouseEvent<HTMLAnchorElement, MouseEvent>) => {
          e.preventDefault();
          toggleShowClasses();
        }}
        href={`https://fr.classic.wowhead.com/item=${wowheadId}`}
      >
        {name}
      </a>
      {showClasses && (
        <ListCards
          display={classes.map(classe => (
            <ClassItemCard
              {...classe}
              countLootByClass={countLootByClass}
              key={boss + wowheadId + classe.id}
            />
          ))}
          or={<div>No class assigned</div>}
        />
      )}
      {showClasses && (
        <ListCards display={lootList} or={<div>Never looted</div>} />
      )}
    </div>
  );
}
