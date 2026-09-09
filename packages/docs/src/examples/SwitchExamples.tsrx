import { Switch } from "@octaneui/core";

export function SwitchExamples() @{
  <>
    <Switch defaultChecked>Dark mode</Switch>
    <Switch>Airplane mode</Switch>
    <Switch disabled>Disabled</Switch>
    <Switch disabled defaultChecked>Disabled, on</Switch>
  </>
}
