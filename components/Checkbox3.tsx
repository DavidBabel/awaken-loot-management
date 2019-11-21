import { Checkbox as MaterialCheckbox, withStyles } from "@material-ui/core";
import { CheckboxProps } from "@material-ui/core/Checkbox";
import { green } from "@material-ui/core/colors";

export type Checkbox3State = 0 | 1 | 2;

interface Props {
  state: Checkbox3State;
  disabled?: boolean;
  onClick: (state: Checkbox3State) => void;
}

const GreenCheckbox = withStyles({
  root: {
    color: green[400],
    "&$checked": {
      color: green[600]
    }
  },
  checked: {}
})(props => <MaterialCheckbox color="default" {...props} />);

export function Checkbox3({ disabled = false, state, onClick }: Props) {
  let Checkbox: React.ComponentType<CheckboxProps>;
  switch (state) {
    case 0:
      Checkbox = (props: CheckboxProps) => (
        <MaterialCheckbox checked={false} {...props} />
      );
      break;
    case 1:
      Checkbox = (props: CheckboxProps) => (
        <MaterialCheckbox checked={true} indeterminate={true} {...props} />
      );
      break;
    case 2:
      Checkbox = (props: CheckboxProps) => (
        <GreenCheckbox checked={true} {...props} />
      );
      break;
  }

  return (
    <Checkbox
      disabled={disabled}
      onClick={() => {
        const nextState = (state + 1) % 3;
        onClick(nextState as Checkbox3State);
      }}
    />
  );
}
