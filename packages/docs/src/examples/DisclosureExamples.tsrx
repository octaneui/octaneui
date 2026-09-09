import { Disclosure } from "@octaneui/core";

export function DisclosureExamples() @{
  <>
    <Disclosure summary="Shipping">
      Orders ship within two business days. Tracking is emailed when the
      package leaves the warehouse.
    </Disclosure>
    <Disclosure summary="Returns" open>
      Returns are accepted within 30 days. Items must be unused and in original
      packaging.
    </Disclosure>
  </>
}
