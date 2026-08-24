import { Progress } from "octane-ui";

export function ProgressExamples() @{
  <>
    <Progress value={32} max={100} aria-label="32 percent" />
    <Progress value={7} max={10} aria-label="7 of 10" />
    <Progress aria-label="Loading" />
  </>
}
