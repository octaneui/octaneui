import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type CheckboxNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface CheckboxProps extends CheckboxNativeProps {
  children?: OctaneNode;
}

export function Checkbox({ children, style, ...rest }: CheckboxProps) @{
  <label class={["root", rest.class]} style={style}>
    <input {...rest} type="checkbox" class="field" />
    <span class="box" aria-hidden="true" />
    @if (children) {
      <span class="label">{children}</span>
    }

    <style>
      .root {
        --check-icon: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' d='M3.5 8.5l3 3 6-6'/%3E%3C/svg%3E");
        position: relative;
        display: inline-flex;
        align-items: center;
        gap: var(--control-gap, 0.5rem);
        color: var(--control-text);
        font-size: var(--control-font-size, 0.9375rem);
        line-height: 1.3;
        cursor: pointer;
        user-select: none;
      }
      .root:has(.field:disabled) {
        opacity: 0.55;
        cursor: not-allowed;
      }
      .field {
        position: absolute;
        width: 1px;
        height: 1px;
        margin: 0;
        padding: 0;
        overflow: hidden;
        clip: rect(0 0 0 0);
        white-space: nowrap;
        border: 0;
      }
      .box {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;
        width: 1.125rem;
        height: 1.125rem;
        border: 1px solid var(--control-border);
        border-radius: 0.35rem;
        background: var(--control-bg);
        transition:
          background 0.15s ease,
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .field:checked + .box {
        border-color: var(--control-accent);
        background: var(--control-accent);
        background-image: var(--check-icon);
        background-repeat: no-repeat;
        background-position: center;
        background-size: 0.75rem;
      }
      .field:indeterminate + .box {
        border-color: var(--control-accent);
        background: var(--control-accent);
      }
      .field:indeterminate + .box::after {
        content: "";
        width: 0.55rem;
        height: 0.125rem;
        border-radius: 999px;
        background: var(--control-accent-fg, #fff);
      }
      .root:hover .field:not(:disabled) + .box {
        border-color: color-mix(
          in srgb,
          var(--control-accent) 40%,
          var(--control-border)
        );
      }
      .field:focus-visible + .box {
        box-shadow: var(--control-ring);
      }
    </style>
  </label>
}
