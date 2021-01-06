import { Switch, SwitchProps, withStyles } from "@material-ui/core";

interface Props extends SwitchProps {
  baseColor: string;
}

export function ColoredSwitch({ baseColor, ...props }: Props) {
  const SwitchWithColor = withStyles({
    switchBase: {
      color: baseColor,
      "&$checked": {
        color: baseColor
      },
      "&$checked + $track": {
        backgroundColor: baseColor
      }
    },
    checked: {},
    track: {}
  })(Switch);

  return <SwitchWithColor {...props} />;
}
