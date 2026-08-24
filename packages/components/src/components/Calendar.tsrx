import type { OctaneNode } from "octane";
import type { Octane } from "octane/jsx-runtime";

type CalendarNativeProps = Omit<
  Octane.InputHTMLAttributes<HTMLInputElement>,
  "className" | "type"
>;

export type CalendarType = "date" | "datetime-local" | "month" | "week";

export interface CalendarProps extends CalendarNativeProps {
  type?: CalendarType;
  left?: OctaneNode;
}

export function Calendar({
  type,
  left,
  style,
  ...rest
}: CalendarProps) @{
  <div class={["root", rest.class]} style={style}>
    @if (left) {
      <span class="slot">{left}</span>
    }
    <input {...rest} type={type ?? "date"} class="field" />

    <style>
      .root {
        --calendar-icon: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Crect x='2' y='3' width='12' height='11' rx='1.5' fill='none' stroke='black' stroke-width='1.5'/%3E%3Cpath fill='none' stroke='black' stroke-width='1.5' stroke-linecap='round' d='M2 6.5h12M5.5 2v2.5M10.5 2v2.5'/%3E%3C/svg%3E");
        display: flex;
        align-items: center;
        gap: var(--control-gap, 0.5rem);
        box-sizing: border-box;
        width: 100%;
        min-height: var(--control-height, 2.25rem);
        padding: 0 var(--control-pad-x, 0.75rem);
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
        height: var(--control-height, 2.25rem);
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
        background-color: var(--control-muted);
        mask: var(--calendar-icon) center / 1rem no-repeat;
      }
      .slot {
        display: inline-flex;
        flex-shrink: 0;
        align-items: center;
        justify-content: center;
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
