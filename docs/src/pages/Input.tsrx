import { Input } from "../../../src/index.tsrx";

function SearchIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <circle cx="7" cy="7" r="4.5" stroke="currentColor" strokeWidth="1.5" />
    <path
      d="M10.5 10.5L13.5 13.5"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
}

export function InputDocs() @{
  <section class="page">
    <h1 class="title">Input</h1>
    <p class="lede">
      Text field with optional left and right slots for icons, prefixes, or
      suffixes.
    </p>
    <div class="preview">
      <Input placeholder="Email address" />
      <Input left="$" placeholder="0.00" />
      <Input left={<SearchIcon />} placeholder="Search" />
      <Input right="⌘K" placeholder="Jump to…" />
      <Input left="$" right="USD" placeholder="Amount" />
      <Input disabled placeholder="Disabled" />
    </div>
  </section>
}
