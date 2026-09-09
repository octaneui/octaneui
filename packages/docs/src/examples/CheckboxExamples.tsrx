import { Checkbox } from "@octaneui/core";

export function CheckboxExamples() @{
  <>
    <Checkbox defaultChecked>Email me updates</Checkbox>
    <Checkbox>Subscribe to the newsletter</Checkbox>
    <Checkbox disabled>Disabled</Checkbox>
    <Checkbox disabled defaultChecked>Disabled, on</Checkbox>
  </>
}
