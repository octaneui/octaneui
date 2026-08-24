import { Radio, RadioGroup } from "octane-ui";

export function RadioExamples() @{
  <>
    <RadioGroup legend="Plan">
      <Radio name="plan" value="free" defaultChecked>
        Free
      </Radio>
      <Radio name="plan" value="pro">
        Pro
      </Radio>
      <Radio name="plan" value="enterprise" disabled>
        Enterprise
      </Radio>
    </RadioGroup>
  </>
}
