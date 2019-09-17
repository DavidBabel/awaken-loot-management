import { Merit } from "../../lib/generatedTypes";

type MeritState = "validated" | "empty" | "submitted";

export function MeritLine({
  // id,
  // categorie,
  name,
  // comment,
  // value,
  // active,
  playerMeritsByMeritId: { nodes: merit }
}: Merit) {
  let meritState: MeritState = "empty";
  if (merit[0]) {
    if (merit[0].active === true) {
      meritState = "validated";
    }
    if (merit[0].active === false) {
      meritState = "submitted";
    }
  }

  {
    return (
      <div>
        {name}: {meritState}
      </div>
    );
  }
}
