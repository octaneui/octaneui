import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type SwitchNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface SwitchProps extends SwitchNativeProps {
  children?: OctaneNode;
}

export function Switch({ children, style, ...rest }: SwitchProps) @{
  <label class={["root", rest.class]} style={style}>
    <input {...rest} type="checkbox" role="switch" class="field" />
    <span class="track" aria-hidden="true" />
    @if (children) {
      <span class="label">{children}</span>
    }

    <style>
      .root {
        position: relative;
        display: inline-flex;
        align-items: center;
        gap: var(--control-gap);
        color: var(--control-text-primary);
        font-size: var(--control-font-size);
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
      .track {
        position: relative;
        display: inline-block;
        flex-shrink: 0;
        box-sizing: border-box;
        width: 2.5rem;
        height: 1.5rem;
        border-radius: 999px;
        background: var(--control-track-background);
        transition:
          background 0.15s ease,
          box-shadow 0.15s ease;
      }
      .track::before {
        content: "";
        position: absolute;
        top: 0.125rem;
        left: 0.125rem;
        width: 1.25rem;
        height: 1.25rem;
        border-radius: 50%;
        background: var(--control-thumb-background);
        transition: translate 0.15s ease;
      }
      .field:checked + .track {
        background: var(--control-accent);
      }
      .field:checked + .track::before {
        translate: 1rem 0;
      }
      .root:has(.field:focus-visible) .track {
        outline: 1px solid var(--control-accent);
      }
    </style>
  </label>
}
