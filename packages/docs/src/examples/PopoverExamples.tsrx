import { Button, Popover } from "@octaneui/core";

export function PopoverExamples() @{
  <>
    <Button command="toggle-popover" commandfor="demo-popover">
      Account
    </Button>
    <Popover id="demo-popover">
      Signed in as alex@example.com
    </Popover>
  </>
}
