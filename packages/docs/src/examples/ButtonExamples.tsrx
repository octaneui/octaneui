import { Button } from "octane-ui";
import { ArrowRight, Plus } from "octane-icons/lucide";

export function ButtonExamples() @{
  <>
    <Button>Save</Button>
    <Button left={<Plus size={16} />}>Add item</Button>
    <Button right={<ArrowRight size={16} />}>Continue</Button>
    <Button left={<Plus size={16} />} right={<ArrowRight size={16} />}>
      Export
    </Button>
    <Button disabled>Disabled</Button>
  </>
}