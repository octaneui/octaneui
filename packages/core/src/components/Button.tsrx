import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type ButtonNativeProps = Omit<
  Octane.ButtonHTMLAttributes<HTMLButtonElement>,
  "className"
>;

export type ButtonSize = "normal" | "compact";
export type ButtonVariant = "primary" | "secondary" | "ghost";

export interface ButtonProps extends ButtonNativeProps {
  left?: OctaneNode;
  right?: OctaneNode;
  size?: ButtonSize;
  variant?: ButtonVariant;
}

export function Button({
  left,
  right,
  children,
  type,
  size = "normal",
  variant = "primary",
  ...rest
}: ButtonProps) @{
  <button
    type={type ?? "button"}
    {...rest}
    class={["root", size, variant, rest.class]}
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
        gap: var(--oc-control-gap);
        box-sizing: border-box;
        min-height: var(--oc-control-height);
        padding-block: 0;
        padding-inline: var(--oc-control-padding-inline);
        border: 1px solid var(--oc-control-border);
        border-radius: var(--oc-border-radius);
        background: var(--oc-button-background);
        color: var(--oc-button-text);
        font-family: inherit;
        font-size: var(--oc-control-font-size);
        font-weight: 600;
        line-height: 1;
        cursor: pointer;
        user-select: none;
        appearance: none;
        transition:
          background 0.15s ease,
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .primary:hover:not(:disabled) {
        background: var(--oc-button-background-hover);
      }
      .secondary {
        background: transparent;
        color: var(--oc-control-text-primary);
      }
      .secondary:hover:not(:disabled) {
        background: var(--oc-surface-background-hover);
        border-color: var(--oc-control-border-hover);
      }
      .ghost {
        background: transparent;
        border-color: transparent;
        color: var(--oc-control-text-primary);
      }
      .ghost:hover:not(:disabled) {
        background: var(--oc-surface-background-hover);
      }
      .compact {
        min-height: 2rem;
        padding-inline: 0.5rem;
        gap: 0.375rem;
        font-size: 0.8125rem;
      }
      .root:focus-visible {
        outline: 2px solid var(--oc-control-accent);
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
      .compact .slot :where(svg) {
        width: 0.875rem;
        height: 0.875rem;
      }
    </style>
  </button>
}
