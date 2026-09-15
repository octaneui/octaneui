import { Button } from "@octaneui/core";

export function ButtonSizeExample() @{
  <>
    <Button size="compact">Compact</Button>
    <Button>Normal</Button>
    <Button size="compact" variant="secondary">
      Compact
    </Button>
    <Button variant="secondary">Normal</Button>
  </>
}
