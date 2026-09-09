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
        min-height: var(--control-height);
        padding-inline-end: var(--control-padding-inline);
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--control-background);
        color: var(--control-text-primary);
        font-size: var(--control-font-size);
        overflow: hidden;
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:not(:has(.field:focus-visible)):has(.field:enabled):hover {
        border-color: var(--control-border-hover);
      }
      .root:has(.field:focus-visible) {
        border-color: var(--control-border-focus);
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
        height: var(--control-height);
        margin-right: var(--control-gap);
        padding-block: 0;
        padding-inline: var(--control-padding-inline);
        border: 0;
        border-radius: 0;
        border-right: 1px solid var(--control-border);
        background: var(--file-selector-button-background);
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
        height: var(--control-height);
        padding-inline-start: var(--control-padding-inline);
        background: var(--file-selector-button-background);
        color: var(--control-text-primary);
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
