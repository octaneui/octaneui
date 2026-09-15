import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type InputNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className"
>;

export interface InputProps extends InputNativeProps {
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Input({
  left,
  right,
  style,
  ...rest
}: InputProps) @{
  <div class={["root", rest.class]} style={style}>
    @if (left) {
      <span class="slot">{left}</span>
    }
    <input {...rest} class="field" />
    @if (right) {
      <span class="slot">{right}</span>
    }

    <style>
      .root {
        display: flex;
        align-items: center;
        gap: var(--oc-control-gap);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--oc-control-height);
        padding-block: 0;
        padding-inline: var(--oc-control-padding-inline);
        border: 1px solid var(--oc-control-border);
        border-radius: var(--oc-border-radius);
        background: var(--oc-control-background);
        color: var(--oc-control-text-primary);
        font-size: var(--oc-control-font-size);
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
        height: var(--oc-control-height);
        margin: 0;
        padding: 0;
        border: 0;
        background: transparent;
        color: inherit;
        font: inherit;
        outline: none;
        appearance: none;
      }
      .field::placeholder {
        color: var(--oc-control-placeholder-text);
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        color: var(--oc-control-text-primary);
        line-height: 1;
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </div>
}
