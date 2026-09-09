import { Select } from "@octaneui/core";
import { Globe } from "@octaneui/icons/lucide";

export function SelectExamples() @{
  <>
    <Select aria-label="Status" defaultValue="active">
      <option value="draft">Draft</option>
      <option value="active">Active</option>
      <option value="paused">Paused</option>
      <option value="archived">Archived</option>
    </Select>
    <Select left={<Globe size={16} />} aria-label="Region" defaultValue="eu">
      <option value="na">North America</option>
      <option value="eu">Europe</option>
      <option value="apac">Asia Pacific</option>
      <option value="latam">Latin America</option>
    </Select>
    <Select aria-label="Plan">
      <optgroup label="-- Personal --">
        <option value="free">Free</option>
        <option value="pro">Pro</option>
      </optgroup>
      <optgroup label="-- Team --">
        <option value="business">Business</option>
        <option value="enterprise" disabled>
          Enterprise
        </option>
      </optgroup>
    </Select>
    <Select disabled aria-label="Disabled" defaultValue="active">
      <option value="active">Active</option>
    </Select>
  </>
}
