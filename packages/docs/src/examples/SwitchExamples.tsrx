import { Switch } from "octane-ui";

export function SwitchExamples() @{
  <>
    <Switch defaultChecked>Dark mode</Switch>
    <Switch>Airplane mode</Switch>
    <Switch disabled>Disabled</Switch>
    <Switch disabled defaultChecked>Disabled, on</Switch>
  </>
}
