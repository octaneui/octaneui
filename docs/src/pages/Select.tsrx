import { Select } from "../../../src/index.tsrx";

function GlobeIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <circle cx="8" cy="8" r="5.5" stroke="currentColor" strokeWidth="1.5" />
    <path
      d="M2.5 8H13.5M8 2.5C6.5 4.6 6.5 11.4 8 13.5M8 2.5C9.5 4.6 9.5 11.4 8 13.5"
      stroke="currentColor"
      strokeWidth="1.5"
    />
  </svg>
}

export function SelectDocs() @{
  <section class="page">
    <h1 class="title">Select</h1>
    <p class="lede">
      Native select with a fully styled dropdown via CSS{" "}
      <code>appearance: base-select</code>. Falls back to the OS picker where
      that is not supported.
    </p>
    <div class="preview">
      <Select aria-label="Status" defaultValue="active">
        <option value="draft">Draft</option>
        <option value="active">Active</option>
        <option value="paused">Paused</option>
        <option value="archived">Archived</option>
      </Select>
      <Select left={<GlobeIcon />} aria-label="Region" defaultValue="eu">
        <option value="na">North America</option>
        <option value="eu">Europe</option>
        <option value="apac">Asia Pacific</option>
        <option value="latam">Latin America</option>
      </Select>
      <Select aria-label="Plan">
        <optgroup label="Personal">
          <option value="free">Free</option>
          <option value="pro">Pro</option>
        </optgroup>
        <optgroup label="Team">
          <option value="business">Business</option>
          <option value="enterprise" disabled>
            Enterprise
          </option>
        </optgroup>
      </Select>
      <Select disabled aria-label="Disabled" defaultValue="active">
        <option value="active">Active</option>
      </Select>
    </div>
  </section>
}
