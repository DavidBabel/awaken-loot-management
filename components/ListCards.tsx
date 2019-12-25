interface Props {
  display: JSX.Element[];
  or: JSX.Element;
}
export function ListCards({ display, or }: Props) {
  if (display.length === 0) {
    return <>{or}</>;
  }
  return <>{display}</>;
}
