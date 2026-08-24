import { Time } from "octane-ui";
import { Clock } from "octane-icons/lucide";

export function TimeExamples() @{
  <>
    <Time aria-label="Start time" />
    <Time
      left={<Clock size={16} />}
      aria-label="Alarm"
      defaultValue="09:30"
    />
    <Time aria-label="With seconds" step={1} defaultValue="09:30:00" />
    <Time aria-label="Disabled" disabled defaultValue="18:00" />
  </>
}
