import { Textarea } from "@octaneui/core";

export function TextareaExamples() @{
  <>
    <Textarea placeholder="Write a short bio…" />
    <Textarea rows={3} defaultValue="Already filled in." />
    <Textarea disabled placeholder="Disabled" />
  </>
}
