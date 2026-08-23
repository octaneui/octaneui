import { Button } from "../../../src/index.tsrx";

function PlusIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <path
      d="M8 3.5V12.5M3.5 8H12.5"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
    />
  </svg>
}

function ArrowIcon() @{
  <svg
    width="16"
    height="16"
    viewBox="0 0 16 16"
    fill="none"
    aria-hidden="true"
  >
    <path
      d="M3.5 8H12.5M12.5 8L8.5 4M12.5 8L8.5 12"
      stroke="currentColor"
      strokeWidth="1.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    />
  </svg>
}

export function ButtonDocs() @{
  <section class="page">
    <h1 class="title">Button</h1>
    <p class="lede">
      Button with optional left and right slots for icons or extra labels.
    </p>
    <div class="preview">
      <div class="preview-row">
        <Button>Save</Button>
        <Button left={<PlusIcon />}>Add item</Button>
        <Button right={<ArrowIcon />}>Continue</Button>
        <Button left={<PlusIcon />} right={<ArrowIcon />}>
          Export
        </Button>
        <Button disabled>Disabled</Button>
      </div>
    </div>
  </section>
}
