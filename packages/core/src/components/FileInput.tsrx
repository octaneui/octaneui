import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type FileInputNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface FileInputProps extends FileInputNativeProps {
  left?: OctaneNode;
}

export function FileInput({ left, style, ...rest }: FileInputProps) @{
  <div class={["root", rest.class]} style={style}>
    @if (left) {
      <span class="slot">{left}</span>
    }
    <input {...rest} type="file" class="field" />

    <style>
      .root {
        display: flex;
        align-items: center;
        box-sizing: border-box;
        width: 100%;
        min-height: var(--oc-control-height);
        padding-inline-end: var(--oc-control-padding-inline);
        border: 1px solid var(--oc-control-border);
        border-radius: var(--oc-border-radius);
        background: var(--oc-control-background);
        color: var(--oc-control-text-primary);
        font-size: var(--oc-control-font-size);
        overflow: hidden;
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:not(:has(.field:focus-visible)):has(.field:enabled):hover {
        border-color: var(--oc-control-border-hover);
      }
      .root:has(.field:focus-visible) {
        border-color: var(--oc-control-border-focus);
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        flex: 1;
        min-width: 0;
        width: 100%;
        margin: 0;
        padding: 0;
        border: 0;
        background: transparent;
        color: inherit;
        font: inherit;
        outline: none;
        cursor: pointer;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .field::file-selector-button {
        height: var(--oc-control-height);
        margin-right: var(--oc-control-gap);
        padding-block: 0;
        padding-inline: var(--oc-control-padding-inline);
        border: 0;
        border-radius: 0;
        border-right: 1px solid var(--oc-control-border);
        background: var(--oc-file-selector-button-background);
        color: inherit;
        font: inherit;
        font-weight: 600;
        cursor: pointer;
      }
      .field:disabled::file-selector-button {
        cursor: not-allowed;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        align-self: stretch;
        height: var(--oc-control-height);
        padding-inline-start: var(--oc-control-padding-inline);
        background: var(--oc-file-selector-button-background);
        color: var(--oc-control-text-primary);
        line-height: 1;
        pointer-events: none;
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </div>
}
