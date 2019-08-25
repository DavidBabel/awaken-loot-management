import { ClassItem } from '../lib/generatedTypes';

interface Props extends ClassItem {
  countLootByClass: { [className: string]: number };
}

export function ClassItemCard({
  countLootByClass,
  itemValueForThisClass,
  classByClassId: { color, name }
}: Props) {
  return (
    <div>
      <div />
      <div>
        <span style={{ color: color }}>{name}</span>
        {itemValueForThisClass}(loot {countLootByClass[name] || 0} times)
      </div>
    </div>
  );
}
