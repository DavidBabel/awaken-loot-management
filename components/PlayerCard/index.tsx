import { Checkbox } from "@material-ui/core";
import { useState } from "react";
import { Player } from "../../lib/generatedTypes";
import { getClassImageUrl } from "../../lib/utils/image";

export function PlayerCard({
  name,
  classByClassId: { color, name: className },
  onClick
}: Player & { onClick: () => void }) {
  const [isChecked, setChecked] = useState(false);

  // const lastLootDate =

  return (
    <div
      style={{ backgroundColor: "#1D1D1D" }}
      onClick={() => {
        setChecked(!isChecked);
        onClick();
      }}
    >
      <Checkbox checked={isChecked} />
      <img
        style={{ width: 15 }}
        src={getClassImageUrl(className)}
        alt={className}
      />
      <span style={{ color }}>{name}</span>
    </div>
  );
}
