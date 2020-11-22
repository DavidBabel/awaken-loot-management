import { useState } from "react";

export function useToggle(defaultValue: boolean): [boolean, () => void] {
  const [isActive, setActive] = useState<boolean>(defaultValue);
  function toggleActive() {
    setActive(!isActive);
  }

  return [isActive, toggleActive];
}
