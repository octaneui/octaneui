import { Slider } from "@octaneui/core";

export function SliderExamples() @{
  <>
    <Slider aria-label="Volume" defaultValue={40} />
    <Slider
      aria-label="Rating"
      min={0}
      max={10}
      step={1}
      defaultValue={7}
    />
    <Slider
      aria-label="Temperature"
      list="temps"
      min={0}
      max={100}
      defaultValue={50}
    />
    <datalist id="temps">
      <option value="0" />
      <option value="25" />
      <option value="50" />
      <option value="75" />
      <option value="100" />
    </datalist>
    <Slider aria-label="Disabled" defaultValue={30} disabled />
  </>
}
