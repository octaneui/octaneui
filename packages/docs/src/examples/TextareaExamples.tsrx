import { Textarea } from "octane-ui";

export function TextareaExamples() @{
  <>
    <Textarea placeholder="Write a short bio…" />
    <Textarea rows={3} defaultValue="Already filled in." />
    <Textarea disabled placeholder="Disabled" />
  </>
}
