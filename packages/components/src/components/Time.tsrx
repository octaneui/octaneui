import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type TimeNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export interface TimeProps extends TimeNativeProps {
  left?: OctaneNode;
}

export function Time({ left, style, ...rest }: TimeProps) @{
  <div class={["root", rest.class]} style={style}>
    @if (left) {
      <span class="slot">{left}</span>
    }
    <input {...rest} type="time" class="field" />

    <style>
      .root {
        --time-icon: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Ccircle cx='8' cy='8' r='6' fill='none' stroke='black' stroke-width='1.5'/%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' d='M8 5v3.5L10 11'/%3E%3C/svg%3E");
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
        cursor: pointer;
      }
      .field:disabled {
        cursor: not-allowed;
      }
      .field::-webkit-calendar-picker-indicator {
        width: 1rem;
        height: 1rem;
        margin: 0;
        padding: 0;
        cursor: pointer;
        background: none;
        background-color: var(--control-text);
        mask: var(--time-icon) center / 1rem no-repeat;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
        color: var(--control-text);
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
