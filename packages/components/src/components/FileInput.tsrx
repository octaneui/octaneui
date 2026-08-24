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
        gap: var(--control-gap, 0.5rem);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--control-height, 2.25rem);
        padding-right: var(--control-pad-x, 0.75rem);
        border: 1px solid var(--control-border);
        border-radius: var(--radius, 0.625rem);
        background: var(--control-bg);
        color: var(--control-text);
        font-size: var(--control-font-size, 0.9375rem);
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:hover {
        border-color: color-mix(
          in srgb,
          var(--control-accent) 40%,
          var(--control-border)
        );
      }
      .root:focus-within {
        border-color: var(--control-accent);
        box-shadow: var(--control-ring);
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
        height: var(--control-height, 2.25rem);
        margin-right: var(--control-gap, 0.5rem);
        padding: 0 var(--control-pad-x, 0.75rem);
        border: 0;
        border-right: 1px solid var(--control-border);
        background: color-mix(in srgb, CanvasText 6%, transparent);
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
        margin-left: var(--control-pad-x, 0.75rem);
        color: var(--control-muted);
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
