import { Calendar } from "octane-ui";
import { CalendarDays } from "octane-icons/lucide";

export function CalendarExamples() @{
  <>
    <Calendar aria-label="Start date" />
    <Calendar
      left={<CalendarDays size={16} />}
      aria-label="Event date"
      defaultValue="2026-08-24"
    />
    <Calendar type="month" aria-label="Billing month" />
    <Calendar type="datetime-local" aria-label="Appointment" />
    <Calendar aria-label="Disabled" disabled defaultValue="2026-08-24" />
  </>
}
