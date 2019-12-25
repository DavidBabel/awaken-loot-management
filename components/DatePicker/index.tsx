import DateFnsUtils from "@date-io/date-fns";
import {
  KeyboardDatePicker,
  MuiPickersUtilsProvider
} from "@material-ui/pickers";
import { Dispatch, SetStateAction } from "react";
import { formatDate } from "../../lib/utils/date";

interface Props {
  selectedDate: string;
  setSelectedDate: Dispatch<SetStateAction<string>>;
}

export function DatePicker({ selectedDate, setSelectedDate }: Props) {
  const actualDate = selectedDate || formatDate(new Date());
  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils}>
      <KeyboardDatePicker
        style={{ marginBottom: -5 }}
        disableToolbar={true}
        variant="inline"
        format="dd/MM/yyyy"
        margin="normal"
        id="date-picker-inline"
        label="Date picker inline"
        value={actualDate}
        onChange={(newDate: Date) => {
          setSelectedDate(formatDate(newDate));
        }}
        KeyboardButtonProps={{
          "aria-label": "change date"
        }}
      />
    </MuiPickersUtilsProvider>
  );
}
