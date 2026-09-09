import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type ButtonNativeProps = Omit<
  Octane.ButtonHTMLAttributes<HTMLButtonElement>,
  "className"
>;

export interface ButtonProps extends ButtonNativeProps {
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Button({
  left,
  right,
  children,
  type,
  ...rest
}: ButtonProps) @{
  <button
    type={type ?? "button"}
    {...rest}
    class={["root", rest.class]}
  >
    @if (left) {
      <span class="slot">{left}</span>
    }
    {children}
    @if (right) {
      <span class="slot">{right}</span>
    }

    <style>
      .root {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: var(--control-gap);
        box-sizing: border-box;
        min-height: var(--control-height);
        padding-block: 0;
        padding-inline: var(--control-padding-inline);
        border: 1px solid var(--control-border);
        border-radius: var(--border-radius);
        background: var(--button-background);
        color: var(--button-text);
        font-family: inherit;
        font-size: var(--control-font-size);
        font-weight: 600;
        line-height: 1;
        cursor: pointer;
        user-select: none;
        appearance: none;
        transition:
          background 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:hover:not(:disabled) {
        background: var(--button-background-hover);
      }
      .root:focus-visible {
        outline: 2px solid var(--control-accent);
      }
      .root:disabled {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        line-height: 1;
      }
      .slot :where(svg) {
        display: block;
        width: 1rem;
        height: 1rem;
      }
    </style>
  </button>
}
