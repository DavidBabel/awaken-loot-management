import DateFnsUtils from '@date-io/date-fns';
import {
  MuiPickersUtilsProvider,
  KeyboardDatePicker
} from '@material-ui/pickers';
import { format as formatDate } from 'date-fns';
import { Dispatch, SetStateAction } from 'react';

interface Props {
  selectedDate: string;
  setSelectedDate: Dispatch<SetStateAction<string>>;
}

export function DatePicker({ selectedDate, setSelectedDate }: Props) {
  const dateFormat = 'yyyy/MM/dd';
  const actualDate = selectedDate || formatDate(new Date(), dateFormat);
  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils}>
      <KeyboardDatePicker
        style={{ marginBottom: -5 }}
        disableToolbar
        variant="inline"
        format="MM/dd/yyyy"
        margin="normal"
        id="date-picker-inline"
        label="Date picker inline"
        value={actualDate}
        onChange={(newDate: Date) => {
          setSelectedDate(formatDate(newDate, dateFormat));
        }}
        KeyboardButtonProps={{
          'aria-label': 'change date'
        }}
      />
    </MuiPickersUtilsProvider>
  );
}
