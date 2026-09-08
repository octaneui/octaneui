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
        gap: var(--control-gap);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--control-height);
        padding: 0 var(--control-pad-x);
        border: 1px solid var(--control-border);
        border-radius: var(--radius);
        background: var(--control-bg);
        color: var(--control-text);
        font-size: var(--control-font-size);
        transition:
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:hover {
        border-color: color-mix(
          in srgb,
          var(--control-strong) 40%,
          var(--control-border)
        );
      }
      .root:focus-within {
        border-color: var(--control-strong);
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
        height: var(--control-height);
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
        color: var(--control-muted);
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        color: var(--control-text);
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
