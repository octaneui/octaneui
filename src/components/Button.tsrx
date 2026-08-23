import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

export interface ButtonProps extends Octane.ButtonHTMLAttributes<HTMLButtonElement> {
  left?: OctaneNode;
  right?: OctaneNode;
}

export function Button({
  left,
  right,
  children,
  class: className,
  className: classNameProp,
  type,
  ...rest
}: ButtonProps) @{
  <button
    type={type ?? "button"}
    class={["root", className, classNameProp]}
    {...rest}
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
        gap: var(--control-gap, 0.5rem);
        box-sizing: border-box;
        min-height: var(--control-height, 2.25rem);
        padding: 0 var(--control-pad-x, 0.75rem);
        border: 1px solid transparent;
        border-radius: var(--radius, 0.625rem);
        background: var(--control-accent);
        color: var(--control-accent-fg, #fff);
        font-family: inherit;
        font-size: var(--control-font-size, 0.9375rem);
        font-weight: 600;
        line-height: 1;
        cursor: pointer;
        user-select: none;
        appearance: none;
        transition:
          filter 0.15s ease,
          box-shadow 0.15s ease;
      }
      .root:hover:not(:disabled) {
        filter: brightness(1.08);
      }
      .root:active:not(:disabled) {
        filter: brightness(0.95);
      }
      .root:focus-visible {
        outline: none;
        box-shadow: var(--control-ring);
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
