import { Input } from "@octaneui/core";
import { Search } from "@octaneui/icons/lucide";

export function InputExamples() @{
  <>
    <Input placeholder="Email address" />
    <Input left="$" placeholder="0.00" />
    <Input left={<Search size={16} />} placeholder="Search" />
    <Input right="⌘K" placeholder="Jump to…" />
    <Input left="$" right="USD" placeholder="Amount" />
    <Input disabled placeholder="Disabled" />
  </>
}
