import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";
import { Check } from "@octaneui/icons/lucide";

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
    <span class="box" aria-hidden="true">
      <span class="check">
        <Check size={12} strokeWidth={3} />
      </span>
    </span>
    @if (children) {
      <span class="label">{children}</span>
    }

    <style>
      .root {
        position: relative;
        display: inline-flex;
        align-items: center;
        gap: var(--oc-control-gap);
        color: var(--oc-control-text-primary);
        font-size: var(--oc-control-font-size);
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
        border: 1px solid var(--oc-control-border);
        border-radius: 0.35rem;
        background: var(--oc-control-background);
        transition:
          background 0.15s ease,
          border-color 0.15s ease,
          box-shadow 0.15s ease;
      }
      .check {
        display: flex;
        color: var(--oc-control-accent-text);
        opacity: 0;
        pointer-events: none;
      }
      .field:checked + .box {
        background: var(--oc-control-accent);
      }
      .field:checked + .box .check {
        opacity: 1;
      }
      .field:indeterminate + .box {
        background: var(--oc-control-accent);
      }
      .field:indeterminate + .box .check {
        opacity: 0;
      }
      .field:indeterminate + .box::after {
        content: "";
        width: 0.55rem;
        height: 0.125rem;
        border-radius: 999px;
        background: var(--oc-control-accent-text);
      }
      .root:not(:has(.field:focus-visible)):has(.field:enabled):hover .field:not(:checked) + .box {
        border-color: var(--oc-control-border-hover);
      }
      .root:has(.field:focus-visible) .box {
        outline: 1px solid var(--oc-control-accent);
      }
    </style>
  </label>
}
