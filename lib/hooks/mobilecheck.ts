import { useEffect, useState } from "react";

export function useOnMobile(): boolean {
  const [onMobile, setOnMobile] = useState(true);
  function handleResize() {
    if (window) {
      if (window.innerWidth < 900 && !onMobile) {
        setOnMobile(true);
      } else if (window.innerWidth >= 900 && onMobile) {
        setOnMobile(false);
      }
    }
  }
  useEffect(() => {
    handleResize();
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  });
  return onMobile;
}
