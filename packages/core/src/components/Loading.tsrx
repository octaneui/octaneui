import type { Octane } from "octane/jsx-runtime";
import type { OctaneNode } from "octane";
import { SpinningClock } from "./SpinningClock.tsrx";

export type LoadingSize = "small" | "medium" | "large";

const ICON_SIZE = {
  small: 16,
  medium: 24,
  large: 32,
} as const;

export interface LoadingProps extends Octane.HTMLAttributes<HTMLDivElement> {
  label?: OctaneNode;
  size?: LoadingSize;
}
export function Loading({ label, size = "medium", ...rest }: LoadingProps) @{
  <div {...rest} class={["root", size, rest.class]}>
    <SpinningClock
      width={ICON_SIZE[size]}
      height={ICON_SIZE[size]}
      aria-hidden="true"
    />
    @if (label) {
      <span class="label">{label}</span>
    }

    <style>
      .root {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 0.375rem;
      }
      .label {
        font-size: 0.875rem;
      }
      .small {
        gap: 0.25rem;
      }
      .small .label {
        font-size: 0.75rem;
      }
      .large {
        gap: 0.5rem;
      }
      .large .label {
        font-size: 1rem;
      }
    </style>
  </div>
}
